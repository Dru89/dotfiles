#!/usr/bin/env python

# Modified from an altnerative converted by Jason6Anderson
# found at http://code.google.com/p/vimwiki/issues/detail?id=384

import argparse
import os
import re
import shlex
import subprocess
import sys
import tempfile

PREFER_GITHUB_FLAVOR = False

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Use pandoc to convert vimwiki to html")
    parser.add_argument("force", type=bool, help="Overwrite previously existing html file.")
    parser.add_argument("syntax", help="The syntax of the file to be converted.  "
                                       "It should be able to theoreticall support anything that pandoc does.")
    parser.add_argument("extension", help="The extension of the input file.  For example: wiki, text, or md.")
    parser.add_argument("outputdir", help="The absolute path to the directory where the output HTML file will be "
                                          "created.")
    parser.add_argument("input_file", type=argparse.FileType('r'),
                        help="The file name (including absolute path) of the markdown formatted file to be converted "
                             "into HTML.")
    parser.add_argument("cssfile", help="The css file (with absolute path) to be referenced in the resulting HTML "
                                        "file.")
    parser.add_argument("template_path", help="The absolute path for all template files used.")
    parser.add_argument("default_template", help="The name of the default template.")
    parser.add_argument("template_ext", help="The extension used by template files.")
    parser.add_argument("root_path", help="A repeated set of ../ for pages buried in subdirectories.  For example: "
                                          "if you have a link [[dir1/dir2/dir3/my page]] then the root_path is "
                                          "'../../../'.")

    args = parser.parse_args()
    if args.syntax == 'markdown' and PREFER_GITHUB_FLAVOR:
        args.syntax = 'markdown_github'
    input_filename = os.path.basename(args.input_file.name)

    output_filename = "{}.html".format(os.path.splitext(input_filename)[0])
    output_filepath = os.path.join(args.outputdir, output_filename)

    def humanize(text):
        text = re.sub(r"_id$", "", text)
        text = text.replace("_", " ")
        text = re.sub(r"(?i)([a-z\d]*)", lambda m: m.group(1).lower(), text)
        text = re.sub(r"^\w", lambda m: m.group(0).upper(), text)
        return text

    def underscore(text, dashes=True):
        text = re.sub(r"([A-Z]+)([A-Z][a-z])", r'\1_\2', text)
        text = re.sub(r"([a-z\d])([A-Z])", r'\1_\2', text)
        if dashes:
            text = text.replace('-', '_')
        return text.lower()

    def titleize(text):
        return re.sub(r"\b('?[a-z])", lambda match: match.group(1).capitalize(), humanize(underscore(text, False)))

    class Preprocessor(object):
        def __init__(self, file_, syntax):
            self.file_name = file_.name
            self.file_text = file_.read()
            self.syntax = syntax

        def process(self):
            """Process the input file before converting it into HTML.

            Keyword arguments:
            text -- the input file as a string
            syntax -- the output syntax

            When the file type is markdown, this handles some of the weird things vimwiki does.
            It doesn't convert internal links nicely into markdown (even though we tell it the
            syntax is markdown), so we do that here (but only if the syntax matches 'markdown*').

            The following link patterns are handled:
                [[some link text]]
                [[link|description]]

            and they're turned into somethingl ike this:
                [some link text](some link text.html)

            """
            if self.syntax.startswith('markdown'):
                desc_link = re.compile(r'\[\[(?P<link>.+)\|(?P<desc>.+)\]\]')
                simple_link = re.compile(r'\[\[(?P<link>.+)\]\]')

                self.file_text = desc_link.sub('[\g<desc>](\g<link>.html)', self.file_text)
                self.file_text = simple_link.sub('[\g<link>](\g<link>.html)', self.file_text)

            patterns = {
                'title':    re.compile(r'^\s*%title\s+(?P<title>.+)\s*$'),
                'toc':      re.compile(r'^\s*%toc\s*(?P<toc>[^\n]*)\s*$'),
                'no_html':  re.compile(r'^\s*(?P<nohtml>%nohtml)\s*$'),
                'template': re.compile(r'^\s*%template\s*(?P<template>.*)\s*$'),
            }
            return self.__process_percent_codes(patterns)

        def get_template_file(self, template_path, template_ext='.html', default_template='default'):
            if not hasattr(self, 'percent_codes'):
                raise AttributeError("File has not been processed yet.  Can't determine template file.")
            if template_path == '-' or template_ext == '-':
                return None
            template = self.percent_codes['template'] or default_template
            return os.path.join(template_path, "{}{}".format(template, template_ext))

        @property
        def title(self):
            if not hasattr(self, 'percent_codes'):
                raise AttributeError("File has not been processed yet.  Can't determine title.")
            if 'title' in self.percent_codes and self.percent_codes['title'] and self.percent_codes['title'].strip():
                return self.percent_codes['title'].strip()
            else:
                return self.__format_title(os.path.splitext(os.path.basename(self.file_name))[0])

        def __process_percent_codes(self, patterns):
            """Look for formatting related percent codes in files.

            Keyword arguments:
            file_text -- the input file's text
            patterns  -- a dictionary of patterns to search for.  The following codes are used:
                                %nohtml
                                %toc [caption]
                                %title My Title
                                %template templatefile
            """
            lines_to_remove = []
            file_lines = self.file_text.splitlines(True)
            self.percent_codes = {key: None for key in patterns}
            for index, line in enumerate(file_lines):
                for key, pattern in patterns.iteritems():
                    match = pattern.search(line)
                    if match:
                        self.percent_codes[key] = match.group(1).strip()
                        lines_to_remove.insert(0, index)

            for line in lines_to_remove:
                file_lines.pop(line)

            self.file_text = "".join(file_lines)
            return self.file_text

        def __format_title(self, title):
            return titleize(title)

        def __getattr__(self, name):
            if hasattr(self, 'percent_codes') and name in getattr(self, 'percent_codes'):
                return getattr(self, 'percent_codes')[name]
            raise AttributeError("No attribute is defined for {}".format(name))

    if not args.force and os.path.exists(output_filepath):
        # Nothing to do.  Don't write anything.
        sys.exit(1)

    preprocessor = Preprocessor(args.input_file, args.syntax)
    processed = preprocessor.process()

    if preprocessor.no_html:
        print "Not creating an HTML file for {input}, due to the presence of %nohtml".format(args.input_file.name)
        sys.exit(2)

    _, tmppath = tempfile.mkstemp()
    with open(tmppath, 'w') as file_:
        file_.write(processed)

    variables = {
        'title': preprocessor.title,
    }

    if preprocessor.toc is not None:
        variables['toc-title'] = preprocessor.toc or "Contents"

    templatefile = preprocessor.get_template_file(args.template_path, args.template_ext, args.default_template)
    pandoc_args = {
        'syntax':    args.syntax,
        'output':    output_filepath,
        'template':  '--template="{template}"'.format(template=templatefile) if templatefile else "",
        'toc':       '--table-of-contents --toc-depth=2' if preprocessor.toc is not None else '',
        'variables': " ".join('-V {key}:"{value}"'.format(key=key, value=value)
                              for key, value in variables.iteritems()),
        'input':     tmppath,
        'css':       '--css="{cssfile}"'.format(cssfile=args.cssfile) if args.cssfile else ''
    }

    command = """
            pandoc --from "{syntax}" --to html --output "{output}" --smart --standalone \
                   {template} {toc} {variables} {css} "{input}"
    """
    formatted_command = command.strip().format(**pandoc_args)
    sys.exit(subprocess.Popen(shlex.split(formatted_command)).wait())

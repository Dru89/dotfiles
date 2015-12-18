require 'rake'
require 'erb'
require 'pathname'

NO_SYMLINK_DIRS = %w[config]
IGNORED_FILES   = %w[Rakefile README.md LICENSE]
SYMLINK_ALIASES = {"config/nvim" => ["vim"], "config/nvim/init.vim" => ["vimrc"]}

desc "test to make sure that all files get copied over"
task :setup_shell do
  install_oh_my_zsh
  switch_to_zsh
end

task :install => [:setup_shell] do
  process_folder()
  process_symlinks()
end

task :force => [:setup_shell] do
  process_folder(nil, replace_identical: true, replace_all: true)
  process_symlinks()
end

task :default => [:install]

def process_symlinks()
  SYMLINK_ALIASES.each do |file, aliases|
    aliases.each do |symlink_alias|
      replace_file(symlink_alias, file)
    end
  end
end

def process_folder(folder=nil, opts={})
  replace_all = opts[:replace_all] || false
  force_traverse = opts[:force_traverse] || false
  replace_identical = opts[:replace_identical] || false

  glob = '*'
  unless folder.nil?
    glob = File.join(folder, glob)
  end

  Dir[glob].each do |file|
    next if IGNORED_FILES.include?(file)
    filename = ".#{file.sub(/\.erb$/, '')}"
    abspath = File.join(ENV['HOME'], filename)

    if File.directory?(file) and (force_traverse or NO_SYMLINK_DIRS.include?(file))
      system %Q{mkdir -p "$HOME/.#{file}"}
      process_folder(file, replace_all: replace_all, replace_identical: replace_identical)
    elsif File.exist?(abspath) or File.symlink?(abspath)
      if File.identical?(file, abspath) and not replace_identical
        puts "identical ~/#{filename}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/#{filename}? [yNaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{filename}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file, source=nil)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file, source)
end

def link_file(file, source=nil)
  infile = file
  unless source.nil?
    infile = source
  end
  if file =~ /.erb$/
    print "generating ~/.#{file.sub(/\.erb$/, '')}"
    if source.nil?
      puts ""
    else
      puts " for #{source}"
    end
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(infile)).result(binding)
    end
  else
    print "linking ~/.#{file}"
    if source.nil?
      puts ""
    else
      puts " to #{source}"
    end
    system %Q{ln -s "$PWD/#{infile}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

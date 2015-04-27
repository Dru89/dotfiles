#!/usr/bin/python
import os
import re
import subprocess


def get_keychain_password(type_, account=None):
    if account is None:
        account = get_env('EMAIL_ADDRESS')

    params = {
        'security': '/usr/bin/security',
        'command': 'find-generic-password',
        'account': account,
        'type': type_,
        'keychain': '~/Library/Keychains/login.keychain',
    }

    command = "sudo -u $USER {security} -v {command} -g -a '{account}' -D '{type}' {keychain}".format(**params)
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)


def get_env(name):
    return os.environ[name]
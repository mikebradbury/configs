"""
Usage: python setup.py [-f|-u]

if no operands are given the script will generate symlinks for each config file
and will exit if the symlinks already exist.

-u  Uninstall removes symlinks only.
-f  Force generates symlinks even if they exist.
"""

import os, sys

SOURCE_PATH = os.path.dirname(os.path.realpath(__file__))
TARGET_PATH = os.path.expanduser("~")
CONFIG_FILES = [
        ("nvim/init.vim", ".config/nvim/init.vim"),
        ("zsh/.zshrc", ".zshrc"),
        ("zsh/.zshenv", ".zshenv"),
        ("zsh/.functions", ".functions"),
        ("zsh/.zsh_prompt", ".zsh_prompt"),
        ("zsh/.aliases", ".aliases"),
        ("git/.gitconfig", ".gitconfig"),
        ("git/.gitignore_global", "code/.gitignore_global"),
        ("tmux/.tmux.conf", ".tmux.conf"),
        ("vscode/settings.json", "Library/ApplicationSupport/Code/User/settings.json")]

PATHS_TO_INSTALL = [(
        os.path.join(SOURCE_PATH, SOURCE),
        os.path.join(TARGET_PATH, TARGET)) for SOURCE, TARGET in CONFIG_FILES]


def checkLocation(path_pairs):
    """if symlink exists, raise error and exit"""
    print("checking location...")
    for source, target in path_pairs:
        if os.path.lexists(target):
            raise ValueError(f"{target} exists, exiting.")


def install(path_pairs, uninstall_only=False):
    """if uninstall_only: just remove the existing links"""
    print("installing...")
    for link_target, link_name in path_pairs:
        #remove the path if it exists
        if uninstall_only:
            print(f"removing {link_name}")
        if os.path.islink(link_name):
            os.remove(link_name)
        if os.path.isdir(link_name):
            os.rmdir(link_name)
        elif os.path.exists(link_name):
            os.remove(link_name)

        if not uninstall_only:
            print(f"{link_name}\n\t-> {link_target}\n")
            os.symlink(link_target, link_name)


def run(args):
    """handle args and install/uninstall"""
    uninstall = False
    force = False
    if len(args) == 2 and args[1] == "-f":
        force = True
    elif len(args) == 2 and args[1] == "-u":
        uninstall = True
    elif len(args) != 1:
        raise ValueError("Incorrect Usage!\n" + __doc__)

    if not (force or uninstall):
        checkLocation(PATHS_TO_INSTALL)

    install(PATHS_TO_INSTALL, uninstall_only=uninstall)


if __name__ == '__main__':
    try:
       run(sys.argv)
    except ValueError as e:
        print(e)

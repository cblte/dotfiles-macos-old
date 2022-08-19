# Homebrew Bundle

Use this to backup and restore applications installed on your current system.

## Back up your installation

The command-line utility and application management jumps to a whole new level when tools allow you to back up your installation like any other dotfile in version control. Homebrew has that kind of functionality available to use under the dump subcommand. It generates a Brewfile, which is a reusable list of all the currently installed tools. To generate one from your installation, go into your preferred folder and run:

    $ cd ~/Development/dotfiles # This is my dotfile folder
    $ brew bundle dump

When I change machines and want to install the same applications with Homebrew, I go to the folder with the Brewfile and run:

    $ brew bundle 

It will install all the listed formulae and casks on my new machine.

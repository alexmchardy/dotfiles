# Dotfiles

### Moving in to a Mac

1. Change default shell to bash
    ```
    chsh -s /bin/bash
    ```

1. Install Homebew

    https://docs.brew.sh/Installation

    (May have to run `xcode-select --install` to install Xcode Command Line Tools first)

1. Install git
    ```
    brew install git
    ```

1. Generate an SSH key and add it to Github

    https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

1. Clone this repo
    ```
    git clone --recurse-submodules git@github.com:alexmchardy/dotfiles.git src/dotfiles
    ```

1. Run movin script to link dotfiles (backing up existing)
    ```
    ./src/dotfiles/bin/movin.sh -b
    ```

1. Open vim and run this command to install vim plugins
    ```
    :PluginInstall
    ```

1. Run brew-setup script
    ```
    ./src/dotfiles/bin/brew-setup.sh
    ```

1. Set brew-installed bash to default shell
    ```
    sudo bash -c 'which bash >> /etc/shells'
    chsh -s $(which bash)
    ```

1. Run osx-setup to get some nice default settings
    ```
    ./src/dotfiles/bin/osx-setup.sh
    ```

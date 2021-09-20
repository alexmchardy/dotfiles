# Dotfiles

### Moving in to a Mac

1. Install Homebew

    https://docs.brew.sh/Installation

1. Install git
    ```
    brew install git
    ```

1. Clone this repo
    ```
    git clone git@github.com:alexmchardy/dotfiles.git src/dotfiles
    ```

1. Run movin script to link dotfiles (backing up existing)
    ```
    src/dotfiles/bin/movin.sh -b
    ```

1. Run brew-setup script
    ```
    src/dotfiles/bin/brew-setup.sh
    ```

1. Run osx-setup to get some nice default settings
    ```
    src/dotfiles/bin/osx-setup.sh
    ```

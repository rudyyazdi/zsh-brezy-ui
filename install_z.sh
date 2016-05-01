#!/bin/sh

# Install homebrew if not currently installed
if [! command -v brew >/dev/null 2>&1]; then
  while true; do
    read -p "You do not have homebrew (it's a dependancy). Would you like to install it? " BREW
    case $BREW in
        [Yy]* )
          ./scripts/install_homebrew.sh
          break;;
        [Nn]* )
          exit;;
        * )
          echo "Please answer yes or no.";;
    esac
  done
  unset BREW
fi

# install zsh
brew install zsh zsh-completions

# install oh-my-Zsh
while true; do
  read -p "Would you like to install oh-my-Zsh? " OHMYZSH
  case $OHMYZSH in
      [Yy]* )
        curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
        echo "\nOh-My-Zsh installed\n"
        break;;
      [Nn]* )
        break;;
      * )
        echo "Please answer yes or no.";;
  esac
done

# install git-prompt
while true; do
  read -p "Would you like to install git-prompt? " GITPROMPT
  case $GITPROMPT in
      [Yy]* )
        curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
        echo "\nGit-Prompt installed\n"
        break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
  esac
done

#swap to Z shell
while true; do
  read -p "Would you like to swap your default shell to Z shell? " ZSH
  case $ZSH in
      [Yy]* )
        ./scripts/swap_to_Zsh.sh
        break;;
      [Nn]* )
        break;;
      * )
        echo "Please answer yes or no.";;
  esac
done
unset ZSH

#swap to Z shell
while true; do
  read -p "Would you like to import some useful run commands into your .zshrc? " RC
  case $RC in
      [Yy]* )
        ./scripts/import_rcs.sh $OHMYZSH $GITPROMPT
        break;;
      [Nn]* )
        break;;
      * )
        echo "Please answer yes or no.";;
  esac
done
unset RC

echo "\nSetup complete, please re-open your terminal for changes to take effect.\n"

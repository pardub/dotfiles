
# Zsh
sudo dnf -y install zsh

# zsh default shell
# sudo chsh -s /bin/zsh marc ## replaced by the command below
sudo chsh -s $(which zsh) $USER
cd $HOME
if [ -e "$HOME"/.zshenv ]
then rm "$HOME"/.zshenv
fi

# Download .zshenv
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/.zshenv

# Download .zshrc
mkdir -p "$HOME"/.config/zsh || exit
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/.zshrc

# Download .aliases
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/.aliases

# Downlaod zsh-functions
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/zsh-functions


# Install pluging zsh-syntax-highlighting
#sudo mkdir -p /usr/share/zsh/plugins
#sudo cd /usr/share/zsh/plugins/
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# sudo echo "# Load zsh-syntax-highlighting; should be last." >> $ZDOTDIR/.zshrc
#sudo echo '# Load zsh-syntax-highlighting; should be last.'   | sudo tee -a  $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshrc

# Install pluging zsh-syntax-highlighting
#sudo mkdir -p "$ZDOTDIR"/plugins || exit
#sudo cd "$ZDOTDIR"/plugins || exit
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install pluging zsh-autosuggestions
#sudo cd /usr/share/zsh/plugins/ || exit
#git clone https://github.com/zsh-users/zsh-autosuggestions.git
#sudo echo "# Load zsh-autosuggestions; should be last." >> $ZDOTDIR/.zshrc
#sudo echo "# Load zsh-syntax-autosuggestions; should be last." | sudo tee -a  $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshrc

# Install pluging zsh-autosuggestions
#sudo cd "$ZDOTDIR"/plugins || exit
#git clone https://github.com/zsh-users/zsh-autosuggestions.git
#cd || exit

# Install zsh git-completion
#mkdir -p ~/config/zsh
#cd ~/zsh || exit
#curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
##echo "zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh" >> $HOME/config/zsh/.zshrc
##echo 'fpath=(~/.zsh $fpath)'  >> $HOME/config/zsh/.zshrc
#rm $HOME/config/zsh/.zcompdump
#cd || exit




# Install pluging zsh-syntax-highlighting
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "# Load zsh-syntax-highlighting; should be last." >> $ZDOTDIR/.zshrc
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc

# Install pluging zsh-autosuggestions
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions.git
echo "# Load zsh-autosuggestions; should be last." >> $ZDOTDIR/.zshrc
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc

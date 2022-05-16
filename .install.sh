# Install pluging zsh-syntax-highlighting
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc

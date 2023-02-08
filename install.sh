ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/vimrc ~/.vimrc
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/config.clang-format ~/.clang-format 
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/dot_vim ~/.vim
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/command.sh ~/10_command.sh
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/config.zshrc ~/.zshrc


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/config.cmake-format.json ~/.cmake-format.json

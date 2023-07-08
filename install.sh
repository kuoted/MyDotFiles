ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/vimrc ~/.vimrc
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/config.clang-format ~/.clang-format 
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/dot_vim ~/.vim
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/command.sh ~/10_command.sh
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/config.zshrc ~/.zshrc
ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/cmake-format.yaml  ~/.cmake-format.yaml
#ln -sf ~/MyConfiguration_OnGitee/MyDotFiles/config.cmake-format.json ~/.cmake-format.json


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
python3 -m pip  install -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ cmake_format

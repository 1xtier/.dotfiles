#my dotfiles for linux
##Config .bashrc
  Первое устанавливаем oh-my-bash
```
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```
После чего выберем тему дл установки я выбрал *agnoster*
Установим ее, найдем строчку
```
OSH_THEME="theme defaults"
```
после чего перечитаем конфиг 
```
source ~/.bashrc
```
и склонируем репозиторий .mydofiles.

## My config VIM
Install vim bash-language server shellcheck
```bash
sudo dnf install vim bash-language-server shellcheck 
```
install vim plugins 

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


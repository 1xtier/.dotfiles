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

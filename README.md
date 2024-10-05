# my dotfiles for linux
## Справочка по работе с VIM 
### Открываем NERDTree 
- Комбинация <CTRL> + <T>  <CTRL> + <R>
###  Split 
- Горизонтально <CTRL> + <W> s        
- Вертикально <CTRL> + <W> v
- Перемешение <CTRL> + <W> 
## Config .bashrc
* Первое устанавливаем oh-my-bash
```
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```
После клонируем репозиторий в домашний каталог
```bash 
git clone https://github.com/h0lik/.dotfiles.git
```
после клонирования удаляем в домашнем каталоге файл .bashrc и создаем новый симлинк
```bash
cp .bashrc .bashrc.bak
ln -s /home/$USER/.dotfiles/.bashrc /home/$USER/
```
И перечитаем файл конфигурации
```bash
source ~/.bashrc
```
В конфигурации bash алиасы вынесены в отдельный файл *.bash_aliases*

## My config VIM
Тут тоже все просто первое что мы сделаем это удалим файл конфигурации 
```bash 
cp .vimrc .vimrc.bak
# я намеренно его не удаляю и просто добавляю пометку file.bak
```
Теперь создадим симлинк 
```bash
ln -s /home/$USER/.dotfiles/.vimrc /home/$USER/.vimrc
```

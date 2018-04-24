#!bin/bash

gitIns=$(which git)

[[ ! "$gitIns" ]] && sudo apt install git

mkdir ~/.icons/
git clone https://github.com/daniruiz/flat-remix 

cp -r flat-remix/Flat-Remix* ~/.icons/ &&
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Dark"

mkdir ~/.themes
git clone https://github.com/lassekongo83/zuki-themes
mv ~/zuki-themes/* ~/.themes

sudo add-apt-repository ppa:webupd8team/terminix
sudo apt update 
sudo apt install tilix

sudo apt install breeze-cursor-theme

git clone https://github.com/dirruk1/gnome-breeze
mv ~/gnome-breeze/Breeze* ~/.themes
mv ~/gnome-breeze/src ~/.themes

sudo apt install chrome-gnome-shell

iconToDelete=$(find ~/.icons -type f -iname "view-grid-symbolic.svg" | awk 'NR==2')
rm -rf $iconToDelete

cp /start-here-arch.svg ~/
mv start-here-arch.svg view-grid-symbolic.svg
mv view-grid-symbolic.svg ~/.icons/Flat-Remix-Dark/actions/symbolic/

# POWERLINE INSTALLATION

sudo apt-get install python-pip git

pip install --user git+git://github.com/Lokaltog/powerline

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

cp ~/firefox.svg ~/.icons/Flat-Remix-Dark/apps/scalable

sudo apt install unrar-free
# download xarchive from softwares 
# unrar 

dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n

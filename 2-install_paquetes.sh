#!/bin/bash
set -e


cd ~/Downloads

sudo pacman -S --needed --noconfirm  git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si


yay -S google-chrome --needed --noconfirm 


sudo pacman --noconfirm --needed -S flatpak docker docker-compose docker-buildx telegram-desktop mc gimp meld htop powertop p7zip curl unzip nmap jq ansible vlc geany dbeaver obsidian openssh obs-studio base-devel linux-headers kdiskmark tailscale fisher zoxide fzf links kustomize nodejs nss mkcert yq pyenv postgresql direnv kubectl resources libreoffice-fresh libreoffice-fresh-es okular poppler kdegraphics-mobipocket kdegraphics-thumbnailers deluge cpu-x stress


yay -S --needed --noconfirm  visual-studio-code-bin opera postgresql freelens-bin geekbench google-chrome-beta postman-bin pyenv pyenv-virtualenv lmstudio-bin komikku vivaldi waterfox-bin zotero-bin xone-dongle-firmware xone-dkms-git arkade pyenv-virtualenv opencode-desktop



#mover dir personal a workspace

rm -rf "$HOME/Documents"
rm -rf "$HOME/Downloads"
rm -rf "$HOME/Pictures"
rm -rf "$HOME/Videos"
rm -rf "$HOME/Music"
rm -rf "$HOME/Templates"
rm -rf "$HOME/Public"
rm -rf "$HOME/Desktop"


ln -s "$HOME/workspace/personal/Documents" "$HOME/Documents"
ln -s "$HOME/workspace/personal/Downloads" "$HOME/Downloads"
ln -s "$HOME/workspace/personal/Pictures" "$HOME/Pictures"
ln -s "$HOME/workspace/personal/Videos" "$HOME/Videos"
ln -s "$HOME/workspace/personal/Music" "$HOME/Music"
ln -s "$HOME/workspace/personal/Templates" "$HOME/Templates"
ln -s "$HOME/workspace/personal/Public" "$HOME/Public"
ln -s "$HOME/workspace/personal/Desktop" "$HOME/Desktop"


# Definir variables de ruta
ORIGEN="/home/fer/workspace/github/cachyos/personal/.config/user-dirs.dirs"
DESTINO="$HOME/.config/user-dirs.dirs"

# Comprobar si el archivo de origen existe
if [ -f "$ORIGEN" ]; then
    # Crear el directorio de destino si no existe
    mkdir -p "$HOME/.config"
    
    # Copiar y reemplazar el archivo
    cp "$ORIGEN" "$DESTINO"
    echo "Archivo copiado y reemplazado con éxito en $DESTINO"
else
    echo "Error: El archivo de origen no existe en $ORIGEN"
fi

xdg-user-dirs-update


#FISHER
# fisher install \
#     IlanCosman/tide \
#     PatrickF1/fzf.fish \
#     jorgebucaran/autopair.fish \
#     meaningful-ooo/sponge \
# 	jhillyerd/plugin-git


# tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Many icons' --transient=No


#FIX ICONO LM STUDIO
mkdir -p ~/.local/share/applications

cat > ~/.local/share/applications/ai.elementlabs.lmstudio.desktop <<'EOF'
[Desktop Entry]
Name=LM Studio
Type=Application
Exec=/usr/bin/lm-studio %U
Icon=lmstudio-bin
Terminal=false
Categories=Utility;
StartupWMClass=ai.elementlabs.lmstudio
MimeType=x-scheme-handler/lmstudio;
EOF

update-desktop-database ~/.local/share/applications
kbuildsycoca6



flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub org.pgadmin.pgadmin4



sudo systemctl enable sshd.service
sudo systemctl start sshd.service



sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo docker version
sudo usermod -aG docker $USER



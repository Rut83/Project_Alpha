clear
ls
systemctl poweroff
systemctl poweroff
weston --backend=drm-backend.so
weston --backend=drm-backend.so
systemctl poweroff
ldconfig
ldconfig -p | grep X11-xcb
pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run
seatd -g video &
sleep 1
export LIBSEAT_BACKEND=seatd
weston --backend=drm-backend.so
systemctl poweroff
pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run
seatd -g video &
sleep 1
export LIBSEAT_BACKEND=seatd
weston --backend=drm-backend.so
systemctl poweroff
ldconfig
ldconfig -p | grep libgcc_s
pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run
seatd -g video &
sleep 1
export LIBSEAT_BACKEND=seatd
weston --backend=drm-backend.so
systemctl poweroff
pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run
seatd -g video &
sleep 1
export LIBSEAT_BACKEND=seatd
weston --backend=drm-backend.so
systemctl poweroff
pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run
seatd -g video &
sleep 1
export LIBSEAT_BACKEND=seatd
weston --backend=drm-backend.so
systemctl poweroff
ldconfig -v
systemctl poweroff
ldconfig
weston --backend=drm-backend.so --use-pixman --shell=desktop
cat > /etc/profile.d/wayland.sh <<'EOF'
export LIBSEAT_BACKEND=seatd
export XDG_RUNTIME_DIR=/run/user/0
EOF

pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run /run/user/0
chmod 0700 /run/user/0
seatd -g video &
sleep 1
ls -l /run/seatd.sock
export LIBSEAT_BACKEND=seatd
export XDG_RUNTIME_DIR=/run/user/0
weston --backend=drm-backend.so --use-pixman --shell=desktop
ldconfig -p | grep libpng
systemctl poweroff
ldconfig
ldconfig -p | grep libpng
ldd /usr/bin/weston-terminal | grep "not found"
systemctl poweroff
ldconfig
ldconfig -p | grep -E "pango|fontconfig|freetype|Xrender|Xext"
ldd /usr/bin/weston-terminal | grep "not found"
systemctl powerof
systemctl poweroff
ldconfig
ldconfig -p | grep -E "harfbuzz|fribidi|thai|pangoft2|brotli|bz2|gmodule"
ldd /usr/bin/weston-terminal | grep "not found"
systemctl poweroff
mkdir -p /etc/xdg/weston
cat > /etc/xdg/weston/weston.ini << 'EOF'
[shell]
type=kiosk

[autolaunch]
path=/usr/bin/weston-terminal
EOF

cat /etc/xdg/weston/weston.ini
ls -l /usr/bin/weston-terminal
mkdir -p /run /run/user/0
chmod 0700 /run/user/0
pkill seatd || true
rm -f /run/seatd.sock
seatd -g video &
sleep 1
ls -l /run/seatd.sock
export LIBSEAT_BACKEND=seatd
export XDG_RUNTIME_DIR=/run/user/0
export LANG=C
export LC_ALL=C
weston   --backend=drm-backend.so   --use-pixman
ls
clear
w
clear
ls
ls
clear
clar
clear
systemctl poweroff
ls
clear
logout
exit
pkill seatd || true
rm -f /run/seatd.sock
mkdir -p /run /run/user/0
chmod 0700 /run/user/0
seatd -g video &
sleep 1
export LIBSEAT_BACKEND=seatd
export XDG_RUNTIME_DIR=/run/user/0
weston --backend=drm-backend.so --use-pixman
systemctl poweroff
display 
ls
clear
rm -rf hello-1.0-x86_64.spm 
clear
ls
mkdir Rut
cd Rut/
ls
cat > Hello.txt
ls
clear
cat Hello.txt 
clear
systemctl poweroff
clear
emerge
systemctl poeroff
systemctl poweroff
clear
python3 -c "print('Alpha is thinking in Python')"
clera
emerge
ldd /usr/bin/emerge
ln -sv /usr/bin/python3 /usr/bin/python
python --version
python3 --version
emerge
mkdir -p /usr/portage /etc/portage
emerge --sync
wget https://bootstrap.pypa.io/get-pip.py
systemctl disable systemd-resolved.service
systemctl mask systemd-resolved.service
ls -l /etc/resolv.conf
rm -f /etc/resolv.conf
cat > /etc/resolv.conf <<EOF
nameserver 1.1.1.1
nameserver 8.8.8.8
options timeout:2 attempts:3
EOF

chattr +i /etc/resolv.conf
ping -c 3 google.com
mkdir -p /etc/dhcp
cat > /etc/dhcp/dhclient.conf <<EOF
supersede domain-name-servers 1.1.1.1, 8.8.8.8;
EOF

wget https://bootstrap.pypa.io/get-pip.py
ls
python3 get-pip.py
ls /usr/include/openssl/ssl.h
gcc --version
make --version
ldd --version
systemctl poweroff
clear
ln -sf gcc /usr/bin/cc
ldconfig
gcc --version
make --version
ls ls -l /usr/bin/gcc
ls -l /usr/bin/make
echo $PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
gcc --version
mount
echo /*
echo "I am running from:"; mount | grep ' on / '
systemctl poweroff

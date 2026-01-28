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
ls
cut -d: -f1,3 /etc/passwd
for u in $(awk -F: '$3 >= 1000 {print $1}' /etc/passwd); do     userdel -r "$u" 2>/dev/null || true; done
cat > /etc/passwd <<'EOF'
root:x:0:0:root:/root:/bin/bash
EOF

cat > /etc/shadow <<'EOF'
root:*:19700:0:99999:7:::
EOF

cat > /etc/group <<'EOF'
root:x:0:
wheel:x:10:
EOF

cat > /etc/gshadow <<'EOF'
root:*::
wheel:*::
EOF

rm -rf /home/*
mkdir -p /root
chown root:root /root
chmod 700 /root
passwd root
chown root:root /etc/passwd /etc/shadow /etc/group /etc/gshadow
chmod 644 /etc/passwd /etc/group
chmod 600 /etc/shadow /etc/gshadow
touch /var/log/wtmp /var/log/btmp
chmod 664 /var/log/wtmp /var/log/btmp
cat > /etc/nsswitch.conf <<'EOF'
passwd: files
group:  files
shadow: files

hosts:  files dns
services: files
EOF

for u in shadow testuser portage; do     userdel -r "$u" 2>/dev/null || true; done
cut -d: -f1,3 /etc/passwd
usermod -u 0 -g 0 -d /root -s /bin/bash root
mkdir -p /root
chown root:root /root
chmod 700 /root
groupadd -g 81 messagebus 2>/dev/null || true
useradd  -u 81 -g messagebus -d / -s /sbin/nologin messagebus 2>/dev/null || true
groupadd -r polkitd 2>/dev/null || true
useradd  -r -g polkitd -d / -s /sbin/nologin polkitd 2>/dev/null || true
getent passwd nobody
chown root:root /etc/passwd /etc/shadow /etc/group /etc/gshadow
chmod 644 /etc/passwd /etc/group
chmod 600 /etc/shadow /etc/gshadow
touch /var/log/wtmp /var/log/btmp
chmod 664 /var/log/wtmp /var/log/btmp
cat > /etc/nsswitch.conf <<'EOF'
passwd: files
group:  files
shadow: files

hosts:  files dns
services: files
netgroup: files
EOF

awk -F: '{print $1 ":" $3 ":" $7}' /etc/passwd
useradd -r -s /sbin/nologin systemd-network
useradd -r -s /sbin/nologin systemd-resolve
useradd -r -s /sbin/nologin systemd-timesync
useradd -r -s /sbin/nologin systemd-coredump
useradd -r -s /sbin/nologin systemd-oom
systemctl start systemd-networkd
awk -F: '{print $1 ":" $3 ":" $7}' /etc/passwd
exit
grep '^root:' /etc/passwd
grep '^root:' /etc/shadow
passwd root
passwd root
passwd root
grep '^root:' /etc/shadow
cat /etc/securetty
cat > /etc/securetty <<'EOF'
tty1
tty2
tty3
tty4
tty5
tty6
ttyS0
EOF

cat > /etc/pam.d/login <<'EOF'
#%PAM-1.0

auth       required   pam_securetty.so
auth       required   pam_env.so
auth       required   pam_unix.so

account    required   pam_unix.so

password   required   pam_unix.so

session    required   pam_limits.so
session    required   pam_unix.so
EOF

ls -l /etc/passwd /etc/shadow
chmod 644 /etc/passwd
chmod 600 /etc/shadow
chown root:root /etc/passwd /etc/shadow
ls -l /etc/passwd /etc/shadow
exit
passwd root
clear
grep '^root:' /etc/shadow
ls /lib/security/pam_unix.so /lib64/security/pam_unix.so 2>/dev/null
nix-env -iA nixpkgs.pam
ls /nix/store/*-pam-*/lib/security/pam_unix.so
mkdir -p /lib/security /lib64/security
PAMDIR=$(dirname $(ls /nix/store/*-pam-*/lib/security/pam_unix.so))
ln -s $PAMDIR/pam_unix.so    /lib/security/pam_unix.so
ln -s $PAMDIR/pam_env.so     /lib/security/pam_env.so
ln -s $PAMDIR/pam_limits.so  /lib/security/pam_limits.so
ln -s $PAMDIR/pam_securetty.so /lib/security/pam_securetty.so 2>/dev/null || true
ls -l /lib/security/pam_*.so
passwd root
grep '^root:' /etc/shadow
ldd /bin/login | grep pam
mkdir -p /lib/security /lib64/security
PAMBASE=/nix/store/3ccwp233h2cxk472x9si9vavhbbdngmf-linux-pam-1.7.1/lib/security
ln -sf $PAMBASE/pam_unix.so       /lib/security/pam_unix.so
ln -sf $PAMBASE/pam_env.so        /lib/security/pam_env.so
ln -sf $PAMBASE/pam_limits.so     /lib/security/pam_limits.so
ln -sf $PAMBASE/pam_securetty.so  /lib/security/pam_securetty.so
ln -sf /lib/security/pam_unix.so      /lib64/security/pam_unix.so
ln -sf /lib/security/pam_env.so       /lib64/security/pam_env.so
ln -sf /lib/security/pam_limits.so    /lib64/security/pam_limits.so
ln -sf /lib/security/pam_securetty.so /lib64/security/pam_securetty.so
ls -l /lib/security/pam_unix.so
passwd root
grep '^root:' /etc/shadow
ldd /bin/login | grep pam
ls /nix/store/*libxcrypt*/lib/libcrypt.so*
mkdir -p /lib /lib64
ln -sf /nix/store/bjzcn2mi0vi0wpn5hpn213vfqhyd3yng-libxcrypt-4.5.2/lib/libcrypt.so.2 /lib/libcrypt.so.2
ln -sf /lib/libcrypt.so.2 /lib/libcrypt.so
ln -sf /lib/libcrypt.so.2 /lib64/libcrypt.so.2
ln -sf /lib/libcrypt.so.2 /lib64/libcrypt.so
ls -l /lib/libcrypt.so*
passwd root
passwd root
grep '^root:' /etc/shadow
ldd /bin/login | grep crypt
ldd /bin/login | grep crypt
ls /etc/login.defs
cat > /etc/login.defs <<'EOF'
# Password hashing method
ENCRYPT_METHOD SHA512

# SHA rounds (reasonable default)
SHA_CRYPT_MIN_ROUNDS 5000
SHA_CRYPT_MAX_ROUNDS 5000

# Password aging defaults
PASS_MAX_DAYS 99999
PASS_MIN_DAYS 0
PASS_WARN_AGE 7

# UID/GID ranges
UID_MIN 1000
UID_MAX 60000
GID_MIN 1000
GID_MAX 60000

# Home permissions
UMASK 022
EOF

passwd root
grep '^root:' /etc/shadow
ldd /bin/login | grep crypt
which passwd
ls -l $(which passwd)
ldd $(which passwd)
ls /nix/store/*shadow*/bin/passwd
rm -f /usr/bin/passwd /bin/passwd
ln -s /nix/store/xxxx-shadow-*/bin/passwd /usr/bin/passwd
chown root:root /usr/bin/passwd
chmod 4755 /usr/bin/passwd
rm -f /usr/bin/passwd
ls -l /usr/bin/passwd
ls /nix/store/*shadow*/bin/passwd
ln -s /nix/store/86fly2n8c31ws3lqs9wrx4vzpg2fpazk-shadow-4.18.0/bin/passwd /usr/bin/passwd
chown root:root /usr/bin/passwd
chmod 4755 /usr/bin/passwd
ls -l /usr/bin/passwd
which passwd
ldd /usr/bin/passwd
passwd root
grep '^root:' /etc/shadow
passwd root
readlink -f "$(command -v passwd)"
ls -l "$(command -v passwd)"
ldd "$(command -v passwd)"
nix-shell -p shadow --run "cp -a /nix/store/*shadow*/bin/passwd $ROOTFS/usr/bin/passwd"
chown root:root /usr/bin/passwd
chmod 4755 /usr/bin/passwd
ldd /usr/bin/passwd | grep pam
passwd root
grep '^root:' /etc/shadow
echo 'USE_TCB no' >> /etc/login.defs
rm -rf /etc/tcb
passwd root
grep '^root:' /etc/shadow
python3 - <<'EOF'
import crypt, getpass
pw = "Rut12345"
print(crypt.crypt(pw, crypt.mksalt(crypt.METHOD_SHA512)))
EOF

sed -i 's|^root:[^:]*:|root:sed -i 's|^root:[^:]*:|root:$6$randomsalt$verylonghash:|' /etc/shadow
:|' /etc/shadow
sed -i 's|^root:[^:]*:|root:sed -i 's|^root:[^:]*:|root:$6$randomsalt$verylonghashsu - shadow
sudo id
:|' /etc/shadow
:|' /etc/shadow
clear
su - shadow
sudo id
echo 'rescue:x:0:0:Rescue Root:/root:/bin/bash' >> /etc/passwd
echo 'rescue::20480:0:99999:7:::' >> /etc/shadow
grep '^rescue:' /etc/passwd
grep '^rescue:' /etc/shadow
grep ttyS0 /etc/securetty || echo ttyS0 >> /etc/securetty
sed -i '/^rescue:/d' /etc/passwd
sed -i '/^rescue:/d' /etc/shadow
clear
exit
cat > /etc/passwd <<'EOF'
root:x:0:0:root:/root:/bin/bash
shadow:x:1000:1000:Shadow User:/home/shadow:/bin/bash
EOF

cat > /etc/group <<'EOF'
root:x:0:
wheel:x:10:shadow
shadow:x:1000:
EOF

cat > /etc/shadow <<'EOF'
root:!:20480:0:99999:7:::
shadow:!:20480:0:99999:7:::
EOF

chown root:root /etc/passwd /etc/shadow /etc/group
chmod 644 /etc/passwd /etc/group
chmod 600 /etc/shadow
mkdir -p /root /home/shadow
chown root:root /root
chown 1000:1000 /home/shadow
chmod 700 /root
chmod 755 /home/shadow
cat > /etc/pam.d/login <<'EOF'
# TEMPORARY BOOTSTRAP LOGIN
auth       required   pam_permit.so
account    required   pam_permit.so
password   required   pam_permit.so
session    required   pam_permit.so
EOF

cat > /etc/securetty <<'EOF'
tty1
tty2
tty3
tty4
tty5
tty6
ttyS0
EOF

exit
id
mount | grep ' / '
mount -o remount,rw /
openssl passwd -6
sed -i 's|^root:[^:]*:|root:$6$oCqRYHYReAN1YkK5$LLT1pMH0b4pbqbCk5FZJAXKku1IM84dAZy9EF0ZWF7p6c06dLVq2Qrft4foiaLI7B6VWgheLV4HuxqHp5omMt1:|' /etc/shadow
grep '^root:' /etc/shadow
cat /etc/pam.d/login
exit
sed -i 's|^root:[^:]*:|root::|' /etc/shadow
grep '^root:' /etc/shadow
cat > /etc/pam.d/login <<'EOF'
# TEMPORARY password-less root login
auth       required   pam_env.so
auth       required   pam_unix.so nullok
account    required   pam_unix.so
session    required   pam_limits.so
session    required   pam_unix.so
EOF

grep -q '^ttyS0$' /etc/securetty || echo ttyS0 >> /etc/securetty
exit
systemctl disable serial-getty@ttyS0.service getty@tty1.service 2>/dev/null || true
cat > /etc/systemd/system/force-root-shell.service <<'EOF'
[Unit]
Description=Force Root Shell on ttyS0
After=basic.target
Conflicts=serial-getty@ttyS0.service

[Service]
ExecStart=/bin/bash
StandardInput=tty
StandardOutput=tty
StandardError=tty
TTYPath=/dev/ttyS0
TTYReset=yes
TTYVHangup=yes
TTYVTDisallocate=yes
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl enable force-root-shell.service
cat > /etc/passwd <<'EOF'
root:x:0:0:root:/root:/bin/bash
EOF

cat > /etc/group <<'EOF'
root:x:0:
EOF

cat > /etc/shadow <<'EOF'
root::0:0:99999:7:::
EOF

chown root:root /etc/passwd /etc/group /etc/shadow
chmod 644 /etc/passwd /etc/group
chmod 600 /etc/shadow
exit

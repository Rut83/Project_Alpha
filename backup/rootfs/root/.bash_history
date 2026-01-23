ls
clear
pwd
clear
ls
clear
cat >> ~/.bashrc << 'EOF'
if [ "$EUID" -eq 0 ]; then
    PS1="\[\033[1;31m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]# "
else
    PS1="\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ "
fi
EOF

source ~/.bashrc
clear
ls
cd
clear
cd ..
cd home/
cd shadow/
ls
clear
ls
cat sad.txt 
clear
rm -r sad.txt 
ls
clear
cd ..
cd ..
ls
rm -r libsystemd-shared-258-1.fc43.so 
ls
clear
ls
clear
clear
systemctl poweroff
cat >> ~/.bashrc << 'EOF'
if [ "$EUID" -eq 0 ]; then
    PS1="\[\033[1;31m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]# "
else
    PS1="\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ "
fi
EOF

source ~/.bashrc
clear
ls
spm
spm install hello-1.0-x86_64.spm 
ls
clear
hello
spm install hello-1.0-x86_64.spm 
systemctl poweroff
ls
clear
ls
clear
ping google.com
ping 8.8.8.8
wget
clear
systemctl status systemd-resolve.service
systemctl start systemd-resolve.service
systemctl start systemd-resolved.service
systemctl restart systemd-resolved.service
systemctl status systemd-resolved.service
clear
systemctl restart systemd-resolved.service
journalctl -xeu systemd-resolved.service
clear
clear
cat /etc/systemd/resolved.conf
systemctl --failed
clear
systemctl --failed
systemctl poweroff

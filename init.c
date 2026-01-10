#define _GNU_SOURCE
#include <unistd.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <stdio.h>
#include <errno.h>

static void m(const char *src, const char *tgt, const char *fs, unsigned long flags) {
    if (mount(src, tgt, fs, flags, NULL) < 0 && errno != EBUSY)
        perror(tgt);
}

int main(void) {
    setsid();

    mkdir("/proc", 0555);
    mkdir("/sys", 0555);
    mkdir("/dev", 0755);
    mkdir("/run", 0755);
    mkdir("/sys/fs", 0555);
    mkdir("/sys/fs/cgroup", 0555);
    mkdir("/dev/pts", 0755);

    m("proc",     "/proc", "proc",     0);
    m("sysfs",    "/sys",  "sysfs",    0);
    m("devtmpfs", "/dev",  "devtmpfs", 0);
    m("tmpfs",    "/run",  "tmpfs",    MS_NOSUID|MS_NODEV|MS_STRICTATIME);
    m("devpts",   "/dev/pts", "devpts", 0);
    m("cgroup2",  "/sys/fs/cgroup", "cgroup2", 0);

   execl("/bin/sh", "sh", NULL);    


    perror("exec systemd");
    for (;;)
        pause();
}

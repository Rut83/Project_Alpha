#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <errno.h>

static void mkdir_p(const char *path, mode_t mode)
{
    mkdir(path, mode);
}

int main(void)
{
    printf(">>> REAL INIT (C): starting, PID=%d\n", getpid());

    /* Mount essential filesystems (ignore EBUSY) */
    mount("proc", "/proc", "proc", 0, NULL);
    mount("sysfs", "/sys", "sysfs", 0, NULL);
    mount("devtmpfs", "/dev", "devtmpfs", 0, NULL);

    /* systemd requires /run */
    mkdir_p("/run", 0755);
    mount("tmpfs", "/run", "tmpfs", 0, "mode=755");

    /* systemd expects cgroups */
    mkdir_p("/sys/fs", 0755);
    mkdir_p("/sys/fs/cgroup", 0755);

    printf(">>> REAL INIT (C): exec systemd\n");

    execl(
        "/usr/lib/systemd/systemd",
        "systemd",
        NULL
    );

    /* If we get here, exec failed */
    perror("exec systemd failed");

    /* PID 1 must never exit */
    for (;;)
        pause();
}

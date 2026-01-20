#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

#define SPM_DB "/var/lib/spm"
#define TMPDIR "/tmp/spm"

void die(const char *msg) {
    perror(msg);
    exit(1);
}

void install_pkg(const char *pkg) {
    char cmd[512];
    char name[128] = {0};
    FILE *f;

    mkdir(SPM_DB, 0755);
    mkdir(TMPDIR, 0755);

    snprintf(cmd, sizeof(cmd), "tar -xf %s -C %s", pkg, TMPDIR);
    if (system(cmd) != 0) die("tar failed");

    f = fopen("/tmp/spm/meta.txt", "r");
    if (!f) die("meta.txt missing");

    fscanf(f, "name=%127s", name);
    fclose(f);

    char pkgdir[256];
    snprintf(pkgdir, sizeof(pkgdir), "%s/%s", SPM_DB, name);
    mkdir(pkgdir, 0755);

    snprintf(cmd, sizeof(cmd),
        "find %s/files -type f | sed 's#%s/files##' > %s/files.list",
        TMPDIR, TMPDIR, pkgdir);
    system(cmd);

    snprintf(cmd, sizeof(cmd), "cp -a %s/files/* /", TMPDIR);
    system(cmd);

    snprintf(cmd, sizeof(cmd), "cp %s/meta.txt %s/", TMPDIR, pkgdir);
    system(cmd);

    system("rm -rf " TMPDIR);
    printf("Installed %s\n", name);
}

void remove_pkg(const char *name) {
    char path[256];
    char file[512];
    FILE *f;

    snprintf(path, sizeof(path), "%s/%s/files.list", SPM_DB, name);
    f = fopen(path, "r");
    if (!f) die("package not installed");

    while (fgets(file, sizeof(file), f)) {
        file[strcspn(file, "\n")] = 0;
        unlink(file);
    }
    fclose(f);

    snprintf(path, sizeof(path), "%s/%s", SPM_DB, name);
    char cmd[512];
    snprintf(cmd, sizeof(cmd), "rm -rf %s", path);
    system(cmd);

    printf("Removed %s\n", name);
}

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("usage: spm install <pkg.tar> | spm remove <name>\n");
        return 1;
    }

    if (strcmp(argv[1], "install") == 0) {
        install_pkg(argv[2]);
    } else if (strcmp(argv[1], "remove") == 0) {
        remove_pkg(argv[2]);
    } else {
        printf("unknown command\n");
        return 1;
    }

    return 0;
}

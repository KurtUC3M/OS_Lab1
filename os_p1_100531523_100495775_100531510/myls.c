//P1-SSOO-23/24

#include <stdio.h>		// Header file for system call printf
#include <unistd.h>		// Header file for system call gtcwd
#include <sys/types.h>	// Header file for system calls opendir, readdir y closedir
#include <dirent.h>
#include <string.h>

#define PATH_MAX 4096

int main(int argc, char *argv[])
{

    // to hold path to directory
    char *dir_path;

    // if a dir_path is provided, use, ow, use cwd
    if (argc >= 2) {
        dir_path = argv[1];
    } else {
        char cwd[PATH_MAX];
        if (getcwd(cwd, sizeof(cwd)) != NULL) {
            dir_path = cwd;
        } else {
            // if getcwd returns null, error return -1
            perror("getcwd error");
            return -1;
        }
    }

    DIR *dir = opendir(dir_path);

    // if dir provided is invalid, return -1
    if (dir == NULL) {
        perror(("opendir error"));
        return -1;
    }

    // struct to hold directory entries
    struct dirent *entry;

    // while directory has more files, iterate thru each and print
    while ((entry = readdir(dir)) != NULL) {
        printf("%s\n", entry->d_name);
    }

    // close directory and return 0
    closedir(dir);

	return 0;
}


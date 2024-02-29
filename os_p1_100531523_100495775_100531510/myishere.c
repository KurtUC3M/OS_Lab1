//P1-SSOO-23/24

#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>
#include <string.h>


int main(int argc, char *argv[])
{
	char *dir_name;
    char *file_name;

    // if there are not enough arguments, return error -1, otherwise set dir/file_name
    if(argc < 3)
	{
		printf("Too few arguments\n");
		return -1;
	} else {
        dir_name = argv[1];
        file_name = argv[2];
    }

    // create DIR object ptr to hold the directory
    DIR *dir = opendir(dir_name);

    // if directory is invalid, return -1
    if (dir == NULL) {
        perror(("opendir error"));
        return -1;
    }

    // struct to hold file entries
    struct dirent *entry;

    // while loop to iterate thru all the files in a directory
    while ((entry = readdir(dir)) != NULL) {
        // compares string of input file to current file, if found, exit and say found
        if (strcmp(entry->d_name, file_name) == 0) {

            printf("File %s is in directory %s\n", file_name, dir_name);
            closedir(dir);
            return 0;

        }
    }


    // if loop finishes, file was not found in the directory, return 0, not an error but nothing
    // found
    printf("File %s is not in directory %s\n", file_name, dir_name);
    closedir(dir);
	return 0;
}

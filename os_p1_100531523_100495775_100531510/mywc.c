//P1-SSOO-23/24

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#define BUF_SIZE 4096


int main(int argc, char *argv[])
{
	// If less than two arguments, program and file, return error -1
	if(argc < 2)
	{
		printf("Too few arguments\n");
		return -1;
	}

    // Opening the file to be read
    int fd = open(argv[1], O_RDONLY);

    // if file is invalid, return error -1
    if (fd == -1) {
        perror("Unable to open file");
        return -1;
    }

    // variables to hold the buffer, current character, and nums of words, lines, bytes
    int ch;
    int words = 0, lines = 0, bytes = 0;
    char buffer[BUF_SIZE];

    // basically boolean to determine if we are inside a word or not
    int midWord = 0;

    // while loop for reading thru the file
    while ((ch = read(fd, buffer, BUF_SIZE)) > 0) { // read in a chunk 
        // add number of bytes of current character
        bytes += ch;

        // find total number of lines
        for (int i = 0; i < ch; i++) { // read over each element byte by byte
            if (buffer[i] == '\n') {
                lines++;
            }
            

            // Check for space, tab, or newline to count words
            if (buffer[i] == ' ' || buffer[i] == '\t' || buffer[i] == '\n') {
                // if was inside word, transition to whitespace
                midWord = 0;

                // if we werent in a word, and now are, change to inside word and ++ word value
            } else if (!midWord) {

                midWord = 1;
                words++;
            }
        }
    }

    // if ch==-1 an error occurs while file is read
    if (ch == -1) {
        perror("Error reading file");
        return -1;
    }

    // close open file
    close(fd);


    // print results
    printf("%d %d %d %s\n", lines, words, bytes, argv[1]);

	return 0;
}


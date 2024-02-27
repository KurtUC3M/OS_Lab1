//P1-SSOO-23/24

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#define BUF_SIZE 4096


int main(int argc, char *argv[])
{
	/*If less than two arguments (argv[0] -> program, argv[1] -> file to process) print an error y return -1*/
	if(argc < 2)
	{
		printf("Too few arguments\n");
		return -1;
	}

    // Opening the file to be read
    int fd = open(argv[1], O_RDONLY);

    // if file is invalid, return error -2
    if (fd == -1) {
        perror("Unable to open file");
        return -1;
    }

    // variables to hold the buffer, current character, and nums of words, lines, bytes
    int ch;
    int words = 0, lines = 0, bytes = 0;
    char buffer[BUF_SIZE];

    int insideWord = 0;

    // while loop for reading thru the file
    while ((ch = read(fd, buffer, BUF_SIZE)) > 0) {
        // add number of bytes of current character
        bytes += ch;

        // find total number of lines
        for (int i = 0; i < ch; i++) {
            if (buffer[i] == '\n') {
                lines++;
            }
            

            // Check for space, tab, or newline to count words
            if (buffer[i] == ' ' || buffer[i] == '\t' || buffer[i] == '\n') {
                // Transition from inside a word to a whitespace character
                insideWord = 0;
            } else if (!insideWord) {
                // Transition from a whitespace character to inside a word
                insideWord = 1;
                words++;
            }
        }
    }


    // close open file
    close(fd);

    // Check for the last word if the file doesn't end with a space, tab, or newline
//    if (ch > 0 && buffer[ch - 1] != ' ' && buffer[ch - 1] != '\t' && buffer[ch - 1] != '\n') {
//        words++;
//    }

    // print results
    printf("%d %d %d %s\n", lines, words, bytes, argv[1]);

	return 0;
}


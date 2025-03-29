#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    char str1[100], str2[100], result[10];

    int fd1 = open("fifo1", O_RDONLY);
    if (fd1 == -1) {
        perror("Error opening fifo1");
        exit(1);
    }

    read(fd1, str1, sizeof(str1));
    read(fd1, str2, sizeof(str2));
    close(fd1);

    printf("Process 2 (Reader) received:\n");
    printf("String 1: %s\n", str1);
    printf("String 2: %s\n", str2);

    if (strcmp(str1, str2) == 0)
        strcpy(result, "SAME");
    else
        strcpy(result, "NOT SAME");

    printf("Comparison result: %s\n", result);

    int fd2 = open("fifo2", O_WRONLY);
    if (fd2 == -1) {
        perror("Error opening fifo2");
        exit(1);
    }

    write(fd2, result, sizeof(result));
    close(fd2);

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    char str1[100], str2[100], result[10];
    
    int fd1 = open("fifo1", O_WRONLY);
    if (fd1 == -1) {
        perror("Error opening fifo1");
        exit(1);
    }

    printf("Enter first string: ");
    fgets(str1, sizeof(str1), stdin);
    str1[strcspn(str1, "\n")] = 0;

    printf("Enter second string: ");
    fgets(str2, sizeof(str2), stdin);
    str2[strcspn(str2, "\n")] = 0;

    write(fd1, str1, sizeof(str1));
    write(fd1, str2, sizeof(str2));
    close(fd1);

    int fd2 = open("fifo2", O_RDONLY);
    if (fd2 == -1) {
        perror("Error opening fifo2");
        exit(1);
    }

    read(fd2, result, sizeof(result));
    close(fd2);

    printf("Comparison Result: %s\n", result);
    return 0;
}


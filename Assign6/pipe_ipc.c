#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main() {
    int fd[2];
    pid_t pid;
    char message[100];

    if (pipe(fd) == -1) {
        perror("Pipe creation failed");
        return 1;
    }

    pid = fork();
    
    if (pid < 0) {
        perror("Fork failed");
        return 1;
    }

    if (pid == 0) { 
        close(fd[0]); 

        printf("Child: Enter a message: ");
        fgets(message, sizeof(message), stdin);
        message[strcspn(message, "\n")] = 0; 

        write(fd[1], message, strlen(message) + 1);
        close(fd[1]); 

    } else {
        close(fd[1]); 
        read(fd[0], message, sizeof(message));
        close(fd[0]); 

        printf("Parent: Received message - \"%s\"\n", message);
    }

    return 0;
}


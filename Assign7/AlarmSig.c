#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>


void handle_alarm(int sig) {
    printf("Parent: Received alarm signal from child. Signal = %d\n", sig);
}

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        perror("Fork failed");
    }
    else if (pid == 0) {
        // Child process
        sleep(3);
        printf("Child: Sending alarm signal to parent\n");
        kill(getppid(), SIGALRM);
    }
    else {
        // Parent process
        signal(SIGALRM, handle_alarm);
        pause();  
        wait(NULL);  
    }

    return 0;
}


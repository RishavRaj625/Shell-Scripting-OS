#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        printf("Fork failed!\n");
        return 1;
    } else if (pid == 0) {
        sleep(5);  
        printf("Orphan Child: PID = %d, PPID = %d\n", getpid(), getppid());
    } else {  
        printf("Parent Process Exiting: PID = %d\n", getpid());
        exit(0);
    }
    return 0;
}


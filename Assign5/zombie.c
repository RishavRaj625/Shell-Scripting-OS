#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        printf("Fork failed!\n");
        return 1;
    } else if (pid == 0) {
        printf("Child Process Exiting: PID = %d\n", getpid());
        exit(0);  
    } else {  
        printf("Parent Process: PID = %d, Child PID = %d\n", getpid(), pid);
        sleep(10); 
    }
    return 0;
}


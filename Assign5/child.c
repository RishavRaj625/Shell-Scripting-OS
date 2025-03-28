#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        printf("Fork failed!\n");
        return 1;
    } else if (pid == 0) {  
        printf("Child Process: PID = %d, PPID = %d\n", getpid(), getppid());
    } else {  
        printf("Parent Process: PID = %d, Child PID = %d\n", getpid(), pid);
        wait(NULL); 
    }
    return 0;
}


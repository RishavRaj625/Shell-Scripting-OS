#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>


int year;

void check_leap(int sig) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        printf("Child: %d is a leap year!\n", year);
    else
        printf("Child: %d is not a leap year.\n", year);
}

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        return 1;
    }
    else if (pid == 0) {
        // Child process
        printf("Child: Enter a year to check: ");
        scanf("%d", &year);
        signal(SIGUSR1, check_leap);
        while (1) {
            pause();  
        }
    }
    else {
        // Parent process
        while (1) {
            sleep(5);
            kill(pid, SIGUSR1); 
        }
    }

    return 0;
}


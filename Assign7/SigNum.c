#include<stdio.h>
#include<signal.h>
#include<sys/types.h>
#include<unistd.h>

void myhandler(int signo){
	printf("\n ouch!... got signal %d\n", signo);
	return;
}
int main(){
	signal(2, myhandler);
	while(1){
		printf("My PID is %d\n ", getpid());
	sleep(2);
      }
return 0;
}

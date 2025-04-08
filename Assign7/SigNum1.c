#include<stdio.h>
#include<signal.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>

void myhandler(int signo){

	static int  i=0;
	i++;	

	printf("\n ouch!... got signal %d\n, Count %d\n ", signo, i);
	
	if(i >=4){
		printf("Terminating : after 4th signal\n");
		exit(0);
	}
}

int main(){
	signal(2, myhandler);
	while(1){
		printf("My PID is %d\n ", getpid());
	        sleep(2);
      }
return 0;
}

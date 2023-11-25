#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

/**
 * infinite_while - sleeps forever
 *
 * Return: 0
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - createes five child processes
 *
 * Return: 0 (always)
 */

int main(void)
{
	pid_t zom;
	int j;

	for (j = 0; j < 5; j++)
	{
		zom = fork();
		if (zom == 0)
			printf("Zombie process created, PID: %d\n", getpid());
	}

	infinite_while();

	return (0);
}

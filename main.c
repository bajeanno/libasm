#include <assert.h>
#include "libasm.h"
#include <stdio.h>

int main() {
	char *str = "Salut florian!";
	char *str2 = "Salut florian caca!";
	assert(ft_strlen(str) == 14);
	printf("test 1: good\n");
	assert(ft_strlen(str2) == 19);
	printf("test 2: good\n");
	assert(ft_strlen("") == 0);
	printf("test 3: good\n");
	return 0;
}
#include <assert.h>
#include "libasm.h"
#include <stdio.h>

int main() {
	char *str = "Salut florian!";
	char str2[] = "Salut florian test!";
	assert(ft_strlen(str) == 14);
	printf("test 1: good\n");
	assert(ft_strlen(str2) == 19);
	printf("test 2: good\n");
	assert(ft_strlen("") == 0);
	printf("test 3: good\n");
	assert(ft_strcpy(str2, str) == str2);
	printf("test 4: good\n");
	printf("%s\n", str2);
	return 0;
}
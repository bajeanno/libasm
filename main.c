#include <assert.h>
#include "libasm.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/fcntl.h>
#include <stdbool.h>

void test_ft_strlen();
void test_ft_strcpy();
void test_ft_strcmp();
void test_ft_strdup();
void test_ft_write();
void test_ft_read();

int main() {
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_strdup();
	test_ft_write();
	test_ft_read();
	return 0;
}

void test_ft_strlen() {
	char *str1 = "Hello world";
	char *str2 = "";
	assert(ft_strlen(str1) == strlen(str1));
	assert(ft_strlen(str2) == strlen(str2));
	printf("ft_strlen tests passed!\n");
}

void test_ft_strcpy() {
	char dest1[20];
	char dest2[20];
	char *src = "Test string";
	assert(ft_strcpy(dest1, src) == dest1);
	strcpy(dest2, src);
	assert(strcmp(dest1, dest2) == 0);
	printf("ft_strcpy tests passed!\n");
}

void test_ft_strcmp() {
	char *s1 = "abc";
	char *s2 = "abc";
	char *s3 = "abd";
	char *s4 = "abb";
	assert(ft_strcmp(s1, s2) == strcmp(s1, s2));
	assert(ft_strcmp(s1, s3) == strcmp(s1, s3));
	assert(ft_strcmp(s1, s4) == strcmp(s1, s4));
	printf("ft_strcmp tests passed!\n");
}

void test_ft_strdup() {
	char *src = "Duplicate me";
	char *dest = ft_strdup(src);
	assert(strcmp(src, dest) == 0);
	free(dest);
	printf("ft_strdup tests passed!\n");
}

void test_ft_write() {
	int fd = open("test_write.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);
	char *str = "Writing test";
	ssize_t ret1 = ft_write(fd, str, strlen(str));
	close(fd);

	fd = open("test_write2.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);
	ssize_t ret2 = write(fd, str, strlen(str));
	close(fd);

	assert(ret1 == ret2);

	ret1 = ft_write(67, str, strlen(str));
	ret2 = write(67, str, strlen(str));

	assert(ret1 == ret2);

	printf("ft_write tests passed!\n");
}

void test_ft_read() {
	int fd = open("test_write.txt", O_RDONLY);
	char buf1[20] = {0};
	char buf2[20] = {0};

	ssize_t ret1 = ft_read(fd, buf1, 5);
	close(fd);

	fd = open("test_write.txt", O_RDONLY);
	ssize_t ret2 = read(fd, buf2, 5);
	close(fd);

	assert(ret1 == ret2);
	assert(strcmp(buf1, buf2) == 0);

	ret1 = read(67, buf1, 5);
	ret2 = read(67, buf2, 5);
	
	assert(ret1 == ret2);
	assert(strcmp(buf1, buf2) == 0);

	printf("ft_read tests passed!\n");
}

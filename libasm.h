#ifndef LIBASM_H
#define LIBASM_H
#include <stddef.h>
#include <sys/types.h>

int 		ft_strlen(char *str);
char		*ft_strcpy(char *dst, const char *src);
int			ft_strcmp(char *s1, char *s2);
ssize_t		ft_write(int filedes, const void *buf, size_t nbyte);
ssize_t		ft_read(int fildes, void *buf, size_t nbyte);
char		*ft_strdup(const char *s1);
int			ft_atoi_base(char *str, char *base);

#endif
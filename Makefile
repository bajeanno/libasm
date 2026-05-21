NAME = libasm.a

SRC_C		=	main.c

SRC_ASM		=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s \

HEADER	 	=	libasm.h

CXX			=	cc
CXXFLAGS	=	-MD
ASMXX		=	nasm
ASM_FLAGS	=	-felf64
OBJS_D	=	./
SRCS_D	=	./
# DEPENDS	=	$(SRC:%.c=%.d)
OBJ		=	$(SRC_ASM:%.s=%.o)
AR		=	ar rcs

all : $(NAME)

$(NAME) : $(OBJ)
	$(AR) $(NAME) $(OBJ)
	ranlib $(NAME)

$(OBJ)	: $(OBJS_D)%.o: $(SRCS_D)%.s
	$(ASMXX) $(ASM_FLAGS) $< -o $@

test: $(SRC_C) $(NAME)
	$(CXX) $(CXXFLAGS) $(SRC_C) $(NAME) -o test.out -I HEADER
	./test.out

clean:
	rm -rf $(OBJ)
	rm -rf $(DEPENDS)

fclean: clean
	rm -rf $(NAME)

re: fclean all

run: all
	@./$(NAME)

linux-docker: Dockerfile
	docker build --platform linux/amd64 --no-cache -t linux-dev .
run-docker: Dockerfile
	docker run --platform linux/amd64 -it -v "/Users/basil/42/ft_libasm":/home/dev/workspace linux-dev

.PHONY: all clean fclean re

# -include $(DEPENDS)

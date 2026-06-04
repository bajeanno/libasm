NAME = libasm.a
TEST_TARGET = test.out

TEST_SRC_C	=	main.c

SRC_ASM		=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s 

HEADER	 	=	libasm.h

CXX			=	cc
ASMXX		=	nasm
ASM_FLAGS	=	-felf64
OBJS_D	=	build
SRCS_D	=	src
OBJ		=	$(SRC_ASM:%.s=$(OBJS_D)/%.o)
AR		=	ar rcs
MKDIR	=	mkdir -p

all : $(NAME)

$(NAME) : $(OBJ)
	$(AR) $(NAME) $(OBJ)

$(OBJS_D)/%.o: $(SRCS_D)/%.s
	@$(MKDIR) $(@D)
	$(ASMXX) $(ASM_FLAGS) $< -o $@

$(TEST_TARGET): $(TEST_SRC_C) $(NAME)
	$(CXX) $(TEST_SRC_C) $(NAME) -o $(TEST_TARGET)

test: $(TEST_TARGET)
	./$(TEST_TARGET)

clean:
	rm -rf $(OBJ)
	rm -rf test_write.txt
	rm -rf test_write2.txt
	rm -rf $(TEST_TARGET)

fclean: clean
	rm -rf $(NAME)
	rm -rf $(OBJS_D)

re: fclean all

linux-docker: Dockerfile
	docker build --platform linux/amd64 --no-cache -t linux-dev .
run-docker: Dockerfile
	docker run --platform linux/amd64 -it -v "$(CURDIR)":/home/dev/libasm -w /home/dev/libasm linux-dev

.PHONY: all clean fclean re linux-docker run-docker

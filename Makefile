NAME = libasm.a

SRC_C		=	main.c

SRC_ASM		=	ft_strlen.s \
				ft_strcpy.s

HEADER	 	=	libasm.h

CXX			=	cc
CXXFLAGS	=	-Wall -Wextra -Werror -std=c89 -MD
ASMXX		=	nasm
ASM_FLAGS	=	-fmacho64
OBJS_D	=	./
SRCS_D	=	./
# DEPENDS	=	$(SRC:%.c=%.d)
OBJ		=	$(SRC_ASM:%.s=%.o)
AR		=	ar rcs
LD		=	ld

all : $(NAME)

$(NAME) : $(OBJ)
	$(AR) $(NAME) $(OBJ)

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

.PHONY: all clean fclean re

# -include $(DEPENDS)

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rquerino <rquerino@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/16 12:35:35 by rquerino          #+#    #+#              #
#    Updated: 2020/04/16 12:51:48 by rquerino         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

FILES = ft_read.s \
		ft_strcmp.s \
		ft_strcpy.s \
		ft_strdup.s \
		ft_strlen.s \
		ft_write.s 

OBJ = $(FILES:.s=.o)

%.o	: %.s
	nasm -f macho64 $< -o $@

$(NAME): $(OBJ) 
	ar rcs $(NAME) $(OBJ)

all: $(NAME)

clean:
	rm -f $(OBJ)

test: all
	gcc -Wall -Wextra -Werror main.c libasm.a -o test
	./test

fclean: clean
	rm -f $(NAME)
	rm -f test

re: fclean all
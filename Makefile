# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alesteph <alesteph@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/17 15:13:55 by alesteph          #+#    #+#              #
#    Updated: 2018/12/17 17:25:47 by alesteph         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GCC= gcc

FLAGS= -Wall -Werror -Wextra

FRAMEWORK= -framework OpenGL -framework AppKit

NAME= fdf

SRCS= $(shell find srcs -maxdepth 1 -type f -name "*.c")

INCLUDES= ./includes/

INCLUDES_MLX= /usr/local/include 

LIB_FT= ./srcs/libft/

LIB_MLX= /usr/local/lib

OBJS= $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	@(cd ./srcs/libft/ && $(MAKE) re)
	$(GCC) $(FLAGS) -o $(NAME) -L $(LIB_MLX) -lmlx -L $(LIB_FT) -lft -I $(INCLUDES) -I $(INCLUDES_MLX) $(OBJS) $(FRAMEWORK)

%.o: %.c
	$(GCC) $(FLAGS) -I $(INCLUDES) -o $@ -c $<

clean:
	rm -f $(OBJS)
	@(cd ./srcs/libft/ && $(MAKE) clean)

fclean: clean
	rm -f $(NAME)
	@(cd ./srcs/libft/ && $(MAKE) fclean)

re: fclean all

.PHONY: clean fclean

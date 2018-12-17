/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alesteph <alesteph@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/12/17 16:42:20 by alesteph          #+#    #+#             */
/*   Updated: 2018/12/17 17:15:20 by alesteph         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

static void	fdf(int fd)
{
	void	*mlx_ptr;
	void	*win_ptr;

	fd = 0;
	mlx_ptr = mlx_init();
	win_ptr = mlx_new_window(mlx_ptr, 800, 600, "test");
	mlx_loop(mlx_ptr);
}

int			main(int ac, char **av)
{
	int	fd;

	if (ac == 2)
	{
		fd = open(av[1], O_RDONLY);
		fdf(fd);
		close(fd);
	}
	else
		ft_putstr("usage: ./fdf map_name\n");
	return (0);
}

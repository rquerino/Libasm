/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rquerino <rquerino@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/15 18:13:34 by rquerino          #+#    #+#             */
/*   Updated: 2020/05/04 09:21:42 by rquerino         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void    check_ftstrlen()
{
	char    *str1 = "";
	char    *str2 = "42 Silicon Valley";
	char    *str3 = "Adsab** HBubjkaed ANSJK.!";

	printf("%s\n\n", "------TESTING FT_STRLEN:------");
	printf("str1 = %s\n", str1);
	printf("str2 = %s\n", str2);
	printf("str3 = %s\n\n", str3);
	printf("strlen(str1): %lu\nft_strlen(str1): %zu\n\n", strlen(str1), ft_strlen(str1));
	printf("strlen(str2): %lu\nft_strlen(str2): %zu\n\n", strlen(str2), ft_strlen(str2));
	printf("strlen(str3): %lu\nft_strlen(str3): %zu\n\n", strlen(str3), ft_strlen(str3));
	printf("------------------------------\n\n");
}


void    check_aux_ftstrcpy(char *tmp) {
	int i;

	i = 0;
	while (tmp[i]) {
		tmp[i] = 0;
		i++;
	}
}

void    check_ftstrcpy()
{
	char    tmp[15];
	char    *str1 = "";
	char    *str2 = "42 SV";
	char    *str3 = "Adsab** HB.!";

	printf("%s\n\n", "------TESTING FT_STRCPY:------");
	printf("str1 = %s\n", str1);
	printf("str2 = %s\n", str2);
	printf("str3 = %s\n\n", str3);
	
	printf("strcpy(str1): %s\n", strcpy(tmp, str1));
	check_aux_ftstrcpy(tmp);
	printf("ft_strcpy(str1): %s\n\n", ft_strcpy(tmp, str1));
	
	check_aux_ftstrcpy(tmp);
	printf("strcpy(str2): %s\n", strcpy(tmp, str2));
	check_aux_ftstrcpy(tmp);
	printf("ft_strcpy(str2): %s\n\n", ft_strcpy(tmp, str2));
	
	check_aux_ftstrcpy(tmp);
	printf("strcpy(str3): %s\n", strcpy(tmp, str3));
	check_aux_ftstrcpy(tmp);
	printf("ft_strcpy(str3): %s\n\n", ft_strcpy(tmp, str3));

	printf("------------------------------\n\n");
}

void    check_ftstrcmp()
{
	char    *str1 = "1";
	char    *str1_2 = "";
	char    *str2 = "42 SV";
	char    *str2_2 = "42 SV";
	char    *str3 = "Adsab** HB.!";
	char    *str3_2 = "Adsab** HB.-";

	printf("%s\n\n", "------TESTING FT_STRCMP:------");
	printf("str1 = %s & str1_2 = %s\n", str1, str1_2);
	printf("str2 = %s & str2_2 = %s\n", str2, str2_2);
	printf("str3 = %s & str3_2 = %s\n\n", str3, str3_2);
	
	printf("strcmp(str1, str1_2): %d\n", strcmp(str1, str1_2));
	printf("ft_strcmp(str1, str1_2): %d\n\n", ft_strcmp(str1, str1_2));
	
	printf("strcmp(str2, str2_2): %d\n", strcmp(str2, str2_2));
	printf("ft_strcmp(str2, str2_2): %d\n\n", ft_strcmp(str2, str2_2));

	printf("strcmp(str3, str3_2): %d\n", strcmp(str3, str3_2));
	printf("ft_strcmp(str3, str3_2): %d\n\n", ft_strcmp(str3, str3_2));

	printf("------------------------------\n\n");
}

void    check_ftwrite()
{
	char    *str1 = "";
	char    *str2 = "42 SV\n";

	printf("%s\n\n", "------TESTING FT_WRITE:------");
	printf("str1 = %s\n", str1);
	printf("str2 = %s\n\n", str2);
	printf("return write(str1): %zd\nreturn ft_write(str1): %zd\n\n", write(1, str1, 0), ft_write(1, str1, 0));
	printf("return write(str2): %zd\nreturn ft_write(str2): %zd\n\n", write(1, str2, 6), ft_write(1, str2, 6));
	printf("Unexisting fd:\n");
	printf("return write(str2): %zd\nreturn ft_write(str2): %zd\n\n", write(-42, str2, 6), ft_write(-42, str2, 6));

	printf("------------------------------\n\n");
}

void	check_ftread()
{
	int		fd;
	char	buff[32];
	int		r;

	printf("%s\n\n", "------TESTING FT_READ:------");
	printf("Existing file with buffer:\n");
	fd = open("file.txt", O_RDONLY);
	r = read(fd, buff, 31);
	printf("read()\nreturn: %d\nbuffer: %s\n\n", r, buff);
	close(fd);
	check_aux_ftstrcpy(buff);
	fd = open("file.txt", O_RDONLY);
	r = ft_read(fd, buff, 31);
	printf("ft_read()\nreturn: %d\nbuffer: %s\n", r, buff);
	printf("-----------\n\n");
	close(fd);
	check_aux_ftstrcpy(buff);

	printf("Existing file with NULL buffer:\n");
	fd = open("file.txt", O_RDONLY);
	r = read(fd, NULL, 31);
	printf("read()\nreturn: %d\n\n", r);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	r = ft_read(fd, NULL, 31);
	printf("ft_read()\nreturn: %d\n", r);
	printf("-----------\n\n");
	close(fd);

	printf("Unexisting file (fd = -1):\n");
	fd = open("test.txt", O_RDONLY);
	r = read(fd, buff, 31);
	printf("read()\nreturn: %d\nbuffer: %s\n\n", r, buff);
	close(fd);
	check_aux_ftstrcpy(buff);
	fd = open("test.txt", O_RDONLY);
	r = ft_read(fd, buff, 31);
	printf("ft_read()\nreturn: %d\nbuffer: %s\n", r, buff);
	printf("-----------\n\n");
	close(fd);
	check_aux_ftstrcpy(buff);

	printf("------------------------------\n\n");
}

void	check_ftstrdup()
{
	char    *str1 = "42 SV";
	char    *str2 = "";
	char	*tmp;

	printf("%s\n\n", "------TESTING FT_STRDUP:------");
	printf("str1 = %s\n", str1);
	printf("str2 = %s\n\n", str2);

	tmp = strdup(str1);
	printf("strdup(str1): %s\n", tmp);
	free(tmp);
	tmp = NULL;
	tmp = ft_strdup(str1);
	printf("ft_strdup(str1): %s\n\n", tmp);
	free(tmp);
	tmp = NULL;
	
	tmp = strdup(str2);
	printf("strdup(str2): %s\n", tmp);
	free(tmp);
	tmp = NULL;
	tmp = ft_strdup(str2);
	printf("ft_strdup(str2): %s\n\n", tmp);
	free(tmp);
	tmp = NULL;

	printf("------------------------------\n\n");
}

int main() {
	check_ftstrlen();
	check_ftstrcpy();
	check_ftstrcmp();
	check_ftwrite();
	check_ftread();
	check_ftstrdup();

	return (0);
}
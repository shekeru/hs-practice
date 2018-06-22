#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE* fp; char p = 0;
    char* line[50] = NULL;
    size_t len = 0;
    ssize_t read;

    fp = fopen("Problem 13.txt", "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);

    while ((read = getline(line[p], &len, fp)) != -1) {
        printf("Retrieved line of length %zu :\n", read);
        printf("%s", line[p++]);
    }

    fclose(fp);
    if (line)
      free(line);
    exit(EXIT_SUCCESS);
}

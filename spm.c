#include<stdio.h>
#include<string.h>



int main(int argc, char *argv[]){


    if (argc < 3){
       perror("usage : spm <args> <pkg-name>.spm\n");
    }

    if (strcmp(argv[1],"install") == 0)
    {
        

    }
    else if (strcmp("remove",argv[1]) == 0)
    {
        printf("You are in remove section!\n");
    }else{
        printf("Choose a valid option.\n");
    }
    return 0;
}
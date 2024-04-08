#include <stdio.h>

int verificaLetra(char palavra) {
    if ((palavra >= 'a' && palavra <= 'z') || (palavra >= 'A' && palavra <= 'Z')) {
        return 1;
    } else {
        return 0;
    }
}

void verificaVar(char palavra[]){
int i = 0;
char crt = palavra[i];

    if ((crt >= 'a' && crt <= 'z') || (crt >= 'A' && crt <= 'Z') || crt == '_'){
        while(crt != '\0'){
            if(!verificaLetra(crt) && crt != '_'){
                printf("variavel NAO aceita!\n");
                return;
            }
            crt = palavra[i++];
        }
        printf("Variavel aceita!\n");
    }else{
        printf("Variavel NAO aceita!\n");
    }
}

int main() {

    char palavra[20];
    
    printf("Digite um nome para uma variável :");
    scanf("%s",palavra);

    verificaVar(palavra);
    
}

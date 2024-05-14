#include <stdio.h>
#include <stdlib.h>

void mergeSort(int lista[], int esq, int dir) {
    if (esq < dir) {
        int meio = esq + (dir - esq) / 2;

     
        mergeSort(lista, esq, meio);
        mergeSort(lista, meio + 1, dir);

  
        merge(lista, esq, meio, dir);
    }
}


void merge(int v[], int left, int middle, int right) {
    int tamanho = right - left + 1;
    int helper[tamanho];
    
    for (int i = 0; i < tamanho; i++) {
        helper[i] = v[left + i];
    }

    int i = 0;
    int j = middle - left + 1;
    int k = left;
    while (i <= middle - left && j <= right - left) {
        if (helper[i] <= helper[j]) {
            v[k] = helper[i];
            i++;
        } else {
            v[k] = helper[j];
            j++;
        }
        k++;    
    }
    // Se a metade inicial não foi toda consumida, faz o append.
    while (i <= middle - left) {
        v[k] = helper[i];
        i++;
        k++;
    }
    // Se a metade final não foi toda consumida, faz o append.
    while (j <= right - left) {
        v[k] = helper[j];
        j++;
        k++;
    }
}

int main() {
    int lista[] = {2, 8, 11, 20, 7, 17, 20, 25};
    int tamanho = sizeof(lista) / sizeof(lista[0]);

    printf("Array antes da ordenacao:\n");
    for (int i = 0; i < tamanho; i++) {
        printf("%d ", lista[i]);
    }
    printf("\n");

    mergeSort(lista, 0, tamanho - 1);
    printf("\n");


    printf("Array depois da ordenacao:\n");
    for (int i = 0; i < tamanho; i++) {
        printf("%d ", lista[i]);
    }
    printf("\n");


    printf("\n");

    return 0;
}

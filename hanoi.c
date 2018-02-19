#include <stdio.h>

void swap(int origin[], int destiny[], int *sizeOrigin, int *sizeDestiny);
void hanoiTower(int origin[], int helper[], int destiny[], int *sizeOrigin, int *sizeHelper, int *sizeDestiny, int deepLevel);
void printArrays(int origin[], int helper[], int destiny[]);

// Global size value of towers
const int SIZE = 8;

int main() {
    // Declaring towers as arrays
    int origin[]  = {8, 7, 6, 5, 4, 3, 2, 1};
    int helper[]  = {0, 0, 0, 0, 0, 0, 0, 0};
    int destiny[] = {0, 0, 0, 0, 0, 0, 0, 0};

    // Declaring size of the towers
    int sizeOrigin  = SIZE;
    int sizeHelper  = 0;
    int sizeDestiny = 0;

    // Call hanoiTower Algorithm to send the values from tower 1 to tower 3
    hanoiTower(origin, helper, destiny, &sizeOrigin, &sizeHelper, &sizeDestiny, SIZE - 1);
    return 0;
}

/*
 * Hanoi Tower Algorithm
 */
void hanoiTower(int origin[], int helper[], int destiny[], int *sizeOrigin, int *sizeHelper, int *sizeDestiny, int deepLevel) {

    // We check if we are on deepLvl 0 to make a swap and return, else we continue to go to outer levels
    if (deepLevel == 0) {
        // Swap values from the towers and return
        swap(origin, destiny, sizeOrigin, sizeDestiny);
        printArrays(origin, helper, destiny);
        return;
    } else {
        hanoiTower(origin, destiny, helper, sizeOrigin, sizeDestiny, sizeHelper, deepLevel - 1);
    }

    // We swap values from the towers
    swap(origin, destiny, sizeOrigin, sizeDestiny);
    printArrays(origin, helper, destiny);

    // If we have something in left in our helper we move to the helper to make the changes necessary
    if (deepLevel > 0) {
        hanoiTower(helper, origin, destiny, sizeHelper, sizeOrigin, sizeDestiny, deepLevel - 1);
    }
}

/*
 * Function to swap values between arrays
 */
void swap(int origin[], int destiny[], int *sizeOrigin, int *sizeDestiny){
    // Swap of values
    destiny[*sizeDestiny] = origin[*sizeOrigin - 1];
    origin[*sizeOrigin - 1] = 0;

    // We update the sizes of the towers
    *sizeOrigin  = *sizeOrigin - 1 ;
    *sizeDestiny = *sizeDestiny + 1;
}

/*
 * Function to print values of the Arrays
 */
void printArrays(int origin[], int helper[], int destiny[]) {
    for (int i = 0; i < SIZE; i++) {
        printf("Origin[%d] = %d\n",i,origin[i]);
    }

    printf("\n");

    for (int i = 0; i < SIZE; i++) {
        printf("Helper[%d] = %d\n",i,helper[i]);
    }

    printf("\n");

    for (int i = 0; i < SIZE; i++) {
        printf("Destiny[%d] = %d\n",i,destiny[i]);
    }

    printf("\n");
    printf("////////////////////////////////////////////////");

    printf("\n");
    printf("\n");
}
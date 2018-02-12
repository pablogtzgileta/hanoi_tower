#include <stdio.h>
#include <string.h>
  
typedef enum {false, true} bool;

int main() {
    // Declaring size of the towers
    int sizeOrigin = 3;
    int sizeHelper = 0;
    int sizeEnding = 0;
  
    //
    bool focusOrigin = true;
    bool focusHelper = false;
    bool focusEnding = false;
  
    // Declaring towers as arrays
    int origin[] = {3, 2, 1};
    int helper[] = {0, 0, 0};
    int ending[] = {0, 0, 0};  
  
    hanoiTower(origin, helper, ending, sizeOrigin, sizeHelper, sizeEnding);
  
    return 0;
}

void hanoiTower(int origin[], int helper[], int ending[], int sizeOrigin, int sizeHelper, int sizeEnding,) {
  
    if(sizeOrigin == 1) {
      swap(origin, ending, &sizeOrigin, &sizeEnding);
      
      return;
      //swap and return      
    }else{
      hanoiTower(origin, ending, helper, sizeOrigin - 1, sizeHelper, sizeEnding);
      //something to do
      
    }  
    
}

// Function to swap values between arrays
void swap(int origin[], int ending[], int *sizeOrigin, int *sizeEnding){
    // Swap of values
    ending[*sizeEnding + 1] = origin[*sizeOrigin];
    origin[*sizeOrigin] = 0;
  
    // We change the sizes of the arrays
    *sizeOrigin--;
    *sizeEnding++;
}
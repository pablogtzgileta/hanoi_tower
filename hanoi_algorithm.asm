	#Luis Fernando Palafox Pucheta & Pablo Mart�n Guti�rrez Gileta
.data
 
.text
 
# Jump to main 
j main
 
#  Hanoi Tower Algorithm
#  We use the next arguments:
#  $s4 = Deep Level
#  $s1 = pointer to array origin
#  $s2 = pointer to array helper
#  $s3 = pointer to array destiny 
 
#Function to run the algorithm
hanoiTower:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    bne  $s4, 1, else
 
    # Base case
    # Swap the values between origin and destiny
    addi $s1, $s1, -4
    sw   $s4, 0($s3)
    addi $s3, $s3, 4
    sw   $zero, 0($s1)
 
    # Get the $ra value to return
    lw   $ra, 0($sp)
    addi $sp, $sp,4
    add  $s4, $s4, 1
    jr   $ra
 
    # If its not the base case we continue going deeper and making changes
    else:
       
        # We switch the memory address of the towers
        # to work with them properly
        add $t3, $zero, $s2  
        add $s2, $zero, $s3
        add $s3, $zero, $t3
        add $s4, $s4, -1  
 
        jal hanoiTower
 
 
        # Swap the values
        addi $s1, $s1, -4
        sw   $s4, 0($s2)
        addi $s2,$s2, 4
        sw   $zero, 0($s1)
 
        
        # We switch the memory address of the towers
        add $t0, $zero, $s1    
        add $s1, $zero, $s3
      	add $s3,$zero, $s2
      	add $s2, $zero, $t0
      	add $s4, $s4, -1  
 
        jal hanoiTower
       
        # We switch the memory address of the towers
        add $t5, $zero, $s1    
        add $s1, $zero, $s2
        add $s2, $zero, $t5
 
        lw   $ra, 0($sp)
        addi $sp, $sp,4
        addi $s4, $s4, 1
       
        jr $ra 
main:
    #Size of the tower
    addi  $s0, $zero, 8
 
    #Pointer to the arrays 
    add $s1, $zero, 0x10010000    
    sll $t7, $s0, 2
    add $s2, $t7, $s1  
    add $s3, $s2, $t7
 
    add $t6, $s0,$zero
 
    # We loop the towers to add the corresponding values
    for:
        sw   $t6, 0($s1)
        add  $s1, $s1, 4
        addi $t6, $t6, -1
        bne  $t6, $zero, for
  add $s4,$s0,$zero
  #Call hanoiTower Algorithm to send the values of the towers
  jal hanoiTower
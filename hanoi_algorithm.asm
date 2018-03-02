#Luis Fernando Palafox Pucheta & Pablo Martín Gutiérrez Gileta
.data
#   n = maximum tower level
#  origin   = array origin
#  helper   = array helper
#  destiny = array destiny
.text

j main

#  Hanoi Tower Algorithm
#  Use the next arguments:
#  $s0 = maximum tower level
#  $s1 = pointer to array origin
#  $s2 = pointer to array helper
#  $s3 = pointer to array destiny
#  $s4 = pointer to size origin
#  $s5 = pointer to size helper
#  $s6 = pointer to size Destiny

hanoiTower:
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  bne $s0 , 1, else
    if:
    # Swap the values
    addi $s1, $s1, -4
    # Swap the values
    sw  $s0, 0($s3) 
    addi $s3,$s3,4
    sw  $zero, 0($s1)
    
    lw $ra, 0($sp)
    addi $sp, $sp,4
    add $s0, $s0, 1
    jr $ra
    else:
    add $t3, $zero, $s2   
    add $s2, $zero, $s3
    add $s3, $zero, $t3
    add $s0, $s0, -1    
        jal hanoiTower
    
    add $t3, $zero, $s2    
    add $s2, $zero, $s3
      add $s3, $zero, $t3
      
    # Swap the values
    addi $s1, $s1, -4
    # Swap the values
    sw  $s0, 0($s3) 
    addi $s3,$s3,4
    sw  $zero, 0($s1)
    
      add $t3, $zero, $s2    
    add $s2, $zero, $s1
    add $s1, $zero, $t3
      add $s0, $s0, -1  
    jal hanoiTower
      
    add $t5, $zero, $s1    
    add $s1, $zero, $s2
    add $s2, $zero, $t5
    
    lw $ra, 0($sp)
    addi $sp, $sp,4
    addi $s0, $s0, 1
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
  for:
    sw $t6, 0($s1)
    add $s1,$s1,4
    addi $t6, $t6, -1
    bne $t6,$zero,for
  
  
  #Call hanoiTower Algorithm to send the values from tower 1 to tower 3
  jal hanoiTower

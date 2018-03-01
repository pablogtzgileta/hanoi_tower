#Luis Fernanod Palafox Pucheta & Pablo Martín Gutiérrez Gileta
.data
#   n = maximus tower level
#  origin   = array origin
#  helper   = array helper
#  destiny = array destiny
  n: .word 8    
  origin:   .word 8 7 6 5 4 3 2 1  
  helper:   .word 0 0 0 0 0 0 0 0
  destiny: .word  0 0 0 0 0 0 0 0
.text

j main
#
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
  
  addi $sp, $sp, -16
  sw $s1, 0($sp)
  sw $s2, 4($sp)
  sw $s3, 8($sp)
  sw $ra, 12($sp)

  bne $s0 , 1, else
  if:
    jal swap
  else:
    add $t3, $zero, $s2    
    add $s2, $zero, $s3
    add $s3, $zero, $t3
   
    add $t2, $zero, $s5    
    add $s5, $zero, $s6
    add $s6, $zero, $t2
    
    add $s0, $s0, -1    

    jal hanoiTower
 

    add $t3, $zero, $s2    
    add $s2, $zero, $s3
    add $s3, $zero, $t3

    add $t2, $zero, $s5    
    add $s5, $zero, $s6
    add $s6, $zero, $t2
 
    jal swap


    add $t3, $zero, $s2    
    add $s2, $zero, $s1
    add $s1, $zero, $t3

    add $t2, $zero, $s5    
    add $s5, $zero, $s4
    add $s4, $zero, $t2
    
    add $s0, $s0, -1  

    jal hanoiTower
    
    add $t2, $zero, $s5    
    add $s5, $zero, $s4
    add $s4, $zero, $t2
    
    lw $s1, 0($sp)
    lw $s2, 4($sp)
    lw $s3, 8($sp)
    lw $ra, 12($sp)
    addi $sp, $sp,16
    add $s0, $s0, 1
    jr $ra
    
swap:

main:

  
  #Size of the tower
  lw  $s0, n 
  #Pointer to the arrays
  la  $s1, origin
  la  $s2, helper
  la  $s3, destiny
  
  add $s4, $zero, $s0
  add $s5, $zero, $zero
  add $s6, $zero, $zero
  
  #Call hanoiTower Algorithm to send the values from tower 1 to tower 3
  jal hanoiTower

end:
#Code finds the first number i 
#whose factorial is divisible by a given number x.
        .global _start

        .text

_start:
        mov $17, %r8      #register r8 stores the value of x

        mov %r8, %rax    #register rax,a=x
        mov %rax, %rcx  #c=x
        mov $1, %r9     #r9=1
        mov $1, %r11    #r11=1
        mov $1, %rbx    #b=1
        cmp %rax, %rbx  #comparing a and b values 
        je loop1        #if a=b go to loop1
        jne loop2       #else go to loop2
                         
loop1:                  #loop1 begins 
        mov %r9, %r11   #register rdi=1 since r9=1
        cmp %rdi, %rdi  #comparing rdi and rdi so that we can 
        je exit         # go to exit part.

loop2:                  #loop2 begins
        add %r11, %r9   #r9=r9+r11
        imul %r9, %rbx  #b=b*r9
        mov $0, %rdx    #d=0
        mov %rbx, %rax  #a=b
        mov %rcx, %rcx  #c=c
        div %rcx        #dividing a/c , d=remainder;a=quotient
        cmp $0, %rdx    #comparing d and 0
        je loop1        #if d=0 go to loop 1
        jne loop2       #else again go to loop2

exit:                   #exit begins
        mov %r11,%rdi
        mov $60, %rax   #a=60
        xor %rbx, %rbx  #b^b to finish the program. 
        syscall
        
#======================================================================================================#
#when using sub in place of div it is taking so much time 
/*                 .global _start

        .text

_start:
        mov $17, %r8      #register r8 stores the value of x

        mov %r8, %rax    #register rax,a=x
        mov %rax, %rcx  #c=x
        mov $1, %r9     #r9=1
        mov $1, %r11    #r11=1
        mov $1, %rbx    #b=1
        cmp %rax, %rbx  #comparing a and b values 
        je loop1        #if a=b go to loop1
        jne loop2       #else go to loop2
                         
loop1:                  #loop1 begins 
        mov %r9, %r11   #register rdi=1 since r9=1
        cmp %rdi, %rdi  #comparing rdi and rdi so that we can 
        je exit         # go to exit part.

loop2:                  #loop2 begins
        add %r11, %r9   #r9=r9+r11
        imul %r9, %rbx  #b=b*r9
        mov $0, %rdx    #d=0
        mov %rbx, %rax  #a=b
        jmp loop3

loop3:                   #loop3 begins to use division
        sub %rcx, %rax   #a=a-c
        cmp $0, %rax     #cmp 0 and a
        je loop1         #if a=0, =>c divides a
        jns loop3        #if a>0 => go to loop3
        js loop2         #if a<0 => go to loop2

exit:                   #exit begins
        mov %r11, %rdi
        mov $60, %rax   #a=60
        xor %rbx, %rbx  #b^b to finish the program. 
        syscall
        */
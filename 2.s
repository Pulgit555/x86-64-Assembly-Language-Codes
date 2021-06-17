#Modular Exponentiation
    .global _start
    .text

_start:
        mov $18, %r8     #a
        mov $19, %r9     #b
        mov $10000, %r10    #n

        mov $1, %r11    #1.acc=1
        mov $2, %r12    #r12=2
        mov $1, %r14    #r14=1
        mov $1, %r15    #r15=1
        mov %r8, %rax   #rax register=a
        jmp div1

div1:
        mov %rax, %r13   #r13=a
        sub %r10, %rax   #a=a-n
        mov %r13, %r8   #2.a=a(mod)n
        cmp $0, %rax    # comparing aand 0 
        js  while        # if a<0 go to while
        jmp div1         #otherwise div1

while:                 #3.while loop begins
        mov $0,%r15     #r15=0
        mov %r9, %rax   #rax=b
        cmp $0, %r9     #comparing b with 0
        js exit        #if b<0 go to exit
        je exit        #if b=0 go to exit
        jne loop       #else go to loop

loop:
        sub %r12, %rax   #rax=b-2
        cmp $0, %rax    #if remainder=0 that is b is even
        je loop1       #6.if even go to loop1
        jns loop      #4.if remainder is positive ,else go to loop
        jmp loop2      #if remainder negative go to loop2

div4:
        sub %r12, %rax     #rax=rax-2
        add %r14,%r15      #r15=r15+r14
        cmp $0,%rax        #compare rax and 0
        js  loop3          #if rax<0  go to loop3
        jmp div4           #else go to div4

loop1:
        mov %r9, %rax   #rax=b
        jmp div4        #jump to div4
      
loop3:
        sub %r14, %r15
        mov %r15,%r9    #7.b=b/2 
        imul %r8, %r8   #a=a(mod)n*a(mod)n
        mov %r8, %rax   #rax=a
        jmp div1      #go to div1 

div2:
        mov %rax, %r13   #r13=acc
        sub %r10, %rax   #acc=acc-n
        mov %r13, %r11    #acc=acc(mod)n
        cmp $0, %rax    # comparing acc and 0 
        js  continue        # if a<0 go to continue
        jmp div2         #otherwise div2

loop2:
        mov %r11, %rax  #rax=acc
        jmp div2         #jump to div2

div3:
        mov %rax, %r13   #r13=acc
        sub %r10, %rax   #acc=acc-n
        mov %r13, %r11    #acc=(acc(mod)n*a(modn))modn
        cmp $0, %rax    # comparing acc and 0 
        js  loop1        # if a<0 go to loop1
        jmp div3         #otherwise div3

continue:
        imul %r8, %r11  #acc=acc(modn)*a(modn)
        mov %r11, %rax  #rax=acc 
        jmp div3        #jump to div3

exit:
        mov %r11, %rdi  #10. rdi=acc
        mov $60, %rax   #a=60
        xor %rbx, %rbx  #b^b to finish the program. 
        syscall




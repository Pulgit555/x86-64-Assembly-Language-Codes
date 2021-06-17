.global _start
.text

#Here First we take factors of A so that it satisfies first condition

_start:
    #movq $30,%rbx     #A=30
    #movq $8,%rcx      #B=8
    movq %rcx,%r8     #r8=B
    movq $1,%r9       #r9=1
    movq $2,%r10      #r10=2
    movq $2,%r12      #r12=2
    movq $10,%r13     #r13=10
    movq $0,%r14      #r14=0
    jmp factA         #jump to factA

factA:                 #factA loop begins
    movq %rbx,%rax     #rax=A
    movq %r9,%rcx      #rcx=r9
    movq $0,%rdx       #rdx=0
    divq %rcx          #A/r9
    cmp $0,%rdx        #checking whether r9 divides A
    je loop1           #if yes, go to loop1
    addq $1,%r9        #else r9++
    jmp factA          #jump to factA

#Now after getting factor of A we check whether A and B are co primes

loop1:                 #loop1 begins
    movq %rax,%r11     #r11=A/r9
    cmp %r8,%r11       #comparing r8,r11 to check coprimes
    je equal           #if equal go to loop equal
    jg loop3           #if r11>r8,go to loop3
    jl loop4           #if r11<r8,go to loop4

equal:                 #equal loop begins
    cmp $1,%r11        #comparing r11 and 1
    je loop5           #if r11=1 go to loop5
    add $1,%r9         #else r9++
    jmp factA          #jump to factA

#if r11>r8,
    #First we check factor of r8 from 2

loop3:                 #loop3 begins
    movq %r8,%rax      #rax=B
    movq $0,%rdx       #rdx=0
    movq %r10,%rcx     #rcx=r10
    divq %rcx          #B/r10
    cmp $0,%rax        #comparing rax and 0
    je loop5           #if rax=0,go to loop5
    cmp $0,%rdx        #comparing rdx and 0
    je loop2           #if rdx=0,i.e r10 divides B go to loop2
    addq $1,%r10       #r10++
    jmp loop3          #jump to loop3

#And then we check whether the same factor divides r11 that is they are not coprime

loop2:                  #loop2 begins
    movq %r11,%rax      #rax=A/r9=r11
    movq $0,%rdx        #rdx=0
    movq %r10,%rcx      #rcx=r10
    divq %rcx           #r11/r10
    cmp $0,%rdx         #if rdx=0,i.e r10 divides r11 
    je loop7            #go to loop7
    addq $1,%r10        #r10++
    jmp loop3           #jump to loop3

#if r8>r11,
    #First we check factor of r11 from 2

loop4:                   #loop4 begins
    movq %r11,%rax       #rax=r11
    movq $0,%rdx         #rdx=0
    movq %r12,%rcx       #rcx=r12
    divq %rcx            #r11/r12
    cmp $0,%rax          #cmparing rax and 0
    je loop5             #if rax=0,got to loop5
    cmp $0,%rdx          #comparing rdx and 0
    je loop6             #if rdx=0,go to loop6 
    addq $1,%r12         #r12++
    jmp loop4            #jump to loop4

#And then we check whether the same factor divides r8 that is they are not coprime

loop6:                   #loop6 begins
    movq %r8,%rax        #rax=B
    movq $0,%rdx         #rdx=0
    movq %r12,%rcx       #rcx=12
    divq %rcx            #B/r12
    cmp $0,%rdx          #comparing rdx and 0
    je loop7             #rdx=0,got to loop7
    addq $1,%r12         #r12++
    jmp loop4            #jump to loop4

#this loop is used if For that factor of A (if not coprime with B) got to next factor of A

loop7:                   #loop7 begins
    movq $2,%r10         #r10=2
    movq $2,%r12         #r12=2
    addq $1,%r9          #r9++
    jmp factA            #jump to factA


#this loop finds the sum of digits of the maximum number X

loop5:                   #loop5 begins
    movq %r11,%rax       #rax=r11
    movq $0,%rdx         #rdx=0
    movq %r13,%rcx       #rcx=r13
    divq %rcx            #r11/r13
    addq %rdx,%r14       #r14=r14+r11%r13
    cmp $0,%rax          #comparing rax and 0
    je exit              #if rax=0 go to exit
    movq %rax,%r11       #r11=r11/r13
    jmp loop5            #jump to loop5
 
#finally answer is stored rdx register

exit:                   #exit begins
    movq %r14,%rdx       #rdx=r14 stores the answer
    movq $60,%rax        #rax=60
    xor %rdi,%rdi        #rdi^rdi
    syscall              #syscall to exit

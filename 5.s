.global _start
.text

#logic : push elements from back to the stack and check the next element
    # if it is smaller then pop the stack and store the value for it at required address
    # at last the element remain in stack are pop out and given value -1

_start:
    movq $8,%r9           #r9=8
    #movq $6,%rbx         #rbx=n
    movq $0,%r15          #r15=0
    #imulq %rbx,%r9       #r9=n*8
    #subq %r9,%rsp        #rsp=rsp-n*8
    #movq %rsp,%rdx       #rdx=rsp providing memory space to rdx base address of output array
    #subq %r9,%rsp        #rsp=rsp-n*8
    #movq %rsp,%rcx       #rcx=rsp providing memory space to rcx base address of input array
    #movq %rcx,%r8        #r8=rcx pointer
    #movq $8,%r9          #r9=8
    #movq $4,(%rcx)       #array[0]=4
    #addq $8,%rcx         #rcx=rcx+8
    #movq $4,(%rcx)       #array[1]=4
    #addq $8,%rcx         #rcx=rcx+8
    #movq $5,(%rcx)       #array[2]=5
    #addq $8,%rcx         #rcx=rcx+8
    #movq $2,(%rcx)       #array[3]=2
    #addq $8,%rcx         #rcx=rcx+8
    #movq $10,(%rcx)      #array[4]=10
    #addq $8,%rcx         #rcx=rcx+8
    #movq $8,(%rcx)       #array[5]=8
    subq $1,%rbx          #rbx=rbx-1
    movq %rbx,%rbp        #rbp=rbx
    #movq %r8,%rcx        #rcx=r8
    jmp stack             #jump to stack

#store:                    #store function
  #  movq (%rdx),%r8       #r8=*rdx
  #  movq 8(%rdx),%r9      #r9=*rdx+8
  #  movq 16(%rdx),%r10    #r10=*rdx+16
  #  movq 24(%rdx),%r11    #r11=*rdx+24
  #  movq 32(%rdx),%r12    #r12=*rdx+32
  #  movq 40(%rdx),%r13    #r13=*rdx+40

exit:                      #exit function
    movq $60,%rax          #rax=60
    xor %rdi,%rdi          #rdi=rdi^rdi
    syscall                #syscall

stack:                      #stack begins
    push %rbp               #push index of first element
    inc %r15                #r15++ no. of elements in stack
    subq $1,%rbx            #rbx=rbx-1
    cmp $0,%rbx             #rbx:0
    jl out                  #rbx<0 go to out
    leaq (%rcx,%rbx,8),%rsi #rsi=&(rcx+8*rbx) storing memory address in %rsi
    movq (%rsi),%r11        #r11=*rsi
    leaq (%rcx,%rbp,8),%rdi #rdi=&(rcx+8*rbp) storing memory address in %rsi
    movq (%rdi),%r12        #r12=*rdi
    cmp %r12,%r11           #r11:r12
    jl answer               #r11<r12 go to answer

loop1:                      #loop1 begins     
    mov %rbx,%rbp           #rbp=rbx
    jmp stack               #jump to stack

answer:                     #answer begins
    pop %r13                #pop index in r13
    movq %r11,(%rdx,%r13,8) #store the value r11 at memory location rdx+8*r13
    movq (%rdx,%r13,8),%r14 #r14=r11
    dec %r15                #r15-- no.of elements in stack
    cmp $0,%r15             #r15:0
    je loop1                #if they are no elements left in stack go to loop1
    pop %r13                #pop index in r13
    push %r13               #push r13
    leaq (%rcx,%rbx,8),%rsi #rsi=&(rcx+8*rbx) storing memory address in %rsi
    movq (%rsi),%r11        #r11=*rsi
    leaq (%rcx,%r13,8),%rdi #rdi=&(rcx+8*r13) storing memory address in %rsi
    movq (%rdi),%r12        #r12=*rdi
    cmp %r12,%r11           #r11:r12
    jl answer               #r11<r12 go to answer
    jmp loop1               #jmp to loop1

out1:                       #out1 begins
    #jmp store               #jump to store loop
    jmp exit                 #go to exit loop

out:                        #out begins
    cmp $0,%r15             #r15:0
    jle out1                #r15<=0 go to out1 no element left in stack
    pop %r13                #pop index in r13
    movq $-1,(%rdx,%r13,8)  #store -1 at locations if no shorter student exists
    dec %r15                #r15-- no.of elements in stack
    jmp out                 #jump to out

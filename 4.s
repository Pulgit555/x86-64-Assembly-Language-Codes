.global _start
.text

_start:
    #movq $5,%rbx       #rbx=n
    movq %rbx,%r8       #r8=n
    #movq $13,%rcx      #rcx=k
    movq $0,%r10        #r10=0
    movq $1,%r14        #r14=1 
    movq $1,%rdi        #rdi=1
    movq $1,%rsi        #rsi=1
    movq $0,%r9         #r9=0
    jmp fibo1           #jump to fibo1

exit:                   #exit begins
    movq %r9,%rdx       #rdx=r9 stores the answer
    movq $60,%rax       #rax=60
    xor %rdi,%rdi       #rdi=rdi^rdi
    syscall             #syscall

fibo1:                  #fibo1 begins
    call fibo           #call fibo
    mov %rax,%rdi       #store the fibonacci number in rdi
    cmp %rdi,%r8        #r8:rdi
    jl out              #r8<rdi go to out
    call rfact          #call fact 
    addq %rax,%r9       #add the required sum 
    movq $0,%rdx        #rdx=0
    movq %r9,%rax       #rax=r9
    idivq %rcx          #divide by rcx
    movq %rdx,%rax      #rax=rax(mod k)
    movq %rax,%r9       #r9=rax
    jmp fibo1           #jump to fibo1

out:                    #out begins
    jmp exit            #jump to exit

fibo:                   #fibo begins
    movq %r14,%rsi      #rsi=r14
    addq %r10,%r14      #r14=r14+r10
    movq %rsi,%r10      #r10=rsi
    movq %r14,%rax      #rax=r14
    ret                 #return the fibonacci

#rfact finds the factorial using recursion procedure calls
rfact:
    pushq %rbx
    movq %rdi,%rbx
    movq $1,%rax
    cmpq $1,%rdi
    jle output
    leaq -1(%rdi),%rdi
    call rfact
    imulq %rbx,%rax
    movq $0,%rdx
    idivq %rcx
    movq %rdx,%rax

output:
    popq %rbx
    ret

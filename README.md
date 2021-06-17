# x86-64 Assembly Language codes
## **1** 
- Find a first natural number i whose factorial is divisible by x.
- number x can be changed in line number 8 in place of 17 in 1.s
- i is stored in register %rdi
- Code is explained using comments for each line of code.
### How to Run
```
 gcc -c 1.s && ld 1.o && ./a.out
```

## **2** 
- Perform modular exponentiation with input a, b, n.
- a can be changed in line 6, b can be changed in line 7, n can be changed in line 8 of 2.s
- Final answer is stored in register %rdi
- Code is explained using comments for each line of code.
### How to Run
```
 gcc -c 2.s && ld 2.o && ./a.out
```

## **3** 
- Given 2 numbers A and B, find the sum of digits of X such that X divides A and X and B are coprime.
- A can be changed in line 7, B can be changed in line 8 of 3.s
- Final answer is stored in register %rdx
- Code is explained using comments for each line of code.
### How to Run
```
 gcc -c 3.s && ld 3.o && ./a.out
```

## **4** 
- Given 2 numbers n and k, find the sum of factorials of all Fibonacci numbers less than or equal to n and Report final answer mod k.
- n can be changed in line 5, k can be changed in line 7 of 4.s
- Final answer is stored in register %rdx
- Code is explained using comments for each line of code.
### How to Run
```
 gcc -c 4.s && ld 4.o && ./a.out
```

## **5** 
- Given a number n and array of n numbers.
- We need to find the nearest smaller number in the left, In case no answer exists, answer is -1. 
- n can be changed in line 10, array values can be added as given example from line 19-29 of 5.s
- Base address of output array will be stored in %rdx.
- Code is explained using comments for each line of code.
### How to Run
```
 gcc -c 5.s && ld 5.o && ./a.out
```

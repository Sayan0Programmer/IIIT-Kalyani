#!/bin/bash
echo "Welcome!"

echo -n "Enter input number: "
read n

echo "Compiling factorial..."
gcc -o fact fact.c
echo "Running factorial..."
./fact $n

echo "Compiling fibonacci..."
gcc -o fibo fibo.c
echo "Running fibonacci..."
./fibo $n

echo "Shell level IO redirection..."
./fact < ./fibo $(($n + 1))
echo "HAHA...IT WORKS!!!"

echo "Deleting Programs..."
rm fact fibo

echo "Done!"

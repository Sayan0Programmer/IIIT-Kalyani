#!/bin/bash
echo "Welcome!"

echo "Compiling factorial..."
gcc -o fact fact.c
echo "Running factorial..."
./fact 6

echo "Compiling fibonacci..."
gcc -o fibo fibo.c
echo "Running fibonacci..."
./fibo 6

echo "Deleting Programs..."
rm fact fibo

echo "Done!"

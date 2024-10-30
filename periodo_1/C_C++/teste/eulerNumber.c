/*
DESCRIPTION

The program calculates an approximation of the Euler number using the Taylor series, where the user supplies the value of N and the result is displayed on the screen. Euler's number is a mathematical constant approximately equal to 2.71828. The Taylor series is a representation of a function as an infinite sum of terms calculated from the derivatives of that function at a specific point.
*/

#include <stdio.h>
#include <stdlib.h>

float factorial(float number){

    if(number == 0 || number == 1){
        return 1;
    } else {
        return number * factorial(number - 1);
    }
}


float calculatesEulerNumber(float number){

    float euler = 0.0;

    for (int i = 0; i < number; i++){

        euler += 1/factorial(i);
    }

    return euler;
}

int main(){

    float number;

    printf("Valor de N: \n");
    scanf("%f", &number);

    float result = calculatesEulerNumber(number);

    printf("%f \n", result);

    return 0;
}
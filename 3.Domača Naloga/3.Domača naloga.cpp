﻿// 3.Domača naloga.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <cmath>

// Funkcija za izračun arctan(x) s pomočjo Taylorjeve vrste
double arctan(double x) {
    double sum = 0.0;
    double term = x;
    double power = x * x;
    int n = 1; 

    while (fabs(term) > 1e-8) {
        sum += term;
        term = -term * power / (2 * n + 1);
        power *= x * x;
        n++;
    }

    return sum;
}

// Funkcija za izračun e^(3x)
double exp_3x(double x) {
    return exp(3 * x);
}

// Funkcija za integracijo s trapezno metodo
double trapezoidal_integration(double (*f)(double), double a, double b, int n) {
    double h = (b - a) / n;
    double sum = 0.5 * (f(a) + f(b));

    for (int i = 1; i < n; i++) {
        double x = a + i * h;
        sum += f(x);
    }

    return h * sum;
}

int main() {
    double pi = acos(-1.0); // vrednost PI
    double a = 0.0; // spodnja meja integrala
    double b = pi / 4.0; // zgornja meja integrala
    int n = 1000; // število podintervalov

    double result = trapezoidal_integration([](double x) {
        return exp_3x(x) * arctan(x / 2.0);
        }, a, b, n);

    std::cout << "Ocena izračuna integrala: " << result << std::endl;

    return 0;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file

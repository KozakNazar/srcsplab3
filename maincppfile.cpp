#define _CRT_SECURE_NO_WARNINGS  // for using scanf in VS

#include <stdio.h>

// X = K + B2 - D2/C1 + E1*F2 // K=0x00025630
extern "C" void calcLab3(double b2, float c1, double d2, float e1, double f2);
extern "C" void calcLab3__useMacro(double b2, float c1, double d2, float e1, double f2);

int main()
{
	double b2;
	float c1;
	double d2;
	float e1;
	double f2;

	printf("Enter values:\n");	
	printf("B = ");
	scanf("%lf", &b2);
	printf("C = ");
	scanf("%f", &c1);
	printf("D = ");
	scanf("%lf", &d2);
	printf("E = ");
	scanf("%f", &e1);
	printf("F = ");
	scanf("%lf", &f2);

	calcLab3(b2, c1, d2, e1, f2);
	//calcLab3__useMacro(b2, c1, d2, e1, f2);

	return 0;
}
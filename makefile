/* ----------------------------------------------------------------------------
* Copyright &copy; 2015 Thomas Collins <thomas_collins@csu.fullerton.edu>
* with help from Ben Blazak's answer key <bblazak@fullerton.edu>
* Released under the [MIT License] (http://opensource.org/licenses/MIT)
* ------------------------------------------------------------------------- */
/**
** Recursive functions program
*/	

#include <cmath>
#include <iostream>
#include <string>

using std::cout;
using std::endl;
using std::string;
using std::abs; //absolute value from cmath


//euclid's algorithm
int gcd_iterative(int a, int b) {
	a = abs(a);
	b = abs(b);

	while (a && b) {
		if (a > b)
			a -= b;
		else
			b -= a;
	}
	return a + b;  
}

int gcd(int a, int b) {
	a = abs(a);
	b = abs(b);

	if (a == 0 || b == 0)
		return a + b;

	if (a > b)
		return gcd(a - b, b);

	return gcd(a, b - a);
}

// ----------------------------------------------------------------
//fibonacci algorithm

int fibonacci_iterative(int x, int f1 = 1, int f2 = 1) {
	
	if (x < 1)
		return 0;

	if (x == 1)
		return f1;
	if (x == 2)
		return f2;

	while (x > 2) {
		int next = f1 + f2;
		f1 = f2;
		f2 = next;
		x--;
	}

	return f2;
}

int fibonacci(int x, int f1 = 1, int f2 = 1) {
	// error check
	if (x < 1)
		return 0;

	if (x == 1)
		return f1;
	if (x == 2)
		return f2;

	return fibonacci(x - 1, f2, f1 + f2);
}

// ............................................................................

string int_to_roman_iterative(int i) {
	const string numerals[] = {
		"M",  "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I",
	};
	const int values[] = {
		1000, 900,  500, 400,  100, 90,   50,  40,   10,  9,    5,   4,    1,
	};

	if (i < 0)
		return "ERROR: too small";
	if (i >= 4000)
		return "ERROR: too large";

	string ret = "";

	for (int a = 0; a < sizeof(values) / sizeof(int); a++) {
		while (i >= values[a]) {
			ret += numerals[a];
			i -= values[a];
		}
	}

	return ret;
}

string int_to_roman(int i) {
	const string numerals[] = {
		"M",  "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I",
	};
	const int values[] = {
		1000, 900,  500, 400,  100, 90,   50,  40,   10,  9,    5,   4,    1,
	};

	if (i < 0)
		return "ERROR: too small";
	if (i >= 4000)
		return "ERROR: too large";

	if (i == 0)
		return "";

	for (int a = 0; a < sizeof(values) / sizeof(int); a++)
		if (i >= values[a])
			return numerals[a] + int_to_roman(i - values[a]);

	return "ERROR: unable to convert";
}


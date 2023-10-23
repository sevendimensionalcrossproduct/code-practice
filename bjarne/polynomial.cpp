#include <iostream>
#include <string>
#include <vector>
#include <cmath>
#include "./superscript.h"

using namespace std;

class monomial{
	private:
		char variable;
		double exponent;
		double coefficient;
	public:
		//constructor
		monomial(char init_variable = 'x', double init_coefficient = 1.0, double init_exponent = 1.0) : variable(init_variable), exponent(init_exponent), coefficient(init_coefficient){};

		//setter & getter
		double get_exponent() const {return exponent;}
		double get_coefficient() const {return coefficient;}
		char get_variable() const{return variable;}

		double evaluate(double x){
			return coefficient * pow(x, exponent);
		}

		string evaluate_explicit(double x){
			return  to_string(coefficient) + "(" + to_string(x) +  ")" + to_superscript_double(exponent);
		}
};

ostream& operator << (ostream& output_stream, const monomial& some_monomial){
	output_stream << some_monomial.get_coefficient();
	output_stream << some_monomial.get_variable();
	output_stream << to_superscript_double(some_monomial.get_exponent());

	return output_stream;
} 

int main(){
	monomial x('x',2.0,3.0);
	cout << x.evaluate_explicit(3.0) <<endl;
	return 0;
}

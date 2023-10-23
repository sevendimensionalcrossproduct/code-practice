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

		//getters
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
	if(some_monomial.get_coefficient() == 0){
		output_stream << 0;
	} else {
		if (some_monomial.get_coefficient() != 1){
			output_stream << some_monomial.get_coefficient();
		}
		if (some_monomial.get_exponent() == 0){
			//pass
		} else if(some_monomial.get_exponent() == 1) {
			output_stream << some_monomial.get_variable();
		} else {
			output_stream << some_monomial.get_variable();
			output_stream << to_superscript_double(some_monomial.get_exponent());
		} 
	}
	return output_stream;
} 

int main(){
	monomial x('x',3.0,0);
	cout << x.evaluate(4) <<endl;
	return 0;
}

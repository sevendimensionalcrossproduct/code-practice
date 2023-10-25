#include <iostream>
#include <iterator>
#include <string>
#include <vector>
#include "./superscript.h"
#include <cmath>

class signal{
	private:
		std::vector<double> coefficients;
	public:
		signal(vector<double> init_coefficients)
			: coefficients(init_coefficients){};

		vector<double> get_coefficients() const {return coefficients;}

		signal operator + (signal &some_signal){
			int size = max(coefficients.size(), some_signal.get_coefficients().size());
			vector<double> result ({});

			for(int i = 0; i < size; i++) {
				result.push_back(coefficients[i] + some_signal.get_coefficients()[i]);		
			}
			return signal(result);
		}
			
};


ostream& operator << (ostream& output_stream, signal some_signal){
	output_stream << some_signal.get_coefficients()[0];

	for(int i = 1; i < some_signal.get_coefficients().size() ; i++){
		double coefficient = some_signal.get_coefficients()[i];

		if (coefficient != 0){ 
			(coefficient < 0) ? output_stream << '-' : output_stream << '+';; 
			output_stream << fabs(coefficient) << 'x';

			if (i > 1){
				output_stream << superscript(i);
			}
		}
	}
	return output_stream;
}

signal convolve(signal &X, signal &Y){
	vector<double> result(X.get_coefficients().size() + Y.get_coefficients().size() -1);
	
	for(int A = 0; A < X.get_coefficients().size(); A++){
		for (int B = 0; B < Y.get_coefficients().size(); B++){
			result[A + B] += X.get_coefficients()[A] * Y.get_coefficients()[B];
		}
	}
	return signal(result);
}


int main(){
	signal a({1,2,3});
	signal b({4,5,6});
	
	vector<double> A = {1,2,3};
	vector<double> B = {4,5,6};

	signal c = convolve(a,b);
	cout << '(' << a << ")(" << b << ") = " << c <<  endl;

	//cout << a + b << endl;
}

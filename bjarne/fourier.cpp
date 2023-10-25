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

int main(){
	signal a({0,0,0,2});
	signal b({4,0,0,0,0,165});

	cout << a + b << endl;
}

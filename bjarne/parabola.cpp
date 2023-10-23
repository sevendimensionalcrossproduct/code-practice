#include <iostream>
#include <variant>
#include <vector>
#include <cmath>
#include <functional>
#include <string>

using namespace std;

class monomial{
	private:
		vector<double> coefficient;
		vector<double> index;
};

string to_superscript(long long int index){
	string superscripts[] = {"⁰","¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹"};
	string result = "";

        if (index < 0) {
        	index = -index;
		while(index>0){
        		int digit = index % 10;
        		result = superscripts[digit] + result;
        		index /= 10;
		}
		return "⁻" + result; 
	} else if (index == 0) {
		result = "⁰";
		return result;
    	} else {
	while (index > 0) {
        	int digit = index % 10;
        	result = superscripts[digit] + result;
        	index /= 10;
    	}
	return result;
	}
}

string to_superscript_double(double input){
	string superscripts[] = {"⁰","¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹"};
	string result = "";

	//Characteristic to superscript
	int characteristic = (floor(input));
    	std::string result_characteristic = to_superscript(characteristic);



	//Mantissa to superscript
	string mantissa_str = to_string(input - floor(input)).substr(2);
	size_t value = mantissa_str.find_last_not_of('0');
	if (value != std::string::npos) {
		mantissa_str= mantissa_str.substr(0, value + 1);
	}	
	
	int mantissa_int = stoi(mantissa_str);

    	std::string result_mantissa = to_superscript(mantissa_int);

    	return result_characteristic + "·" + result_mantissa;
}

string get_mantissa(double input){
	string result = to_string(input - floor(input)).substr(2);
	
	size_t value = result.find_last_not_of('0');
	if (value != std::string::npos) {
		result = result.substr(0, value + 1);
	}

	return result;
}



int main(){

	double number;
	cin >> number;
        cout << to_superscript_double(number) << endl; 
	return 0;
}

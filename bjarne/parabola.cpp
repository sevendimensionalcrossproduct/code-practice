#include <iostream>
#include <vector>
#include <cmath>
#include <functional>
#include <string>
//˙ ⁻
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
	int characteristic = (floor(input));
	double mantissa = input - characteristic;
	cout << characteristic << endl;
	cout << mantissa << endl;
	
	string result_characteristic = to_superscript(characteristic);
	string result_mantissa = "";
   	if (mantissa > 1e-16) {
        	result_mantissa += "˙";         
        	while (mantissa > 1e-3) {
            		mantissa *= 10;
            		int digit = static_cast<int>(floor(mantissa + 1e-9));
            		result_mantissa += superscripts[digit];
			mantissa -= digit;
        	}
   	}	

	return result_characteristic + result_mantissa;
}

/*ostream& operator << (ostream& os, const monomial& some_monomial) {

}*/

int main(){
	setlocale( LC_ALL, "en_US.utf8" );	
	double number;
	cin >> number;
        cout << to_superscript_double(number) << endl; 
	return 0;
}

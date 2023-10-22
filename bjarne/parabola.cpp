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

/*ostream& operator << (ostream& os, const monomial& some_monomial) {

}*/

int main(){
	setlocale( LC_ALL, "en_US.utf8" );	
	long long int number;
	cin >> number;
	cout << to_superscript(number) << endl;
	return 0;
}

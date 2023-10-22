#include <iostream>
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

string to_superscript(int index){
	string superscripts[] = {"⁰","¹","²","³","⁴","⁵","⁶","⁷","⁸","⁹"};
	string index_string = to_string(index);
	string result;

	return superscripts[3];
}

/*ostream& operator << (ostream& os, const monomial& some_monomial) {

}*/

int main(){
	setlocale( LC_ALL, "en_US.utf8" );	

	cout << to_superscript(3) << endl;
	return 0;
}

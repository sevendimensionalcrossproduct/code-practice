#include <iostream>
#include <ostream>
#include <stdexcept>
#include <vector>

std::vector<double> seven_dimensional_cross_product(const std::vector<double>& x, const std::vector<double>& y){
	if (x.size() != 7 || y.size() != 7){
		throw std::invalid_argument("Input vectors must be seven dimensional.");
	}

	std::vector<double> result(7,0.0);

	//result[0] = ();

	return result;
}

int main(void){
	std::cout << 8 % 7 << std::endl;
}

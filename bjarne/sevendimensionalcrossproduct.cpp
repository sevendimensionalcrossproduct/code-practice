#include <iostream>
#include <ostream>
#include <stdexcept>
#include <vector>

#define START(n) ((i + n) % 7 + 1)

std::vector<double> seven_dimensional_cross_product(const std::vector<double>& x, const std::vector<double>& y){
	if (x.size() != 7 || y.size() != 7){
		throw std::invalid_argument("Input vectors must be seven dimensional.");
	}

	std::vector<double> result(7,0.0);
	
	for(int i = -1; i < 6; i++){  
	result[START(1)] = (x[START(2)]*y[START(4)] - x[START(4)]*y[START(2)] + x[START(3)]*y[START(7)] - x[START(7)]*y[START(3)] + x[START(5)]*y[START(6)] - x[START(6)]*y[START(5)]);
	}

	return result;
}

void test(int n){
	for(int i = -1; i < 6; i++){
		//std::cout << (i + 1) % 7 + 1 <<std::endl;
		//std::cout <<(i + 3) % 7 + 1 << std::endl;
		std::cout <<(i + n) % 7 + 1 << std::endl;
		//std::cout <<(i + 6) % 7 + 1 << std::endl;
		
		
	}
}

int main(void){
	std::vector<double> x{1.0,0.0,0.0,0.0,0.0,0.0,0.0};
	std::vector<double> y{1.0,0.0,0.0,0.0,0.0,0.0,0.0};
	
	test(7);
}

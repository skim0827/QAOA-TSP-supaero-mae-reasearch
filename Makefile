tb : qaoa.cpp tb.cpp qaoa.hpp 
	g++ -std=c++17 -Wall qaoa.cpp tb.cpp -o tb 

clean: 
	rm -f tb 

run : tb
	./tb 
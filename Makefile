CC=g++
#CFLAGS=-c -Wall -Wextra -ansi -pedantic -std=c++11 -stdlib=libc++
CFLAGS=-c -Wall -Wextra -ansi -std=c++11 -Wno-unused-parameter \
       -Wno-unused-function -ggdb3
LDFLAGS=
SOURCES=src/ndet.cpp src/expression_rationnelle.cpp src/parser.tab.cpp \
	src/lex.yy.cpp
OBJECTS=$(SOURCES:.cpp=.o)
	EXECUTABLE=ndet

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@


.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

src/parser.tab.cpp: src/parser.y
	bison -d src/parser.y --output-file=src/parser.tab.cpp

src/lex.yy.cpp: src/parser.lex
	flex -o src/lex.yy.cpp src/parser.lex



clean:
	rm -f ndet src/*.o
cleanparser:
	# rm -f src/lex.yy.cpp src/location.hh src/parser.tab.cpp
	# rm -f src/parser.tab.hpp src/position.hh src/stack.hh
	@echo -e "\033[1;31mError: the following command causes an error. We \
	can't rebuild the binary, please do not use it anymore.\033[0m"
	# rm -f src/lex.yy.cpp src/parser.tab.cpp
	# $(EXECUTABLE)

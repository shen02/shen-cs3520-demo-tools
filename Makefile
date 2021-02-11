PROGRAMS=scratch valgrind_uninit valgrind_invalid valgrind_return gdb_zero gdb_bounds gdb_loop gdb_fact gdb_objects gcov_test gcov_evenodd callgrind_test callgrind_vector

CXXFLAGS=-std=c++11 -O0 -g -fno-inline -Wall # -Werror -pedantic-errors
LDFLAGS=-std=c++11

## for gcov
CXXFLAGS:=$(CXXFLAGS) -fprofile-arcs -ftest-coverage
LDFLAGS:=$(LDFLAGS) -fprofile-arcs

all: $(PROGRAMS)

$(PROGRAMS): %: %.o
	g++ $(LDFLAGS) $< -o $@

%.o: %.cpp Makefile
	g++ $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf test.log *~ *.o *.dSYM $(PROGRAMS) *.gcda *.gcno *.gcov callgrind.out.*

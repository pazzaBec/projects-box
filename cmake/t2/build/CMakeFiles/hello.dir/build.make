# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/liu/MyTest/cmake/t2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liu/MyTest/cmake/t2/build

# Include any dependencies generated for this target.
include CMakeFiles/hello.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hello.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello.dir/flags.make

CMakeFiles/hello.dir/lib/hello.cpp.o: CMakeFiles/hello.dir/flags.make
CMakeFiles/hello.dir/lib/hello.cpp.o: ../lib/hello.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liu/MyTest/cmake/t2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hello.dir/lib/hello.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hello.dir/lib/hello.cpp.o -c /home/liu/MyTest/cmake/t2/lib/hello.cpp

CMakeFiles/hello.dir/lib/hello.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello.dir/lib/hello.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liu/MyTest/cmake/t2/lib/hello.cpp > CMakeFiles/hello.dir/lib/hello.cpp.i

CMakeFiles/hello.dir/lib/hello.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello.dir/lib/hello.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liu/MyTest/cmake/t2/lib/hello.cpp -o CMakeFiles/hello.dir/lib/hello.cpp.s

CMakeFiles/hello.dir/lib/hello.cpp.o.requires:

.PHONY : CMakeFiles/hello.dir/lib/hello.cpp.o.requires

CMakeFiles/hello.dir/lib/hello.cpp.o.provides: CMakeFiles/hello.dir/lib/hello.cpp.o.requires
	$(MAKE) -f CMakeFiles/hello.dir/build.make CMakeFiles/hello.dir/lib/hello.cpp.o.provides.build
.PHONY : CMakeFiles/hello.dir/lib/hello.cpp.o.provides

CMakeFiles/hello.dir/lib/hello.cpp.o.provides.build: CMakeFiles/hello.dir/lib/hello.cpp.o


# Object files for target hello
hello_OBJECTS = \
"CMakeFiles/hello.dir/lib/hello.cpp.o"

# External object files for target hello
hello_EXTERNAL_OBJECTS =

lib/libhello.a: CMakeFiles/hello.dir/lib/hello.cpp.o
lib/libhello.a: CMakeFiles/hello.dir/build.make
lib/libhello.a: CMakeFiles/hello.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liu/MyTest/cmake/t2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library lib/libhello.a"
	$(CMAKE_COMMAND) -P CMakeFiles/hello.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello.dir/build: lib/libhello.a

.PHONY : CMakeFiles/hello.dir/build

CMakeFiles/hello.dir/requires: CMakeFiles/hello.dir/lib/hello.cpp.o.requires

.PHONY : CMakeFiles/hello.dir/requires

CMakeFiles/hello.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello.dir/clean

CMakeFiles/hello.dir/depend:
	cd /home/liu/MyTest/cmake/t2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liu/MyTest/cmake/t2 /home/liu/MyTest/cmake/t2 /home/liu/MyTest/cmake/t2/build /home/liu/MyTest/cmake/t2/build /home/liu/MyTest/cmake/t2/build/CMakeFiles/hello.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello.dir/depend


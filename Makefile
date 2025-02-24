TARGET = kalman-test

SRC_DIR = src
BUILD_DIR = build

SRCS = kalman-test.cpp kalman.cpp
OBJS = $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRCS))

CXX = g++
CXXFLAGS = -I/usr/include/eigen3 -Wall


all: $(TARGET)

# Create the build directory
$(BUILD_DIR):
	mkdir -pv $(BUILD_DIR)
	echo "before build"

# Compile ojbect files 
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@
	echo "before TARGET"


# Compile and build the program
$(TARGET): $(OBJS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/$(TARGET) $(OBJS)
	
# run the built program
run: $(TARGET)
	./$(BUILD_DIR)/$(TARGET)

# Remove build directory with all built files
clean:
	rm -rf $(BUILD_DIR) 

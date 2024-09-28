CC = gcc
CFLAGS = -Wall -g -I$(SRC_DIR)

SRC_DIR = src
BUILD_DIR = build
TESTS_OUTPUT = test_computer

SOURCES := $(shell find $(SRC_DIR) -name '*.c')
BUILD := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SOURCES))


all: run_tests

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@) 
	$(CC) $(CFLAGS) -c $< -o $@

$(TESTS_OUTPUT): $(BUILD)
	$(CC) $(CFLAGS) $(BUILD) -o $(TESTS_OUTPUT)

run_tests: $(TESTS_OUTPUT)
	./test_computer

clean:
	rm -rf $(BUILD_DIR)/*.o $(BUILD_DIR)/*/*.o  $(TESTS_OUTPUT)

.PHONY: all clean run_tests

CC = gcc
CFLAGS = -Wall -g -MMD -MP

SRC_DIR = ./src/chips
BUILD_DIR = ./build/src/chips

SOURCES := $(shell find $(SRC_DIR) -name '*.c')
BUILD := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SOURCES))

TEST_DIR = ./tests/chips
TEST_BUILD_DIR = ./build/tests/chips
BIN_DIR = ./bin

TEST_SOURCES := $(shell find $(TEST_DIR) -name '*.c')
TEST_BUILD := $(patsubst $(TEST_DIR)/%.c,$(TEST_BUILD_DIR)/%.o,$(TEST_SOURCES))

TEST_OUTPUT = $(BIN_DIR)/test_chips


# Build application object files
build: $(BUILD)
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -I $(SRC_DIR) -c $< -o $@


# Build test object files
build_test: build $(TEST_BUILD)
$(TEST_BUILD_DIR)/%.o: $(TEST_DIR)/%.c
	@mkdir -p $(TEST_BUILD_DIR)
	$(CC) $(CFLAGS) -I $(SRC_DIR) -I$(TEST_DIR) -c $< -o $@


# Link the test executable
link_test: build_test
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(TEST_BUILD) $(BUILD) -o $(TEST_OUTPUT)


# Run the test
test: link_test
	$(TEST_OUTPUT)


# Clean all build files
clean:
	rm -rf $(BUILD_DIR) $(TEST_BUILD_DIR) $(TEST_OUTPUT)


.PHONY: clean test link_test build_test  build

# Project name and version
PROJECT_NAME = lebar
VERSION = 0.1

# Source and output directories
SRC_DIR = src
BUILD_DIR = build
INSTALL_DIR = /opt/lebar/

# .love file and shell script
LOVE_FILE = $(BUILD_DIR)/$(PROJECT_NAME).love
SCRIPT_FILE = $(BUILD_DIR)/lebar

# LÖVE executable (adjust the path if needed)
LOVE_EXECUTABLE = ./love

LEBARDOCK = lebardock

# Default target
all: $(LOVE_FILE) $(LOVE_EXECUTABLE) $(SCRIPT_FILE) $(LEBARDOCK)

# Create the .love file
$(LOVE_FILE):
	@echo "Creating $(LOVE_FILE)..."
	@mkdir -p $(BUILD_DIR)
	@zip -r -j $(LOVE_FILE) $(SRC_DIR)

# Copy love executable
$(LOVE_EXECUTABLE): $(LOVE_FILE)
	@echo "Copying LÖVE executable..."
	@cp  /usr/bin/love $(BUILD_DIR)

# Copy lebardock
$(LEBARDOCK): $(LOVE_FILE)
	@echo "Copying lebardock..."
	@cp $(LEBARDOCK) $(BUILD_DIR)/$(LEBARDOCK)

# Create the shell script
$(SCRIPT_FILE): $(LOVE_FILE)
	@echo "Creating $(SCRIPT_FILE)..."
	@echo '#!/bin/bash' > $(SCRIPT_FILE)
	@echo '' >> $(SCRIPT_FILE)
	@echo '# Path to the LÖVE executable' >> $(SCRIPT_FILE)
	@echo 'LOVE_EXECUTABLE="$(LOVE_EXECUTABLE)"' >> $(SCRIPT_FILE)
	@echo '' >> $(SCRIPT_FILE)
	@echo '# Path to the .love file' >> $(SCRIPT_FILE)
	@echo 'GAME_FILE="$(PROJECT_NAME)".love' >> $(SCRIPT_FILE)
	@echo '' >> $(SCRIPT_FILE)
	@echo '# Check if LÖVE is installed' >> $(SCRIPT_FILE)
	@echo 'if command -v love &> /dev/null' >> $(SCRIPT_FILE)
	@echo 'then' >> $(SCRIPT_FILE)
	@echo '    # Run the game with the systems LÖVE executable' >> $(SCRIPT_FILE)
	@echo '    love "$$GAME_FILE"' >> $(SCRIPT_FILE)
	@echo 'else' >> $(SCRIPT_FILE)
	@echo '    # Run the game with the bundled LÖVE executable' >> $(SCRIPT_FILE)
	@echo '    "$$LOVE_EXECUTABLE" "$$GAME_FILE"' >> $(SCRIPT_FILE)
	@echo 'fi' >> $(SCRIPT_FILE)
	@chmod +x $(SCRIPT_FILE)

# Clean target
clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)

# Install target
install:
	@echo "Installing.."
	@mkdir -p $(INSTALL_DIR)
	@cp -r $(BUILD_DIR) $(INSTALL_DIR)

# Phony targets
.PHONY: all clean install

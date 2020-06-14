SHELL := bash
NAME := archiver
BIN := bin

PACKAGES ?= $(shell go list ./...)
SOURCES ?= $(shell find . -name "*.v" -type f)
TESTS ?= $(shell find . -name "*_test.v" -type f)

.PHONY: all
all: build

.PHONY: clean
clean:
	rm -rf $(BIN)

.PHONY: fmt
fmt:
ifdef CI
	v fmt -c $(SOURCES)
else
	v fmt -w $(SOURCES)
endif

.PHONY: test
test:
	v -stats test $(TESTS)

.PHONY: build
build: $(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(SOURCES)
	@mkdir -p $(BIN)
	v -o $(BIN)/$(NAME) -prod -stats $(NAME).v

NAME = exec.out

# TODO: Read about those flags
CFLAGS = -Wall -Wextra -pedantic -fstack-protector-all -Wstack-protector

# Folder to store object code files
OBJ = .obj

# Folder with source code files
SRC = src

OBJ_FILES  = main.o
OBJ_FILES += foo.o

all: $(NAME)

debug: CFLAGS += -g
debug: $(NAME)

# Add OBJ directory before OBJ file path
OBJ_FILES := $(patsubst %,$(OBJ)/%,$(OBJ_FILES))

# Build executable file from object code files
$(NAME): $(OBJ_FILES)
	$(CC) $^ -o $(NAME)

# Compile source code files into object code files
$(OBJ)/%.o: $(SRC)/%.c | $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

# Create folder for object code files
$(OBJ):
	mkdir $@

clean:
	rm -rf $(NAME) $(OBJ)

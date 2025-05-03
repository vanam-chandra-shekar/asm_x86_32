#!/usr/bin/env python3
import sys
import subprocess
import os

def run(file_path: str):
    # Extract the filename without extension
    filename = os.path.basename(file_path).replace(".s", "")
    
    # Compile the assembly file
    obj_file = f"{filename}.o"
    subprocess.run(["as", "--32", "-o", obj_file, file_path], check=True)
    
    # Link the object file
    exec_file = filename
    subprocess.run(["ld", "-m", "elf_i386", obj_file, "-o", exec_file], check=True)
    

    
    # Run the executable and capture the exit code
    result = subprocess.run(["./" + exec_file], check=False)
    if result.stdout:
        print(result.stdout.strip())
    else:
        print("No output from executable.")
    
    # Print the stderr of the executable if it exists
    if result.stderr:
        print(f"Error: {result.stderr.strip()}")
    
    # Print the exit code of the executable
    print(f"Exit code: {result.returncode}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python run.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    run(file_path)
import os
import shutil
import argparse


def main():
    parser = argparse.ArgumentParser(
        description="Copy .clangd, .clang-format, and .gitignore files to the specified root directory.")
    parser.add_argument('root_dir', type=str, help='Root directory where files will be copied')
    args = parser.parse_args()

    # Get the directory of the script
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Ensure the root directory exists
    root_dir = os.path.abspath(args.root_dir)
    if not os.path.exists(root_dir):
        print(f"Error: The specified root directory '{root_dir}' does not exist.")
        return

    script_dir = os.path.dirname(os.path.abspath(__file__))
    # List of files to process
    files_to_copy = ['.clangd', '.clang-format', '.gitignore']
    for file_name in files_to_copy:
        src = os.path.join(script_dir, file_name)
        dest = os.path.join(root_dir, file_name)

        if file_name == '.gitignore' and os.path.exists(dest):
            print(
                "You already have a .gitignore, not clobbering it. If you want to replace it, delete the current one first.")
        else:
            if file_name != '.gitignore' or not os.path.exists(dest):
                shutil.copy(src, dest)
                print(f"Copied {file_name} to {root_dir}")

    # Handle special case for .gitignore
    gitignore_path = os.path.join(root_dir, '.gitignore')
    if os.path.exists(gitignore_path):
        with open(gitignore_path, 'r+') as f:
            lines = f.readlines()
            if '.gitignore\n' not in lines:
                f.write('.gitignore\n')
                print(
                    "Added .gitignore to .gitignore as it was not present, this is required because the content of the gitignore is stored in clang_formatting not in this project.")


if __name__ == "__main__":
    main()

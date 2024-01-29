import sys
import re
import os

remove_filter = ['CMakeCCompilerId', 'CMakeCXXCompilerId', 'CMakeCXXCompilerABI', 'CMakeCCompilerABI', 'testCXXCompiler', 'rcl_logging_spdlog.cpp']

pattern = r"------- [a-zA-Z]+ [a-zA-Z]+\.\d+\.\d+\.\d+\.[a-zA-Z|\d]+ \([a-zA-Z]+\) -------"  

 

def main(args, argv):
    if args < 2:
        return
    file_name = argv[1]
    print("open file: " + file_name)
    new_file = ""
    with open(file_name, "r", encoding="utf-8") as f:
        should_remove = False
        new_line = ""
        for line in f.readlines():
            if re.search(pattern, line) is not None:
                if should_remove is True:
                    new_line = ""
                elif should_remove is False:
                    new_file += new_line
                    new_line = ""
                should_remove = False

            if should_remove is False:
                for str in remove_filter:
                    if line.find(str) != -1:
                        should_remove = True
                        break
            
            if should_remove is True:
                continue

            new_line += line

    new_file_name = argv[2] if args >= 3  else file_name + ".new"
    print("write in " + new_file_name)
    if os.path.exists(new_file_name):
        os.remove(new_file_name)
    with open(new_file_name, 'w', encoding='utf-8') as f:
        f.write(new_file)


if __name__ == '__main__':
    main(len(sys.argv), sys.argv)

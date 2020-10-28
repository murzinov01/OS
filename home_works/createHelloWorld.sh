#!/bin/bash

touch cprogramm.c

echo '#include <stdio.h>
int main(int argc, char *argv[]){
FILE *f = fopen("new_programm.sh", "w");
fprintf(f, "#!/bin/bash\ntouch hello_world.c\necho \"#include <stdio.h>\nint main(int argc, char *argv[]){\nprintf(\\\"Hello World!\\\");\n}\" > hello_world.c\ngcc -o hello_world hello_world.c\n./hello_world\n");
popen("bash ./new_programm.sh", "w");
}' > cprogramm.c

gcc -o cprogramm ./cprogramm.c
./cprogramm

rm ./hello_world.c
rm ./hello_world
rm ./cprogramm
rm ./cprogramm.c
rm ./new_programm.sh
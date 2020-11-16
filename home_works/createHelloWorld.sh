#!/bin/bash

touch cprogramm.c

echo '#include <stdio.h>
int main(int argc, char *argv[]){
FILE *f = fopen("new_programm.sh", "w");
fprintf(f, "#!/bin/bash\ntouch HelloWorld.c\necho \"#include <stdio.h>\nint main(int argc, char *argv[]){\nprintf(\\\"Hello World!\\\");\n}\" > HelloWorld.c\ngcc -o HelloWorld HelloWorld.c\n./HelloWorld\nrm ./HelloWorld.c\nrm ./HelloWorld");
popen("bash ./new_programm.sh", "w");
}' > cprogramm.c

gcc -o cprogramm ./cprogramm.c
./cprogramm

rm ./cprogramm
rm ./cprogramm.c
rm ./new_programm.sh

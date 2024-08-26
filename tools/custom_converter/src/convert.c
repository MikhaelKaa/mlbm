
// Отрезает первые 188 байт от wav файла (заголовок).
// Также сдвигает все отсчеты вправо, страший бит всегда 0, для сжатия и обхода херни с знаковым и беззнаковым звуком.
// Михаил Каа
// 26.08.2024

#include <stdio.h>

int main(int argc, char *argv[]) {

    if(argc < 3) {
        printf("use ./convert in_file.wav out_file.raw\n");
    }

    FILE *in  = fopen(argv[1], "r");
    FILE *out = fopen(argv[2], "w");
    
    if(in == NULL) {
        printf("error open file\n");
        return 1;
    }

    int c = 0; 
    int cnt = 0;
    while ((c = fgetc(in)) != EOF) {
        if(cnt++ >= 187) {
            //fputc(c>>1, out);
            fputc(c, out);
        } else {
            //fputc(c, out);
        }
    }

    fclose(in);
    fclose(out);
    printf("Done\n");
    return 0;
}

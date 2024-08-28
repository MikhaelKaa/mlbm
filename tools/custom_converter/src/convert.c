
// Отрезает первые 188 байт от wav файла (заголовок).
// magic
// Михаил Каа
// 28.08.2024

#include <stdio.h>


typedef struct wav_header {
    // RIFF Header
    char riff_header[4]; // Contains "RIFF"
    int wav_size; // Size of the wav portion of the file, which follows the first 8 bytes. File size - 8
    char wave_header[4]; // Contains "WAVE"
    
    // Format Header
    char fmt_header[4]; // Contains "fmt " (includes trailing space)
    int fmt_chunk_size; // Should be 16 for PCM
    short audio_format; // Should be 1 for PCM. 3 for IEEE Float
    short num_channels;
    int sample_rate;
    int byte_rate; // Number of bytes per second. sample_rate * num_channels * Bytes Per Sample
    short sample_alignment; // num_channels * Bytes Per Sample
    short bit_depth; // Number of bits per sample
    
    // Data
    char data_header[4]; // Contains "data"
    int data_bytes; // Number of bytes in data. Number of samples * num_channels * sample byte size
    // uint8_t bytes[]; // Remainder of wave file is bytes
} wav_header;

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

    int data = 0; 
    int diff = 0;
    int last = 0;
    int cnt = 0;
    while ((data = fgetc(in)) != EOF) {
        if(cnt++ >= 187) {
            data = data>>1;
            diff = last - data;
            fputc(diff, out);
            last = data;
        }
    }

    fclose(in);
    fclose(out);
    printf("Done\n");
    printf("sizeof(wav_header) = %d\n", sizeof(wav_header));
    return 0;
}

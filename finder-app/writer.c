#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    openlog(NULL, 0, LOG_USER);
    if (argc < 3) {
        syslog(LOG_ERR, "Usage: %s <filename> <content>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    FILE *file = fopen(filename, "w");
    if (!file) {
        syslog(LOG_ERR, "Error opening file.\n");
        return 1;
    }

    fprintf(file, "%s", argv[2]);
    syslog(LOG_DEBUG, "Writing %s to file %s\n", argv[2] ,filename);

    fclose(file);
    return 0;
}

#include <stdio.h>
#include <stdbool.h>

int main () {
  // file pointer to store the binary file
  FILE *file;
  // stores how many bytes we're reading from the file
  int count;
  // keep track of how many bytes we are into the file
  int address = 0;
  // array to hold 16 bytes and using unsigned char so each element can be from 0 to 255
  unsigned char bytes[16];
  int i;

  // opens the binary.out file and stores it in the file pointer
  file = fopen("binary.out", "rb");

  // check if file can't be opened
  if (file == NULL) {return 1;}

  // set an infinite loop until a condition is met to stop the loop aka when there's no more bytes
  while(true){
    // read up to 16 bytes from the file and store those bytes in the bytes array while saving the number of bytes read into count
    count = fread(bytes, 1, 16, file);

    // condition to end loop when there are no more bytes to read
    if (count == 0) {break;}
    // print the address in hex
    printf("%08x ", address);
    // print the middle consecutive bytes in hex which is 16 so loop 16 times
    for (i = 0; i < 16; i++){
      // check if there is a byte and print it
      if (i < count){
	printf("%02x ", bytes[i]);
      } else {
	// no byte to print
	printf("   ");
      }
    }

    // printing a divider to start the ASCII section
    printf("|");
    // print the bytes that were read into ASCII
    for (i = 0; i < count; i++){
      // check if the byte is within the range in ASCII to be printable
      if (bytes[i] >= 32 && bytes[i] <= 126){
	// print the bytes as a character
	printf("%c", bytes[i]);
      } else {
	// print . for bytes that can't be printed
	printf(".");
      }
    }

    // put another divider to end the ASCII section and make a new line
    printf("|\n");
    // update the address by incrementing by count
    address += count;
  }
  // close the file pointer
  fclose(file);

  return 0;
}


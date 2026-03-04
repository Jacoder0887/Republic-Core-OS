void printf(char* str)
{
    unsigned short* VideoMemory = (unsigned short*) 0xb8000;
    
    for(int i=0; str[i] != '\0'; i++)
    {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
    }
}
void intToStr(int num, char* str) {
    int i = 0;
    bool isNegative = false;

    // Handle zero explicitly, otherwise empty string
    if (num == 0) {
        str[i++] = '0';
        str[i] = '\0';
        return;
    }

    // Handle negative numbers, we only deal with positive numbers
    if (num < 0) {
        isNegative = true;
        num = -num;  // Make num positive
    }

    // Convert integer to string (reversed order)
    while (num != 0) {
        str[i++] = (num % 10) + '0';  // Convert digit to char
        num = num / 10;
    }

    // Add negative sign if needed
    if (isNegative) {
        str[i++] = '-';
    }

    str[i] = '\0';  // Null-terminate the string

    // Reverse the string to get the correct order
    int start = 0;
    int end = i - 1;
    while (start < end) {
        // Swap characters at start and end
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;
        start++;
        end--;
    }
}

extern "C" void kernelMain(void* multiboot_structure, unsigned int magicnumber)
{
    int num = 123 * 1;
    char str[20];  // Ensure enough space to hold the string
    intToStr(num, str);  // Convert integer to string

    // Assign the converted integer string to a variable
    char* result = str;
  
    printf(result);

    while (1);  
}


//Taken from https://groups.google.com/forum/#!msg/linux-sunxi/zx4gwC1QyMc/yzIhzANutmYJ
#include <stdio.h> 
extern char _mali_clz_lut[256]; 
int main() 
{ 
    int i; 
    printf("char _mali_clz_lut[256] = {"); 
    for (i = 0; i < 256; i++) { 
        if (i % 16 == 0) 
            printf("\n    "); 
        printf("%d, ", _mali_clz_lut[i]); 
    } 
    printf("\n};\n"); 
    return 0; 
} 

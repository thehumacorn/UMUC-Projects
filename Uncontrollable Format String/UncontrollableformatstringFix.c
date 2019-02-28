#include <stdio.h>

   void main(int argc, char** argv)
  {
   char s[32];
   
   gets(s);
   printf("%s","You typed: ");
   printf("%s",s);
   printf("%s","\n");
 }
 
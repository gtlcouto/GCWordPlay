//
//  main.m
//  W1D1WordPlay
//
//  Created by Gustavo Couto on 2016-05-02.
//  Copyright © 2016 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
  do {
    // Buffer
    int inputOperations;
    // 1. Get Option
    printf("Operations: \n");
    printf("1.Uppercase \n");
    printf("2.Lowercase \n");
    printf("3.Numberize \n");
    printf("4.Canadianize \n");
    printf("5.Respond \n");
    printf("6.De-space-it \n");
    printf("7.Quit \n");
    // Get User Input
    // fgets(inputArray, 1, stdin);
    printf("Choose One: ");
    scanf("%i", &inputOperations);

    // check for quit
    if (inputOperations == 7) {
      return 1;
    }

    // 2. Get String Input
    char inputString[255];
    printf("Enter the string to be modified: \n");
      
    // flush stdin
    int c;
    while ((c = getchar()) != '\n' && c != EOF)
      ;
    // scanf("%c", &inputString);
    fgets(inputString, 255, stdin);

    // Create NSString object
    NSString *inputNSString = [[NSString alloc] initWithUTF8String:inputString];
    // 3. Switch option
    switch (inputOperations) {
    case 1:
      NSLog(@"%@", [inputNSString uppercaseString]);
      break;
    case 2:
      NSLog(@"%@", [inputNSString lowercaseString]);
      break;
    case 3:
      NSLog(@"%d", [inputNSString intValue]);
      break;
    case 4:
      inputNSString = [inputNSString stringByReplacingOccurrencesOfString:@"\n"
                                                               withString:@""];
      NSLog(@"%@", [inputNSString stringByAppendingString:@", eh?"]);
      break;
    case 5:
      inputNSString = [inputNSString stringByReplacingOccurrencesOfString:@"\n"
                                                               withString:@""];
      if ([inputNSString hasSuffix:@"?"]) {
        NSLog(@"I dont know");
      } else if ([inputNSString hasSuffix:@"!"]) {
        NSLog(@"Whoa take a chill pill");
      } else {
        NSLog(@"couldnt answer sorry");
      }
      break;
    case 6:
      NSLog(@"%@", [inputNSString stringByReplacingOccurrencesOfString:@" "
                                                            withString:@"-"]);
      break;

    default:
      break;
    }
  } while (true);

  return 0;
}

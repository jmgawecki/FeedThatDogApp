//
//  SecondVC.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (instancetype)initWithName:(NSString *)name {
   if (self = [super init]) {
      self.person = [[Person alloc] init];
      [self.person setValue:name forKey:@"name"];
      NSLog(@"%@", [self.person valueForKey:@"name"]);
   }
   return self;
}


- (IBAction)showDataButtonTapped:(id)sender {
   if (self.nameTextField.text != nil) {
      if (self.ageTextField.text != nil) {
         if (self.heightTextField.text != nil) {
            // You had an error here.
            // Remember to never put primitive types into an NSDictionary. Always wrap them
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        self.nameTextField.text,                                            @"name",
                                        // If creation of Integer cannot be done from the String, the value will be 0
                                        [NSNumber numberWithInt: [self.heightTextField.text intValue]],     @"height",
                                        [NSNumber numberWithInt: [self.ageTextField.text intValue]],        @"age",
                                        nil];
            
            [self.person setValuesForKeysWithDictionary:dictionary];
            
            NSDictionary *newDictionary = [self.person dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"name", @"age", @"height", nil]];
            
            NSLog(@"%@", newDictionary);
            
            [self.navigationController pushViewController:[[ThirdVC alloc] initWithPerson:self.person] animated:YES];
         }
      }
   }
}

@end

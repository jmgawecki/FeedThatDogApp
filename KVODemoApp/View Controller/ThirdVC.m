//
//  ThirdVC.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import "ThirdVC.h"

@interface ThirdVC ()

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithPerson:(Person *)person {
   self = [super init];
   if (self) {
      self.person = person;
   }
   return self;
}


- (IBAction)cookieButtonTapped:(id)sender {
   
   [self.person setValue:self.cookieTextField.text
              forKeyPath:@"cookie.name"];
   
   NSString *cookiesName = [self.person valueForKeyPath:@"cookie.name"];
   
   NSLog(@"%@", cookiesName);
   
   [self.navigationController pushViewController:[[ForthVC alloc] initWithPerson:self.person] animated:YES];
}

@end


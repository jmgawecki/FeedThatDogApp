//
//  ViewController.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view.
}

- (void)goNextScreenButtonTapped {
   if (self.nameTextField.text != nil) {
      self.secondVC = [[SecondVC alloc] init];
   }
}

- (IBAction)goNextButtonTapped:(id)sender {
   if (self.nameTextField.text != nil) {
      self.secondVC = [[SecondVC alloc] initWithName:self.nameTextField.text];
      [self.navigationController pushViewController:self.secondVC animated:YES];
   }
}

@end

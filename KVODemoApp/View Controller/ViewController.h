//
//  ViewController.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import <UIKit/UIKit.h>
#import "SecondVC.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UIButton *goNextButton;
@property (strong, nonatomic) SecondVC *secondVC;

@end


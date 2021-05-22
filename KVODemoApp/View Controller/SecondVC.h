//
//  SecondVC.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "ThirdVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *heightTextField;
@property (strong, nonatomic) IBOutlet UIButton *showDataButton;

@property NSString *name;
@property Person *person;

-(instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

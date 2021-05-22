//
//  ThirdVC.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "ForthVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *cookieTextField;

@property (strong, nonatomic) Person *person;

-(instancetype)initWithPerson:(Person *)person;

@end

NS_ASSUME_NONNULL_END

//
//  HowManyCookiesVC.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 25/05/2021.
//

#import <UIKit/UIKit.h>
@class AppAssembly;

NS_ASSUME_NONNULL_BEGIN

@interface HowManyCookiesVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *howManyCookiesLabel;

@property AppAssembly *appAssembly;

-(instancetype)initWithAppAssembly:(AppAssembly *)appAssembly;

@end

NS_ASSUME_NONNULL_END

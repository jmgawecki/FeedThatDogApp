//
//  SceneDelegate.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import <UIKit/UIKit.h>
#import "DogInteractionVC.h"
#import "Person.h"
#import "AppAssembly.h"

NS_ASSUME_NONNULL_BEGIN

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic, nullable) UIWindow * window;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) UIViewController *viewController;

@property AppAssembly *appAssembly;

@end

NS_ASSUME_NONNULL_END

//
//  AppAssembly.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 24/05/2021.
//

#import <Typhoon/Typhoon.h>
#import "Person.h"
#import "Dog.h"
#import "Cookie.h"
#import "DogInteractionVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppAssembly : TyphoonAssembly

-(Person *)me;

-(Dog *)dog;

-(DogInteractionVC *)dogVC;


@end

NS_ASSUME_NONNULL_END

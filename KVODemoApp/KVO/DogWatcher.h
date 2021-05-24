//
//  DogWatcher.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 23/05/2021.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface DogWatcher : NSObject

@property Dog *observedDog;

@end

NS_ASSUME_NONNULL_END

//
//  Dog.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import <Foundation/Foundation.h>
#import <dispatch/dispatch.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject

@property int hungerLevel;


-(void)dogGetsHungry;

@end

NS_ASSUME_NONNULL_END

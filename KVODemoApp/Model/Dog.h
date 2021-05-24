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

@property int                 hungerLevel;
@property int                 toiletNeed;
@property int                 dirtinessLevel;

@property (nullable) NSTimer* hungerTimer;
@property (nullable) NSTimer* toiletTimer;
@property (nullable) NSTimer* cleaningnessTimer;


-(void)dogGetsHungry;
-(void)dogGetsDirty;
-(void)dogNeedsToilet;

@end

NS_ASSUME_NONNULL_END

//
//  Dog.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import "Dog.h"


@implementation Dog


- (instancetype)init
{
   self = [super init];
   if (self) {
      self.hungerLevel = 0;
   }
   return self;
}

- (void)dealloc
{
   NSLog(@"Class has been deeallocated");
}


-(void)dogGetsHungry {
   [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
      self.hungerLevel += 10;
      NSLog(@"Hunger level grows");
   }];
}


@end

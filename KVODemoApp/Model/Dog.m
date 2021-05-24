//
//  Dog.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import "Dog.h"


@implementation Dog

static void *hungerlevelContext = &hungerlevelContext;


// MARK: - Initialize

- (instancetype)init
{
   self = [super init];
   if (self) {
      self.hungerLevel = 0;
      self.dirtinessLevel = 0;
      self.toiletNeed = 0;
   }
   return self;
}


// MARK: - Dealloc


- (void)dealloc
{
   [self.hungerTimer invalidate];
   [self.cleaningnessTimer invalidate];
   [self.toiletTimer invalidate];
}


// MARK: - Method


-(void)dogGetsHungry {
   if (self.hungerTimer != nil) {
      [self.hungerTimer invalidate];
      self.hungerTimer = nil;
   }
   self.hungerTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
      self.hungerLevel += 10;
      NSLog(@"hunger level: %d", self.hungerLevel);
   }];
   self.hungerTimer.tolerance = 0.1;
}

-(void)dogGetsDirty {
   if (self.cleaningnessTimer != nil) {
      [self.cleaningnessTimer invalidate];
      self.cleaningnessTimer = nil;
   }
   
   self.cleaningnessTimer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
      self.dirtinessLevel += 10;
      NSLog(@"dirtiness level: %d", self.dirtinessLevel);
   }];
   self.cleaningnessTimer.tolerance = 0.1;
}


-(void)dogNeedsToilet {
   if (self.toiletTimer != nil) {
      [self.toiletTimer invalidate];
      self.toiletTimer = nil;
   }
   
   self.toiletTimer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
      self.toiletNeed += 10;
      NSLog(@"toilet need: %d", self.toiletNeed);
   }];
   self.toiletTimer.tolerance = 0.1;
}


@end

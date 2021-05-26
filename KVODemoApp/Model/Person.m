//
//  Person.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import "Person.h"
#import "Cookie.h"

@implementation Person

- (instancetype)init
{
   self = [super init];
   if (self) {
      self.cookie = [[Cookie alloc] init];
      self.cookies = [NSMutableArray<Cookie *> new];
      [self.cookies addObject:self.cookie];
      NSLog(@"You have %lu Cookies!", self.cookies.count);
      [self addObservers];
   }
   return self;
}


-(void)addObservers {
   [self addObserver:self
          forKeyPath:@"doggo"
             options:NSKeyValueObservingOptionNew
             context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
   if ([keyPath isEqualToString:@"doggo"]) {
      NSLog(@"value of the doggo in observeValueForKeyPath: %@", [object valueForKeyPath:keyPath]);
      [self.doggo dogGetsHungry];
      [self.doggo dogGetsDirty];
      [self.doggo dogNeedsToilet];   }
   
}

@end

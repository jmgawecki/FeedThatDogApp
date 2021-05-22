//
//  ForthVC.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import "ForthVC.h"

@interface ForthVC ()

@end

@implementation ForthVC


- (void)viewDidLoad {
   [super viewDidLoad];
   [self observeDogHungerLevel];
    // Do any additional setup after loading the view from its nib.
}


- (instancetype)initWithPerson:(Person *)person {
   self = [super init];
   if (self) {
      self.person = person;
   }
   return self;
}


- (IBAction)buyDogButtonTapped:(id)sender {
   self.person.doggo = [[Dog alloc] init];
   if (self.person.doggo) {
      dispatch_async(dispatch_get_main_queue(), ^{
         self.dogInfoLabel.text = @"Your dog is fine :)";
      });
   }
}


- (IBAction)feedDogButtonTapped:(id)sender {
   
}

-(void)observeDogHungerLevel {
   [self addObserver:self
          forKeyPath:@"person.doggo.hungerLevel"
             options:NSKeyValueObservingOptionNew
             context:nil];
}


-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context {
   if ([keyPath isEqualToString:@"person.doggo.hungerLevel"]) {
      int hunger = [[object valueForKeyPath:keyPath] intValue];
      if (hunger < 30) {
         dispatch_async(dispatch_get_main_queue(), ^{
            self.dogHungerLabel.text = @"Your dog is fine:)";
         });
      } else if (hunger < 50) {
         dispatch_async(dispatch_get_main_queue(), ^{
            self.dogHungerLabel.text = @"Your dog is getting little hungry";
         });
      } else if (hunger < 70) {
         dispatch_async(dispatch_get_main_queue(), ^{
            self.dogHungerLabel.text = @"Your should feed your dog";
         });
      } else if (hunger < 100) {
         dispatch_async(dispatch_get_main_queue(), ^{
            self.dogHungerLabel.text = @"Your dog is very hungry! Feed him or he will run away!";
         });
      }
      
      if (hunger > 160) {
         [self removeObserver:self
                   forKeyPath:@"person.doggo.hungerLevel"];
         dispatch_async(dispatch_get_main_queue(), ^{
            self.dogHungerLabel.text = @"The dog ran away!";
         });
         self.person.doggo = nil;
      }
      
   }
}

@end

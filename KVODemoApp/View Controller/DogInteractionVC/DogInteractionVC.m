//
//  ForthVC.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 22/05/2021.
//

#import "DogInteractionVC.h"
#import "AppAssembly.h"
//#import "ForthVC+Category.h"

@interface DogInteractionVC ()

@end

@implementation DogInteractionVC


- (void)viewDidLoad {
   [super viewDidLoad];
   [self styleButtons];
   [self configureVC];
   
}

- (void)configureVC {
   [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (instancetype)initWithPerson:(Person *)person assembly:(nonnull AppAssembly *)assembly {
   self = [super init];
   if (self) {
      self.person = person;
      self.appAssembly = assembly;
   }
   return self;
}


- (IBAction)buyDogButtonTapped:(id)sender {
   [self addObserver:self
          forKeyPath:@"person.doggo"
             options:NSKeyValueObservingOptionNew
             context:nil];
   
   [self.appAssembly me].doggo = [self.appAssembly dog];
   self.person.doggo = [[Dog alloc] init];
   if ([self.appAssembly me].doggo) {
      dispatch_async(dispatch_get_main_queue(), ^{
         self.dogInfoLabel.text = @"Your dog is fine :)";
      });
   }
   
   [self addObserver:self
          forKeyPath:@"person.doggo.hungerLevel"
             options:NSKeyValueObservingOptionNew
             context:nil];
   
}


- (IBAction)feedDogButtonTapped:(id)sender {
   self.person.doggo.hungerLevel -= 75;
   [[self.appAssembly me].cookies addObject:[[Cookie alloc] init]];
//   [self.person.cookies addObject:[[Cookie alloc] init]];
}


- (IBAction)howManyCookiesButtonTapped:(id)sender {
   NSLog(@"%lu", [self.appAssembly me].cookies.count);
//   HowManyCookiesVC* vc = [self.appAssembly howManyCookiesVC];
   
//   [self.navigationController presentViewController: [self.appAssembly howManyCookiesVC]
//                                           animated:YES
//                                         completion:nil];
}


- (void)styleButtons {
   self.buyDogButton.layer.cornerRadius   = 10;
   self.feedDogButton.layer.cornerRadius  = 10;
}



-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context {
   
   if ([keyPath isEqualToString: @"person.doggo"]) {
      if (self.person.doggo == nil) {
         self.feedDogButton.enabled    = NO;
         self.buyDogButton.enabled     = YES;
      } else {
         self.feedDogButton.enabled    = YES;
         self.buyDogButton.enabled     = NO;
      }
   }
   
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
         [self.person.doggo.hungerTimer invalidate];
         [self.person.doggo.toiletTimer invalidate];
         [self.person.doggo.cleaningnessTimer invalidate];
         self.person.doggo.hungerTimer       = nil;
         self.person.doggo.toiletTimer       = nil;
         self.person.doggo.cleaningnessTimer = nil;
         self.person.doggo                   = nil;
      }
   }
  
}

@end

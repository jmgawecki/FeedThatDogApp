//
//  ForthVC+Category.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 23/05/2021.
//

#import "DogInteractionVC+Category.h"

@implementation DogInteractionVC (Category)

-(void)dispatchHungerLabelOnMain:(NSString *)labelInfo {
   dispatch_async(dispatch_get_main_queue(), ^{
      self.dogHungerLabel.text = labelInfo;
   });
}

@end

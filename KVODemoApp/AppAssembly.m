//
//  AppAssembly.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 24/05/2021.
//

#import "AppAssembly.h"

@implementation AppAssembly

- (Person *)me {
   return [TyphoonDefinition withClass:[Person class]];
}


- (Dog *)dog {
   return [TyphoonDefinition withClass:[Dog class]];
}


- (DogInteractionVC *)dogVC {
   return [TyphoonDefinition withClass:[DogInteractionVC class]
                         configuration:^(TyphoonDefinition *definition) {
      
      [definition useInitializer:@selector(initWithPerson:)
                      parameters:^(TyphoonMethod *initializer) {
         
         [initializer injectParameterWith:[self me]];
      }];
   }];
}

@end

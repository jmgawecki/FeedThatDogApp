//
//  AppAssembly.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 24/05/2021.
//

#import "AppAssembly.h"
#import "AppAssembly.h"

@implementation AppAssembly

- (Person *)me {
//   self.meAsObject = [TyphoonDefinition withClass:[Person class]];
   return [TyphoonDefinition withClass:[Person class]
                         configuration:^(TyphoonDefinition *definition) {
      definition.scope = TyphoonScopeSingleton;
   }];
}


- (Dog *)dog {
   return [TyphoonDefinition withClass:[Dog class]];
}


- (Cookie *)cookie {
   return [TyphoonDefinition withClass:[Cookie class]];
}
//
//- (NSMutableArray<Cookie *> *)cookies {
//   return [TyphoonDefinition withClass:[NSMutableArray<Cookie*> class]];
//}


//- (DogInteractionVC *)dogVC {
//   return [TyphoonDefinition withClass:[DogInteractionVC class]
//                         configuration:^(TyphoonDefinition *definition) {
//
//      [definition useInitializer:@selector(initWithPerson:assembly:)
//                      parameters:^(TyphoonMethod *initializer) {
//
//         [initializer injectParameterWith:[self me]];
//         [initializer injectParameterWith:self];
//      }];
//   }];
//}

-(DogInteractionVC *)dogVC {
   return [TyphoonDefinition withClass:[DogInteractionVC class]
                         configuration:^(TyphoonDefinition *definition) {
      [definition useInitializer:@selector(init)];
      [definition injectProperty:@selector(appAssembly)];
   }];
}


- (HowManyCookiesVC *)howManyCookiesVC {
   return [TyphoonDefinition withClass:[HowManyCookiesVC class]
                         configuration:^(TyphoonDefinition *definition) {
      
      [definition useInitializer:@selector(initWithAppAssembly:)
                      parameters:^(TyphoonMethod *initializer) {
         [initializer injectParameterWith:self];
      }];
   }];
}

@end

//
//  Person.h
//  KVODemoApp
//
//  Created by Jakub Gawecki on 21/05/2021.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
// You can use @class to inform the current class, that Cookie exists, but you done need access to its properties etc.
@class Cookie;

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nullable, copy) NSString    *name;
@property (nullable, copy) NSNumber    *age;
@property int height;

@property (nullable, nonatomic) Cookie *cookie;
@property (nullable, nonatomic) Dog    *doggo;

@end

NS_ASSUME_NONNULL_END

//
//  HowManyCookiesVC.m
//  KVODemoApp
//
//  Created by Jakub Gawecki on 25/05/2021.
//

#import "HowManyCookiesVC.h"
#import "AppAssembly.h"

@interface HowManyCookiesVC ()

@end

@implementation HowManyCookiesVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
   
}

- (instancetype)initWithAppAssembly:(id)appAssembly {
   self = [super init];
   if (self) {
      self.appAssembly = appAssembly;
   }
   return self;
}


-(void)updateLabel {
   self.howManyCookiesLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[self.appAssembly me].cookies.count];
}


@end

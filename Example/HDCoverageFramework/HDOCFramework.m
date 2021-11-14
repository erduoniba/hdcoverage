//
//  HDOCFramework.m
//  HDCoverFramework
//
//  Created by denglibing on 2021/10/15.
//

#import "HDOCFramework.h"

@implementation HDOCFramework

+ (void)frameworkOCAction:(NSInteger)tag {
    if (tag == 1) {
        NSLog(@"frameworkOCAction: %d", 1);
    }
    else if (tag == 2) {
        NSLog(@"frameworkOCAction: %d", 2);
    }
    else if (tag == 3) {
        NSLog(@"frameworkOCAction: %d", 3);
    }
    NSDictionary * envir = [[NSProcessInfo processInfo] environment];
    NSLog(@"envir : %@", envir);
    
    NSLog(@"Target name: %@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]);
}

@end

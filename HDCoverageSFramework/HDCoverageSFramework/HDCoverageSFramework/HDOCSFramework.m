//
//  HDOCSFramework.m
//  HDCoverageSFramework
//
//  Created by denglibing on 2022/2/24.
//

#import "HDOCSFramework.h"

@implementation HDOCSFramework

+ (void)frameworkOCStaticFrameworkAction:(NSInteger)tag {
    if (tag == 1) {
        NSLog(@"frameworkOCStaticFrameworkAction: %d", 1);
    }
    else if (tag == 2) {
        NSLog(@"frameworkOCStaticFrameworkAction: %d", 2);
    }
    else if (tag == 3) {
        NSLog(@"frameworkOCStaticFrameworkAction: %d", 3);
    }
}

@end

//
//  HDOC.m
//  HDCoverageDemo
//
//  Created by denglibing on 2021/10/15.
//

#import "HDOC.h"

@implementation HDOC

+ (void)projectOCAction:(NSInteger)tag {
    if (tag == 1) {
        NSLog(@"projectOCAction: %d", 1);
    }
    else if (tag == 2) {
        NSLog(@"projectOCAction: %d", 2);
    }
    else if (tag == 3) {
        NSLog(@"projectOCAction: %d", 3);
    }
}

@end

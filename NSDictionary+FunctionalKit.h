//
//  NSDictionary+FunctionalKit.h
//  FunctionalKit
//
//  Created by Peter Backman on 6/1/13.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FunctionalKit)
- (NSArray *)transformToArrayUsingBlock:(id (^)(id key, id value)) transformer;
@end

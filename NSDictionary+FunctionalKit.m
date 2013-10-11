//
//  NSDictionary+FunctionalKit.m
//  FunctionalKit
//
//  Created by Peter Backman on 6/1/13.
//
//

#import "NSDictionary+FunctionalKit.h"

@implementation NSDictionary (FunctionalKit)
- (NSArray *)transformToArrayUsingBlock:(id (^)(id key, id value)) transformer {
   NSMutableArray *const returnValues = [[NSMutableArray alloc] initWithCapacity:[self count]];
   
   for (NSString *const key in [self allKeys]) {
      [returnValues addObject:transformer(key, [self valueForKey:key])];
   }
   
   return returnValues;
}
@end

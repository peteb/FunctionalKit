//
//  NSArray+FunctionalKit.h
//  FunctionalKit
//
//  Created by Peter Backman on 6/1/13.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (FunctionalKit)
// Collects values into categories (returned by the block) as keys in a dictionary.
- (NSDictionary *)collectUsingBlock:(id (^)(id value)) valueIdentifier;
- (NSArray *)transformUsingBlock:(id (^)(id value)) transformer;

@end


// OK; not very functional, but still useful
@interface NSMutableArray (FunctionalKit)
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
@end


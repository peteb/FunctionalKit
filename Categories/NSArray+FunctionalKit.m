//
//  NSArray+FunctionalKit.m
//  FunctionalKit
//
//  Created by Peter Backman on 6/1/13.
//
//

#import "NSArray+FunctionalKit.h"

@implementation NSArray (FunctionalKit)
- (NSDictionary *)collectUsingBlock:(id (^)(id value)) valueIdentifier {
   NSMutableDictionary *dict = [NSMutableDictionary new];
   
   for (id object in self) {
      id ident = valueIdentifier(object);
      NSMutableArray *array = [dict objectForKey:ident];
      
      if (!array) {
         array = [NSMutableArray new];
         [dict setValue:array forKey:ident];
      }
      
      [array addObject:object];
   }
   
   return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSArray *)transformUsingBlock:(id (^)(id value)) transformer {
   NSMutableArray *const returnValues = [[NSMutableArray alloc] initWithCapacity:self.count];
   
   for (id const value in self) {
      [returnValues addObject:transformer(value)];
   }
   
   return [NSArray arrayWithArray:returnValues];
}
@end

@implementation NSMutableArray (FunctionalKit)
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
   id object = self[fromIndex];
   [self insertObject:object atIndex:toIndex];
   [self removeObjectAtIndex:fromIndex + (fromIndex > toIndex ? 1 : 0)];
}
@end

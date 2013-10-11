//
//  FunctionalKitTests.m
//  FunctionalKitTests
//
//  Created by Peter Backman on 10/11/13.
//
//

#import <XCTest/XCTest.h>
#import <XCTest/XCTestAssertions.h>

#import "NSArray+FunctionalKit.h"
#import "NSDictionary+FunctionalKit.h"

@interface FunctionalKitTests : XCTestCase

@end

@implementation FunctionalKitTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testThatArraysCanBeCollected {
   NSArray *names = @[@"Robert", @"Hannah", @"Peter", @"Hannah", @"Peter", @"Hannah"];
   NSDictionary *collectedNames = [names collectUsingBlock:^id(NSString *value) {
      return value;
   }];
   
   XCTAssertEqual(collectedNames.count, (NSUInteger)3, "Should be 4 unique elements");
   XCTAssertEqual(((NSArray *)collectedNames[@"Robert"]).count, (NSUInteger)1, @"Robert should exist 1 time");
   XCTAssertEqual(((NSArray *)collectedNames[@"Hannah"]).count, (NSUInteger)3, @"Hannah should exist 3 times");
   XCTAssertEqual(((NSArray *)collectedNames[@"Peter"]).count, (NSUInteger)2, @"Peter should exist 2 times");
}


@end

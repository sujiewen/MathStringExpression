//
//  MSString.m
//  MathStringExpression
//
//  Created by Sjw on 2019/1/5.
//  Copyright © 2019年 NOVO. All rights reserved.
//

#import "MSString.h"

@implementation MSString

- (instancetype)init
{
    self = [super init];
    if (self) {
        _elementType = EnumElementTypeValue;
    }
    return self;
}

- (instancetype)initWithStringValue:(NSString*)stringValue
{
    self = [self init];
    if (self) {
        self.stringValue = stringValue;
    }
    return self;
}

+ (instancetype)stringwithStringValue:(NSString *)stringValue
{
    return [[MSString alloc] initWithStringValue:stringValue];
}

- (NSString *)description
{
    return self.stringValue.description;
}

- (NSString *)debugDescription
{
    return self.stringValue.description;
}


- (NSComparisonResult)compare:(NSString *)otherString {
     return [self.stringValue isEqualToString:otherString];
}

- (BOOL)isEqualToString:(NSString *)aString {
     return [self.stringValue isEqualToString:aString];
}

- (NSArray *)innerItems
{
    return @[self];
}

- (NSUInteger)countOfParameterizedValue
{
    return 1;
}

- (NSArray<MSString *> *)toParameterizedValues
{
    return @[self];
}

@end

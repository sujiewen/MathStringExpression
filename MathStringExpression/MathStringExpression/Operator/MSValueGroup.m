//
//  MSValueGroup.m
//  MathStringExpression
//
//  Created by Sjw on 2019/1/5.
//  Copyright © 2019年 NOVO. All rights reserved.
//

#import "MSValueGroup.h"

@interface MSValueGroup ()
@property (nonatomic,strong) NSMutableArray<MSValue*>* values;
@end

@implementation MSValueGroup

#pragma mark - 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        _elementType = EnumElementTypeValue;
    }
    return self;
}

+ (instancetype)group
{
    return [self.class new];
}

+ (instancetype)groupWithElement:(id<MSParameterizedElement>)element
{
    return [[self.class new] addElement:element];
}

+ (instancetype)groupWithArray:(NSArray<id<MSParameterizedElement>> *)array
{
    return [[self.class new] addElements:array];
}

- (NSMutableArray<MSValue *> *)values
{
    if(!_values){
        _values = [NSMutableArray new];
    }
    return _values;
}

- (NSUInteger)count
{
    return [self countOfParameterizedValue];
}
#pragma mark - 实现协议MSParameterizedElement

- (NSUInteger)countOfParameterizedValue
{
    return self.values.count;
}

- (NSArray<NSValue *> *)toParameterizedValues
{
    return self.values.copy;
}
#pragma mark - 用户

- (instancetype)addElement:(id<MSParameterizedElement>)element
{
    if([[element class] conformsToProtocol:@protocol(MSParameterizedElement) ]){
        if([element isKindOfClass:[MSValue class]]){
            [self.values addObjectsFromArray:element.innerItems];
        }
    }
    return self;
}

- (instancetype)addElements:(NSArray<id<MSParameterizedElement>> *)elements
{
    [elements enumerateObjectsUsingBlock:^(id<MSParameterizedElement>  _Nonnull elt, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addElement:elt];
    }];
    return self;
}

+ (instancetype)groupCombineWithElementA:(id<MSParameterizedElement>)elementA elementB:(id<MSParameterizedElement>)elementB
{
    return [[[MSValueGroup group] addElement:elementA] addElement:elementB];
}

- (NSString *)stringValue
{
    NSMutableString* str = [NSMutableString new];
    NSUInteger count = [self countOfParameterizedValue];
    [self.values enumerateObjectsUsingBlock:^(MSValue * _Nonnull value, NSUInteger idx, BOOL * _Nonnull stop) {
        [str appendString:value.stringValue];
        if(idx < count-1){
            [str appendString:@","];
        }
    }];
    return str;
}

- (id)copyWithZone:(NSZone *)zone
{
    MSValueGroup* copy = [super copyWithZone:zone];
    if(copy){
        copy->_values = [self.values mutableCopy];
    }
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.values forKey:@"values"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        self->_values = [aDecoder decodeObjectForKey:@"values"];
    }
    return self;
}

- (NSArray *)innerItems
{
    return self.values.copy;
}

- (NSString *)valueToString
{
    NSMutableString* strV = [NSMutableString new];
    NSUInteger count = self.values.count;
    if(count){
        [strV appendString:@"("];
        [self.values enumerateObjectsUsingBlock:^(MSValue * _Nonnull value, NSUInteger idx, BOOL * _Nonnull stop) {
            [strV appendString:value.valueToString];
            if(idx < count-1){
                [strV appendString:@","];
            }
        }];
        [strV appendString:@")"];
    }
    return strV.copy;
}

@end


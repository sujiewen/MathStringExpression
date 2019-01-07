//
//  MSString.h
//  MathStringExpression
//
//  Created by Sjw on 2019/1/5.
//  Copyright © 2019年 NOVO. All rights reserved.
//

#import "MSValue.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  字符串类型
 */
@interface MSString : MSValue
<
MSParameterizedElement
>

+ (instancetype)stringwithStringValue:(NSString*)stringValue;

- (NSComparisonResult)compare:(NSString *)otherString;

- (BOOL)isEqualToString:(NSString *)aString;

- (NSString *)description;
- (NSString *)debugDescription;
- (NSArray *)innerItems;
- (NSUInteger)countOfParameterizedValue;
- (NSArray<MSString *> *)toParameterizedValues;

@end

NS_ASSUME_NONNULL_END

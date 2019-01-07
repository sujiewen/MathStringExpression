//
//  MSValueGroup.h
//  MathStringExpression
//
//  Created by Sjw on 2019/1/5.
//  Copyright © 2019年 NOVO. All rights reserved.
//

#import "MSValue.h"

NS_ASSUME_NONNULL_BEGIN

/**
 参数组，由逗号运算符产生的运算结果
 组内顺序为自然阅读顺序
 支持,数字和字符 ,字符不参与数字计算
 */
@interface MSValueGroup : MSValue
<
MSParameterizedElement
>

@property (nonatomic,assign,readonly) NSUInteger count;

+ (instancetype)group;
+ (instancetype)groupWithElement:(id<MSParameterizedElement>)element;
+ (instancetype)groupWithArray:(NSArray<id<MSParameterizedElement>>*)array;

/**
 顺序合并两个可计算元素
 @return 返回新对象
 */
+ (instancetype)groupCombineWithElementA:(id<MSParameterizedElement>)elementA
                                elementB:(id<MSParameterizedElement>)elementB;

/**
 添加一个可计算元素
 */
- (instancetype)addElement:(id<MSParameterizedElement>)element;

/**
 添加一组可计算元素
 */
- (instancetype)addElements:(NSArray<id<MSParameterizedElement>>*)elements;

#pragma mark - 协议MSParameterizedElement
- (NSUInteger)countOfParameterizedValue;
- (NSArray<MSValue*> *)toParameterizedValues;
- (NSArray *)innerItems;

- (NSString *)valueToString;

@end

NS_ASSUME_NONNULL_END

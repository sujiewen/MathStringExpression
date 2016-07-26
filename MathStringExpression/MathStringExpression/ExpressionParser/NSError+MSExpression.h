//
//  NSError+MSExpression.h
//  MathStringProgram
//
//  Created by NOVO on 16/7/22.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MSElement;

typedef enum EnumMSErrorReasonType{
    EnumMSErrorLackArgs = 19890604,
    EnumMSErrorUnkownElement = 19080630,
    EnumMSErrorUnclearMeaning = 9761114,
    EnumMSErrorUnexpectedElement = 19450806,
    EnumMSErrorComputeFaile = 19491025,
    EnumMSErrorNotFind = 13771205,
    EnumMSErrorNotSupport = 17930121,
}EnumMSErrorReasonType;

@interface NSError(MSExpression)
+ (NSError*)errorWithReason:(EnumMSErrorReasonType)reason;
+ (NSError*)errorWithReason:(EnumMSErrorReasonType)reason
                description:(NSString*)description;
+ (NSError*)errorWithReason:(EnumMSErrorReasonType)reason
                description:(NSString*)description
                elementInfo:(MSElement*)elementInfo;
@end

//
//  UMSocial-Bridging-Header.h
//  TestSwiftUI
//
//  Created by user on 2017/5/2.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>

#ifndef UMSocial_Bridging_Header_h
#define UMSocial_Bridging_Header_h

//分享文本
//- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //设置文本
//    messageObject.text = UMS_Text;
//    
//#ifdef UM_Swift
//    [UMSocialSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:self completion:^(UMSocialShareResponse * data, NSError * error) {
//#else
//        //调用分享接口
//        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//#endif
//            if (error) {
//                UMSocialLogInfo(@"************Share fail with error %@*********",error);
//            }else{
//                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
//                    UMSocialShareResponse *resp = data;
//                    //分享结果消息
//                    UMSocialLogInfo(@"response message is %@",resp.message);
//                    //第三方原始返回的数据
//                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
//                    
//                }else{
//                    UMSocialLogInfo(@"response data is %@",data);
//                }
//            }
//            [self alertWithError:error];
//        }];
//    }


#endif /* UMSocial_Bridging_Header_h */

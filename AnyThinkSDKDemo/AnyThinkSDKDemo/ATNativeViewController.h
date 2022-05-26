//
//  ATNativeViewController.h
//  AnyThinkSDKDemo
//
//  Created by Martin Lau on 17/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AnyThinkSDK/AnyThinkSDK.h>
#import <AnyThinkNative/AnyThinkNative.h>

extern NSString *const kMPPlacement;
extern NSString *const kInmobiPlacement;
extern NSString *const kFacebookPlacement;
extern NSString *const kFacebookHeaderBiddingPlacement;
extern NSString *const kAdMobPlacement;
extern NSString *const kApplovinPlacement;
extern NSString *const kMopubPlacementName;
extern NSString *const kMintegralPlacement;
extern NSString *const kMintegralAdvancedPlacement;
extern NSString *const kHeaderBiddingPlacement;
extern NSString *const kGDTPlacement;
extern NSString *const kGDTTemplatePlacement;
extern NSString *const kAppnextPlacement;
extern NSString *const kTTFeedPlacementName;
//extern NSString *const kTTDrawPlacementName;
extern NSString *const kAllPlacementName;
extern NSString *const kBaiduPlacement;
extern NSString *const kNendPlacement;
extern NSString *const kNendVideoPlacement;
extern NSString *const kMaioPlacement;
extern NSString *const kSigmobPlacement;
extern NSString *const kKSPlacement;
extern NSString *const kGAMPlacement;
extern NSString *const kMyOfferPlacement;
extern NSString *const kKlevinPlacement;
extern NSString *const kDirectOfferPlacement;

//extern NSString *const kKSDrawPlacement;
@interface ATNativeViewController : UIViewController
-(instancetype) initWithPlacementName:(NSString*)name;
+(NSDictionary<NSString*, NSString*>*)nativePlacementIDs;
@end


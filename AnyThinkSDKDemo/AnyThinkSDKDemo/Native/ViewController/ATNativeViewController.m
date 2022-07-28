//
//  ATNativeViewController.m
//  AnyThinkSDKDemo
//
//  Created by Martin Lau on 17/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "ATNativeViewController.h"
#import "MTAutolayoutCategories.h"
#import "ATADFootView.h"
#import "ATModelButton.h"
#import "ATNativeMessageStreamViewController.h"
#import "ATDrawViewController.h"
#import "ATNativeShowViewController.h"
#import "ATDrawViewController.h"

#import "ATMenuView.h"
#import "ATNativeSelfRenderView.h"



NSString *const kMPPlacement = @"MobPower";
NSString *const kInmobiPlacement = @"Inmobi";
NSString *const kFacebookPlacement = @"Facebook";
NSString *const kFacebookHeaderBiddingPlacement = @"Facebook(Header Bidding)";
NSString *const kAdMobPlacement = @"AdMob";
NSString *const kApplovinPlacement = @"Applovin";
NSString *const kMintegralPlacement = @"Mintegral";
NSString *const kMintegralAdvancedPlacement = @"Mintegral(Advanced)";
NSString *const kGDTPlacement = @"GDT";
NSString *const kGDTTemplatePlacement = @"GDT(Template)";
NSString *const kAppnextPlacement = @"Appnext";
NSString *const kTTFeedPlacementName = @"TT(Feed)";
NSString *const kTTDrawPlacementName = @"TT(Draw)";
NSString *const kAllPlacementName = @"All";
NSString *const kNendVideoPlacement = @"Nend(Video)";
NSString *const kSigmobPlacement = @"Sigmob";
NSString *const kKSDrawPlacement = @"KS(Draw)";
NSString *const kGAMPlacement = @"GAM";
NSString *const kOnlineApiPlacement = @"OnlineApi";



static NSString *const kMPPlacementID = @"b5c2084d12aca4";
static NSString *const kPlacement0ID = @"b5ad9ba61dcb39";
static NSString *const kInmobiPlacementID = @"b5b0f553483724";
static NSString *const kMintegralAdvancedPlacementID = @"b5ee1d26cb56ee";
static NSString *const kMintegralPlacementID = @"b5b0f555698607";
static NSString *const kMintegralHeaderBiddingPlacementID = @"b5d1333d023691";
static NSString *const kFacebookPlacementID = @"b5b0f551340ea9";
static NSString *const kFacebookHeaderBiddingPlacementID = @"b5d13342d52304";
static NSString *const kAdMobPlacementID = @"b5b0f55228375a";
static NSString *const kApplovinPlacementID = @"b5b0f554ec9c4e";
static NSString *const kGDTPlacementID = @"b5bacac5f73476";
static NSString *const kGDTTemplatePlacementID = @"b5bacac780e03b";
static NSString *const kAppnextPlacementID = @"b5bc7fb2787f1e";
static NSString *const kAllPlacementID = @"b5b0f5663c6e4a";
static NSString *const kTTFeedPlacementID = @"b5c2c6d50e7f44";
static NSString *const kNendPlacementID = @"b5cb96d44c0c5f";
static NSString *const kNendVideoPlacementID = @"b5cb96d5291e93";
static NSString *const kBaiduPlacementID = @"b5d36c4ad68a26";
static NSString *const kKSPlacementID = @"b5e4613e50cbf2";//@"b5e43ac9ca3fc5";
static NSString *const kGAMPlacementID = @"b5f238964f3e6f";
static NSString *const kMyOfferPlacementID = @"b5f33878ee0646";
static NSString *const kSigmobPlacementID = @"b6170cda99de6d";
static NSString *const kKlevinPlacementID = @"b6172985f45143";
static NSString *const kDirectOfferPlacementID = @"b61bfff2c812cb";


//static NSString *const kKSDrawPlcementID = @"b5e4613e50cbf2";
//static NSString *const kTTDrawPlacementID = @"b5c2c6d62b9d65";



@interface ATNativeViewController()<ATNativeADDelegate>

@property (nonatomic, strong) ATADFootView *footView;

@property (nonatomic, strong) ATModelButton *nativeBtn;

@property (nonatomic, strong) ATModelButton *drawBtn;

@property (nonatomic, strong) ATModelButton *preRollBtn;

@property (nonatomic, strong) ATMenuView *menuView;

@property (nonatomic, strong) UITextView *textView;

@property(nonatomic) ATNativeADView *adView;


@property (copy, nonatomic) NSString *placementID;

@property (copy, nonatomic) NSDictionary<NSString *, NSString *> *placementIDs_native;
@property (copy, nonatomic) NSDictionary<NSString *, NSString *> *placementIDs_draw;
@property (copy, nonatomic) NSDictionary<NSString *, NSString *> *placementIDs_preRoll;
@property (copy, nonatomic) NSDictionary<NSString *, NSString *> *placementIDs;

@property (nonatomic, copy) NSString *nativeStr;

@property (nonatomic, strong) UIView *showView;

@property(nonatomic, strong) ATNativeSelfRenderView *nativeSelfRenderView;

@end

@implementation ATNativeViewController

-(instancetype) initWithPlacementName:(NSString*)name {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
    }
    return self;
}

+(NSDictionary<NSString*, NSString*>*)nativePlacementIDs {
    return @{
             kMPPlacement:kMPPlacementID,
             kMintegralPlacement:kMintegralPlacementID,
             kMintegralAdvancedPlacement:kMintegralAdvancedPlacementID,
             kHeaderBiddingPlacement:kMintegralHeaderBiddingPlacementID,
             kAllPlacementName:kAllPlacementID,
             kInmobiPlacement:kInmobiPlacementID,
             kFacebookPlacement:kFacebookPlacementID,
             kFacebookHeaderBiddingPlacement:kFacebookHeaderBiddingPlacementID,
             kAdMobPlacement:kAdMobPlacementID,
             kApplovinPlacement:kApplovinPlacementID,
             kGDTPlacement:kGDTPlacementID,
             kGDTTemplatePlacement:kGDTTemplatePlacementID,
             kAppnextPlacement:kAppnextPlacementID,
             kTTFeedPlacementName:kTTFeedPlacementID,
             kNendPlacement:kNendPlacementID,
             kNendVideoPlacement:kNendVideoPlacementID,
             kBaiduPlacement:kBaiduPlacementID,
             kKSPlacement:kKSPlacementID,
             kGAMPlacement:kGAMPlacementID,
             kMyOfferPlacement:kMyOfferPlacementID,
             kSigmobPlacement:kSigmobPlacementID,
             kKlevinPlacement:kKlevinPlacementID,
             kDirectOfferPlacement:kDirectOfferPlacementID
             };
}
- (NSDictionary<NSString *,NSString *> *)placementIDs_native{
    
    return @{
        @"MyOffer":                 @"b5f33878ee0646",
        @"GAM":                     @"b5f238964f3e6f",
        @"Mintegral-(Advanced)":    @"b5ee1d26cb56ee",
        @"Header Bidding":          @"b5d1333d023691",
        @"Nend":                    @"b5cb96d44c0c5f",
        @"Nend-(Video)":            @"b5cb96d5291e93",
        @"TT-(Feed)":               @"b5c2c6d50e7f44",
        @"Pangle":                  @"b612f6a831fe71",
        @"MobPower":                @"b5c2084d12aca4",
        @"Facebook":                @"b5b0f551340ea9",
        @"Facebook(NativeBanner)":  @"b5ee89fd60cddc",
        @"AdMob":                   @"b5b0f55228375a",
        @"Inmobi":                  @"b5b0f553483724",
        @"Mintegral":               @"b5b0f555698607",
        @"GDT-(self randerer)":     @"b5bacac5f73476",
        @"GDT-(Template)":          @"b5bacac780e03b",
        @"Appnext":                 @"b5bc7fb2787f1e",
        @"Baidu":                   @"b5d36c4ad68a26",
        @"KS":                      @"b5e4613e50cbf2",
        @"OnlineApi":               @"b5fa2508579446",
        @"All":                     @"b5b0f5663c6e4a",
        @"Sigmob":                  @"b6170cda99de6d",
        @"DirectOffer":             @"b61bfff2c812cb",
        @"Klevin":                  @"b6172985f45143",
        @"StartApp":                @"b6217531b46e9d",
        @"MyTarget":                @"b623adf05c5db8",
        @"MyTarget(Template)":      @"b623ae6973ac16"
    };
}

- (NSDictionary<NSString *,NSString *> *)placementIDs_draw{
    
    return @{
        @"TT(Draw)":                @"b5c2c6d62b9d65",
        @"KS(Draw)":                @"b5e5ce042cabfb",
    };
}
- (NSDictionary<NSString *,NSString *> *)placementIDs_preRoll{
    return @{
        @"TT(Feed)":                @"b5c2c6d50e7f44"
    };
}

+(NSString*)numberOfLoadPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"native_load"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kRGB(245, 245, 245);
    _placementIDs = [ATNativeViewController nativePlacementIDs];
    [self setupUI];
    
    self.title = @"Native";
}

- (void)setupUI
{
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    [clearBtn setTitle:@"clear log" forState:UIControlStateNormal];
    [clearBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearLog) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:clearBtn];
    self.navigationItem.rightBarButtonItem = btnItem;
    
    [self.view addSubview:self.nativeBtn];
    [self.view addSubview:self.drawBtn];
    [self.view addSubview:self.preRollBtn];
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.footView];
   
    
    [self.nativeBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo((kScreenW - kScaleW(26) * 4) / 3);
        make.height.mas_equalTo(kScaleW(360));
        make.top.equalTo(self.view.mas_top).offset(kNavigationBarHeight + kScaleW(20));
        make.left.equalTo(self.view.mas_left).offset(kScaleW(26));
    }];

    [self.drawBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nativeBtn.mas_right).offset(kScaleW(26));
        make.width.mas_equalTo((kScreenW - kScaleW(26) * 4) / 3);
        make.height.mas_equalTo(self.nativeBtn.mas_height);
        make.top.equalTo(self.view.mas_top).offset(kNavigationBarHeight + kScaleW(20));
    }];

    [self.preRollBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(kScaleW(-26));
        make.width.mas_equalTo((kScreenW - kScaleW(26) * 4) / 3);
        make.height.mas_equalTo(self.nativeBtn.mas_height);
        make.top.equalTo(self.view.mas_top).offset(kNavigationBarHeight + kScaleW(20));
    }];

    [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenW - kScaleW(52));
        make.height.mas_equalTo(kScaleW(242));
        make.top.equalTo(self.nativeBtn.mas_bottom).offset(kScaleW(20));
        make.centerX.equalTo(self.view.mas_centerX);
    }];

    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.menuView.mas_bottom).offset(kScaleW(20));
        make.bottom.equalTo(self.footView.mas_top).offset(kScaleW(-20));
        make.width.mas_equalTo(kScreenW - kScaleW(52));
        make.centerX.equalTo(self.view.mas_centerX);
    }];

    [self.footView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(kScaleW(340));
    }];
    
   
    
    [self changeModel:self.nativeBtn];
    
}

- (void)clearLog
{
    self.textView.text = @"";
}

#pragma mark - Action
- (void)changeModel:(UIButton *)sender
{
    if ((self.nativeBtn.isSelected && sender == self.nativeBtn) || (self.drawBtn.isSelected && sender == self.drawBtn) || (self.preRollBtn.isSelected && sender == self.preRollBtn)) {
        return;
    }
    if (sender.tag == 0) {
        self.nativeBtn.selected = YES;
        self.drawBtn.selected = NO;
        self.preRollBtn.selected = NO;
        self.placementIDs = self.placementIDs_native;
        [self.menuView showSubMenu];
        
       
    } else if (sender.tag == 1) {
        self.nativeBtn.selected = NO;
        self.drawBtn.selected = YES;
        self.preRollBtn.selected = NO;
        self.placementIDs = self.placementIDs_draw;
        [self.menuView hiddenSubMenu];
   
    } else {
        self.nativeBtn.selected = NO;
        self.drawBtn.selected = NO;
        self.preRollBtn.selected = YES;
        self.placementIDs = self.placementIDs_preRoll;
        [self.menuView hiddenSubMenu];
        
      
    }
    [self.nativeBtn setButtonIsSelectBoard];
    [self.drawBtn setButtonIsSelectBoard];
    [self.preRollBtn setButtonIsSelectBoard];
    
    [self resetPlacementID];
}

- (void)resetPlacementID {
    [self.menuView resetMenuList:self.placementIDs.allKeys];
    self.placementID = self.placementIDs.allValues.firstObject;
}

//广告加载
- (void)loadAd
{
    CGSize size = CGSizeMake(kScreenW, 350);
    if ([self.placementIDs_draw.allValues containsObject:self.placementID]) {
        size = self.view.frame.size;
    }
    
    
    NSDictionary *extra = @{
        kATExtraInfoNativeAdSizeKey:[NSValue valueWithCGSize:size],
        kATExtraNativeImageSizeKey:kATExtraNativeImageSize690_388,
        kATNativeAdSizeToFitKey:@YES,
        // Start APP
        kATExtraNativeIconImageSizeKey: @(AT_SIZE_72X72),
        kATExtraStartAPPNativeMainImageSizeKey:@(AT_SIZE_1200X628),
    };
    [[ATAdManager sharedManager] loadADWithPlacementID:self.placementID extra:extra delegate:self];
}

//检查广告缓存
- (void)checkAd
{
    // list
    NSArray *array = [[ATAdManager sharedManager] getNativeValidAdsForPlacementID:self.placementID];
    NSLog(@"ValidAds.count:%ld--- ValidAds:%@",array.count,array);

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[[ATAdManager sharedManager] nativeAdReadyForPlacementID:self.placementID] ? @"Ready!" : @"Not Yet!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

//广告展示
- (void)showAd
{
    // 判断广告isReady状态
    BOOL ready = [[ATAdManager sharedManager] nativeAdReadyForPlacementID:self.placementID];
    if (ready == NO) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Not Yet!" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
        }];
        return;
    }
    
    if (self.nativeBtn.isSelected && [self.nativeStr isEqualToString:@"Native List"]) {
        // 列表
        ATNativeMessageStreamViewController *messageVc = [[ATNativeMessageStreamViewController alloc] initWithAdView:self.adView];
        [self.navigationController pushViewController:messageVc animated:YES];
    } else if (self.drawBtn.isSelected) {
        [self showDrawAd];
    } else {
        // 初始化config配置
        ATNativeADConfiguration *config = [self getNativeADConfiguration];
        // 获取offer广告对象
        ATNativeAdOffer *offer = [[ATAdManager sharedManager] getNativeAdOfferWithPlacementID:self.placementID];
        // 创建开发者自渲染视图view，同时根据offer信息内容去赋值
        ATNativeSelfRenderView *selfRenderView = [self getSelfRenderViewOffer:offer];
        // 创建nativeADView
        ATNativeADView *nativeADView = [self getNativeADView:config offer:offer selfRenderView:selfRenderView];
        
        [self prepareWithNativePrepareInfo:selfRenderView nativeADView:nativeADView];
        
        [offer rendererWithConfiguration:config selfRenderView:selfRenderView nativeADView:nativeADView];
                
        
        ATNativeAdRenderType nativeAdRenderType = [nativeADView getCurrentNativeAdRenderType];
        
        if (nativeAdRenderType == ATNativeAdRenderExpress) {
            NSLog(@"🔥--原生模板");
            NSLog(@"🔥--原生模板广告宽高：%lf，%lf",offer.nativeAd.nativeExpressAdViewWidth,offer.nativeAd.nativeExpressAdViewHeight);
        }else{
            NSLog(@"🔥--原生自渲染");
        }
        
        BOOL isVideoContents = [nativeADView isVideoContents];
        NSLog(@"🔥--是否为原生视频广告：%d",isVideoContents);
        
        if ([offer.adOfferInfo[@"network_firm_id"] integerValue] == 67) {
            config.mediaViewFrame = CGRectMake(0, kNavigationBarHeight, kScreenW, 350);
        }
        
        ATNativeShowViewController *showVc = [[ATNativeShowViewController alloc] initWithAdView:nativeADView placementID:self.placementID offer:offer];
        
        [self.navigationController pushViewController:showVc animated:YES];
    }
}


- (void)removeAd
{
    if (self.adView && self.adView.superview) {
        [self.adView removeFromSuperview];
    }
}

- (void)showLog:(NSString *)logStr
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *logS = self.textView.text;
        NSString *log = nil;
        if (![logS isEqualToString:@""]) {
            log = [NSString stringWithFormat:@"%@\n%@", logS, logStr];
        } else {
            log = [NSString stringWithFormat:@"%@", logStr];
        }
        self.textView.text = log;
        [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length, 1)];
    });
}

#pragma mark - Show
- (ATNativeADConfiguration *)getNativeADConfiguration{
    ATNativeADConfiguration *config = [[ATNativeADConfiguration alloc] init];
    config.ADFrame = CGRectMake(0, kNavigationBarHeight, kScreenW, 350);
    config.mediaViewFrame = CGRectMake(0, kNavigationBarHeight + 150.0f, kScreenW, 350 - kNavigationBarHeight - 150);
    config.delegate = self;
    config.sizeToFit = YES;
    config.rootViewController = self;
    config.context = @{
        kATNativeAdConfigurationContextAdOptionsViewFrameKey:[NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(self.view.bounds) - 43.0f, .0f, 43.0f, 18.0f)],
        kATNativeAdConfigurationContextAdLogoViewFrameKey:[NSValue valueWithCGRect:CGRectMake(.0f, .0f, 54.0f, 18.0f)],
        kATNativeAdConfigurationContextNetworkLogoViewFrameKey:[NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(config.ADFrame) - 54.0f, CGRectGetHeight(config.ADFrame) - 18.0f, 54.0f, 18.0f)]
    };
    return config;
}

- (ATNativeSelfRenderView *)getSelfRenderViewOffer:(ATNativeAdOffer *)offer{
    
    ATNativeSelfRenderView *selfRenderView = [[ATNativeSelfRenderView alloc]initWithOffer:offer];
            
    self.nativeSelfRenderView = selfRenderView;
    
    selfRenderView.backgroundColor = randomColor;
    
    return selfRenderView;
}

- (ATNativeADView *)getNativeADView:(ATNativeADConfiguration *)config offer:(ATNativeAdOffer *)offer selfRenderView:(ATNativeSelfRenderView *)selfRenderView{
    
    ATNativeADView *nativeADView = [[ATNativeADView alloc]initWithConfiguration:config currentOffer:offer placementID:self.placementID];
    
    // 获取mediaView
    UIView *mediaView = [nativeADView getMediaView];

    NSMutableArray *array = [@[selfRenderView.iconImageView,selfRenderView.titleLabel,selfRenderView.textLabel,selfRenderView.ctaLabel,selfRenderView.mainImageView] mutableCopy];
    
    if (mediaView) {
        [array addObject:mediaView];
    }
    
    // 给UI控件注册点击事件
    [nativeADView registerClickableViewArray:array];
    
    nativeADView.backgroundColor = randomColor;

    
    selfRenderView.mediaView = mediaView;
    
    [selfRenderView addSubview:mediaView];
    
    [mediaView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(selfRenderView);
            make.top.equalTo(selfRenderView.mainImageView.mas_top);
    }];

    self.adView = nativeADView;
    
    return nativeADView;
}

- (void)prepareWithNativePrepareInfo:(ATNativeSelfRenderView *)selfRenderView nativeADView:(ATNativeADView *)nativeADView{
    
    ATNativePrepareInfo *info = [ATNativePrepareInfo loadPrepareInfo:^(ATNativePrepareInfo * _Nonnull prepareInfo) {
        prepareInfo.textLabel = selfRenderView.textLabel;
        prepareInfo.advertiserLabel = selfRenderView.advertiserLabel;
        prepareInfo.titleLabel = selfRenderView.titleLabel;
        prepareInfo.ratingLabel = selfRenderView.ratingLabel;
        prepareInfo.iconImageView = selfRenderView.iconImageView;
        prepareInfo.mainImageView = selfRenderView.mainImageView;
        prepareInfo.logoImageView = selfRenderView.logoImageView;
        prepareInfo.sponsorImageView = selfRenderView.sponsorImageView;
        prepareInfo.dislikeButton = selfRenderView.dislikeButton;
        prepareInfo.ctaLabel = selfRenderView.ctaLabel;
        prepareInfo.mediaView = selfRenderView.mediaView;
    }];
    
    [nativeADView prepareWithNativePrepareInfo:info];
}


#pragma mark - draw
- (void)showDrawAd{
    // Draw
    ATNativeADConfiguration *config = [[ATNativeADConfiguration alloc] init];
    config.ADFrame = CGRectMake(0, kNavigationBarHeight, kScreenW, kScreenH - kNavigationBarHeight);;
    config.delegate = self;
    config.mediaViewFrame = CGRectMake(0, kNavigationBarHeight + 150.0f, kScreenW, kScreenH - kNavigationBarHeight - 150);
    config.rootViewController = self;

    
    ATNativeAdOffer *offer = [[ATAdManager sharedManager] getNativeAdOfferWithPlacementID:self.placementID];
    ATNativeSelfRenderView *selfRenderView = [[ATNativeSelfRenderView alloc]initWithOffer:offer];
    self.nativeSelfRenderView = selfRenderView;
    selfRenderView.backgroundColor = [UIColor redColor];
    
    ATNativeADView *nativeADView = [[ATNativeADView alloc]initWithConfiguration:config currentOffer:offer placementID:self.placementID];
    
    UIView *mediaView = [nativeADView getMediaView];

    NSMutableArray *array = [@[selfRenderView.iconImageView,selfRenderView.titleLabel,selfRenderView.textLabel,selfRenderView.ctaLabel,selfRenderView.mainImageView] mutableCopy];
    
    if (mediaView) {
        [array addObject:mediaView];
    }
    [nativeADView registerClickableViewArray:array];
    
    mediaView.frame = CGRectMake(0, kNavigationBarHeight + 150.0f, kScreenW, kScreenH - kNavigationBarHeight - 150);
    [selfRenderView addSubview:mediaView];
    
    [selfRenderView addSubview:nativeADView.videoAdView];
    [selfRenderView addSubview:nativeADView.dislikeDrawButton];
    [selfRenderView addSubview:nativeADView.adLabel];
    [selfRenderView addSubview:nativeADView.logoImageView];
    [selfRenderView addSubview:nativeADView.logoADImageView];
    
    nativeADView.videoAdView.frame = CGRectMake(0, kNavigationBarHeight + 50.0f, kScreenW, kScreenH - kNavigationBarHeight - 50);
    
    nativeADView.dislikeDrawButton.frame = CGRectMake(kScreenW - 50, kNavigationBarHeight + 80.0f , 50,50);
    
    nativeADView.adLabel.frame = CGRectMake(kScreenW - 50, kNavigationBarHeight + 150.0f, kScreenW, 50);
    
    nativeADView.logoImageView.frame = CGRectMake(kScreenW - 50, kNavigationBarHeight + 200.0f, 50, 50);
    nativeADView.logoADImageView.frame = CGRectMake(kScreenW - 50, kNavigationBarHeight + 250.0f, 50, 50);
    
    ATNativePrepareInfo *info = [ATNativePrepareInfo loadPrepareInfo:^(ATNativePrepareInfo * _Nonnull prepareInfo) {
        prepareInfo.textLabel = selfRenderView.textLabel;
        prepareInfo.advertiserLabel = selfRenderView.advertiserLabel;
        prepareInfo.titleLabel = selfRenderView.titleLabel;
        prepareInfo.ratingLabel = selfRenderView.ratingLabel;
        prepareInfo.iconImageView = selfRenderView.iconImageView;
        prepareInfo.mainImageView = selfRenderView.mainImageView;
        prepareInfo.logoImageView = selfRenderView.logoImageView;
        prepareInfo.sponsorImageView = selfRenderView.sponsorImageView;
        prepareInfo.dislikeButton = selfRenderView.dislikeButton;
        prepareInfo.ctaLabel = selfRenderView.ctaLabel;
        prepareInfo.mediaView = mediaView;
    }];
    [nativeADView prepareWithNativePrepareInfo:info];
    
    [offer rendererWithConfiguration:config selfRenderView:selfRenderView nativeADView:nativeADView];
    
    ATDrawViewController *drawVc = [[ATDrawViewController alloc] initWithAdView:nativeADView];
    
    [self.navigationController pushViewController:drawVc animated:YES];
}

#pragma mark - delegate with extra
- (void)didStartLoadingADSourceWithPlacementID:(NSString *)placementID extra:(NSDictionary*)extra{
    NSLog(@"广告源--AD--开始--ATRewardVideoViewController::didStartLoadingADSourceWithPlacementID:%@---extra:%@", placementID,extra);
}

- (void)didFinishLoadingADSourceWithPlacementID:(NSString *)placementID extra:(NSDictionary*)extra{
    NSLog(@"广告源--AD--完成--ATRewardVideoViewController::didFinishLoadingADSourceWithPlacementID:%@---extra:%@", placementID,extra);
}

- (void)didFailToLoadADSourceWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra error:(NSError*)error{
    NSLog(@"广告源--AD--失败--ATRewardVideoViewController::didFailToLoadADSourceWithPlacementID:%@---error:%@", placementID,error);
}

// bidding
- (void)didStartBiddingADSourceWithPlacementID:(NSString *)placementID extra:(NSDictionary*)extra{
    NSLog(@"广告源--bid--开始--ATRewardVideoViewController::didStartBiddingADSourceWithPlacementID:%@---extra:%@", placementID,extra);
}

- (void)didFinishBiddingADSourceWithPlacementID:(NSString *)placementID extra:(NSDictionary*)extra{
    NSLog(@"广告源--bid--完成--ATRewardVideoViewController::didFinishBiddingADSourceWithPlacementID:%@--extra:%@", placementID,extra);
}

- (void)didFailBiddingADSourceWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra error:(NSError*)error{
    NSLog(@"广告源--bid--失败--ATRewardVideoViewController::didFailBiddingADSourceWithPlacementID:%@--error:%@", placementID,error);
}

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSLog(@"ATNativeViewController:: didFinishLoadingADWithPlacementID:%@", placementID);
    [self showLog:[NSString stringWithFormat:@"didFinishLoading:%@", placementID]];
}

-(void) didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    NSLog(@"ATNativeViewController:: didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
    [self showLog:[NSString stringWithFormat:@"didFailToLoad:%@ errorCode:%ld", placementID, (long)error.code]];
}

#pragma mark - delegate with extra
-(void) didStartPlayingVideoInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ATNativeViewController:: didStartPlayingVideoInAdView:placementID:%@with extra: %@", placementID,extra);
    [self showLog:[NSString stringWithFormat:@"didStartPlayingVideoInAdView:%@", placementID]];
}

-(void) didEndPlayingVideoInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ATNativeViewController:: didEndPlayingVideoInAdView:placementID:%@ extra: %@", placementID,extra);
    [self showLog:[NSString stringWithFormat:@"didEndPlayingVideoInAdView:%@", placementID]];
}

-(void) didClickNativeAdInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ATNativeViewController:: didClickNativeAdInAdView:placementID:%@ with extra: %@", placementID,extra);
    [self showLog:[NSString stringWithFormat:@"didClickNativeAdInAdView:%@", placementID]];
}

- (void) didDeepLinkOrJumpInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
    NSLog(@"ATNativeViewController:: didDeepLinkOrJumpInAdView:placementID:%@ with extra: %@, success:%@", placementID,extra, success ? @"YES" : @"NO");
    [self showLog:[NSString stringWithFormat:@"ATNativeViewController:: didDeepLinkOrJumpInAdView:%@, success:%@", placementID, success ? @"YES" : @"NO"]];
}

-(void) didShowNativeAdInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ATNativeViewController:: didShowNativeAdInAdView:placementID:%@ with extra: %@", placementID,extra);
    adView.mainImageView.hidden = [adView isVideoContents];
    [self showLog:[NSString stringWithFormat:@"didShowNativeAdInAdView:%@", placementID]];
}

-(void) didEnterFullScreenVideoInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ATNativeViewController:: didEnterFullScreenVideoInAdView:placementID:%@", placementID);
    [self showLog:[NSString stringWithFormat:@"didEnterFullScreenVideoInAdView:%@", placementID]];
}

-(void) didExitFullScreenVideoInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"ATNativeViewController:: didExitFullScreenVideoInAdView:placementID:%@", placementID);
    [self showLog:[NSString stringWithFormat:@"didExitFullScreenVideoInAdView:%@", placementID]];
}

-(void) didTapCloseButtonInAdView:(ATNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra {
    NSLog(@"ATNativeViewController:: didTapCloseButtonInAdView:placementID:%@ extra:%@", placementID, extra);
    [self.adView removeFromSuperview];
    self.adView = nil;
    adView = nil;
    [self showLog:[NSString stringWithFormat:@"didTapCloseButtonInAdView:placementID:%@", placementID]];
}

- (void)didCloseDetailInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    NSLog(@"ATNativeViewController:: didCloseDetailInAdView:placementID:%@ extra:%@", placementID, extra);
    [self showLog:[NSString stringWithFormat:@"didCloseDetailInAdView:placementID:%@", placementID]];
}


#pragma mark - lazy
- (ATADFootView *)footView
{
    if (!_footView) {
        _footView = [[ATADFootView alloc] init];

        __weak typeof(self) weakSelf = self;
        [_footView setClickLoadBlock:^{
            NSLog(@"点击加载");
            [weakSelf loadAd];
        }];
        [_footView setClickReadyBlock:^{
            NSLog(@"点击准备");
            [weakSelf checkAd];
        }];
        [_footView setClickShowBlock:^{
            NSLog(@"点击展示");
            [weakSelf showAd];
        }];
        
        if (![NSStringFromClass([self class]) containsString:@"Auto"]) {
            [_footView.loadBtn setTitle:@"Load Native AD" forState:UIControlStateNormal];
            [_footView.readyBtn setTitle:@"Is Native AD Ready" forState:UIControlStateNormal];
            [_footView.showBtn setTitle:@"Show Native AD" forState:UIControlStateNormal];
        }
        
    }
    return _footView;
}

- (ATModelButton *)nativeBtn
{
    if (!_nativeBtn) {
        _nativeBtn = [[ATModelButton alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScaleW(532))];
        _nativeBtn.tag = 0;
        _nativeBtn.backgroundColor = [UIColor whiteColor];
        _nativeBtn.layer.borderWidth = kScaleW(5);
        _nativeBtn.modelLabel.text = @"Native";
        _nativeBtn.image.image = [UIImage imageNamed:@"Native"];
        [_nativeBtn addTarget:self action:@selector(changeModel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nativeBtn;
}

- (ATModelButton *)drawBtn
{
    if (!_drawBtn) {
        _drawBtn = [[ATModelButton alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScaleW(532))];
        _drawBtn.tag = 1;
        _drawBtn.backgroundColor = [UIColor whiteColor];
        _drawBtn.layer.borderWidth = kScaleW(5);
        _drawBtn.modelLabel.text = @"Vertical-Draw Video";
        _drawBtn.image.image = [UIImage imageNamed:@"Vertical Draw video"];
        [_drawBtn addTarget:self action:@selector(changeModel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _drawBtn;
}

- (ATModelButton *)preRollBtn
{
    if (!_preRollBtn) {
        _preRollBtn = [[ATModelButton alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScaleW(532))];
        _preRollBtn.tag = 2;
        _preRollBtn.backgroundColor = [UIColor whiteColor];
        _preRollBtn.layer.borderWidth = kScaleW(5);
        _preRollBtn.modelLabel.text = @"Pre-Roll";
        _preRollBtn.image.image = [UIImage imageNamed:@"Pre-roll AD"];
        [_preRollBtn addTarget:self action:@selector(changeModel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _preRollBtn;
}

- (ATMenuView *)menuView
{
    if (!_menuView) {
        NSArray *list = @[@"Native", @"Native List"];
        _menuView = [[ATMenuView alloc] initWithMenuList:self.placementIDs.allKeys subMenuList:list];
        _menuView.layer.masksToBounds = YES;
        _menuView.layer.cornerRadius = 5;
        __weak typeof (self) weakSelf = self;
        [_menuView setSelectMenu:^(NSString * _Nonnull selectMenu) {
            weakSelf.placementID = weakSelf.placementIDs[selectMenu];
            NSLog(@"select placementId:%@", weakSelf.placementID);
        }];
        [_menuView setSelectSubMenu:^(NSString * _Nonnull selectSubMenu) {
            weakSelf.nativeStr = selectSubMenu;
            NSLog(@"%@", selectSubMenu);
        }];
    }
    return _menuView;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.layer.masksToBounds = YES;
        _textView.layer.cornerRadius = 5;
        _textView.editable = NO;
        _textView.text = @"";
    }
    return _textView;
}

- (UIView *)showView
{
    if (!_showView) {
        _showView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _showView.backgroundColor = [UIColor whiteColor];
    }
    return _showView;
}

@end

//
//  QuartaTela.m
//  Paraiso FM
//
//  Created by Fabricio Aguiar de Padua on 20/07/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import "QuartaTela.h"
#import <sys/utsname.h>

//#import "GADBannerView.h"
//#import "GADRequest.h"

#import "AppID.h"


@interface QuartaTela ()

@end


@implementation QuartaTela

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self Carregar_Banner];
}

#pragma mark - MFMailComposeController delegate

/*-(void)Carregar_Banner {
#define iphone 50
#define ipad 97
    
    NSInteger posicao_banner = 0;
    
    if (self.view.frame.size.height < 960) {
        posicao_banner = iphone;
    } else {
        posicao_banner = ipad;
    }
    
    // Initialize the banner at the up the tab bar.
    CGPoint origin = CGPointMake(0.0,
                                 self.view.frame.size.height -
                                 CGSizeFromGADAdSize(kGADAdSizeBanner).height -
                                 self.navigationController.navigationBar.frame.size.height -
                                 posicao_banner /* status bar );
    
    // Initialize the banner at the bottom of the screen.
    /*   CGPoint origin = CGPointMake(0.0,
     self.view.frame.size.height -
     CGSizeFromGADAdSize(kGADAdSizeBanner).height);
     */
    
    // Use predefined GADAdSize constants to define the GADBannerView.
    /*self.adBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait origin:origin];
    
    // Note: Edit SampleConstants.h to provide a definition for kSampleAdUnitID before compiling.
    self.adBanner.adUnitID = @"a153469ee358b38";
    self.adBanner.delegate = self;
    self.adBanner.rootViewController = self;
    [self.view addSubview:self.adBanner];
    [self.adBanner loadRequest:[self request]];
    
}

- (GADRequest *)request {
    GADRequest *request = [GADRequest request];
    
    request.testDevices = [NSArray arrayWithObjects:
                           GAD_SIMULATOR_ID, @"53434f5a4f0499df210a28721c0b74568d755c7c", nil];
    return request;
}

#pragma mark GADBannerViewDelegate implementation

// We've received an ad successfully.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Received ad successfully");
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Failed to receive ad with error: %@", [error localizedFailureReason]);
}*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

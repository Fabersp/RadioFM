//
//  AppDelegate.h
//  Paraiso FM
//
//  Created by Fabricio Aguiar de Padua on 13/04/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GADInterstitial.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
//    GADInterstitial *splashInterstitial_;
}

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic, readonly) NSString *interstitialAdUnitID;

//- (GADRequest *)createRequest;

@end

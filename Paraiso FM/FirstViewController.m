//
//  FirstViewController.m
//  Paraiso FM
//
//  Created by Fabricio Aguiar de Padua on 13/04/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import "FirstViewController.h"
#import "Reachability.h"
#import <AVFoundation/AVFoundation.h>
#import <sys/utsname.h>

//#import "GADBannerView.h"
//#import "GADRequest.h"
//#import "GADInterstitial.h"

#import "AppID.h"

@interface FirstViewController ()

@property (nonatomic, strong) AVQueuePlayer *Iniciar;

@end

@implementation FirstViewController

@synthesize Player = _Player;
@synthesize Stop = _Stop;
@synthesize Lb_Info = _Lb_Info;
@synthesize Lb_Rede = _Lb_Rede;
@synthesize Radio = _Radio;
@synthesize Aparelho = _Aparelho;
//@synthesize interstitial = interstitial_;


/*- (void)interstitial:(GADInterstitial *)interstitial
didFailToReceiveAdWithError:(GADRequestError *)error {
    // Alert the error.
    UIAlertView *alert = [[UIAlertView alloc]
                           initWithTitle:@"GADRequestError"
                           message:[error localizedDescription]
                           delegate:nil cancelButtonTitle:@"Drat"
                           otherButtonTitles:nil];
    [alert show];
    
    //interstitialButton_.enabled = YES;
}

- (void)interstitialDidReceiveAd:(GADInterstitial *)interstitial {
    [interstitial presentFromRootViewController:self];
    //interstitialButton_.enabled = YES;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _Player = [UIImage imageNamed:@"Play_Vermelho.png"];
    _Stop   = [UIImage imageNamed:@"Stop_Vermelho.png"];
    
    [self Teste_Conexao];
    //[self Carregar_Banner];
    [self Carregar_Radio];
    
   //  sleep();
}

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
                                 posicao_banner /* status bar ); */
    
    // Initialize the banner at the bottom of the screen.
    /*   CGPoint origin = CGPointMake(0.0,
         self.view.frame.size.height -
         CGSizeFromGADAdSize(kGADAdSizeBanner).height);
    */
    
    // Use predefined GADAdSize constants to define the GADBannerView.
 /*   self.adBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait origin:origin];
    
    // Note: Edit SampleConstants.h to provide a definition for kSampleAdUnitID before compiling.
    self.adBanner.adUnitID = @"a153469ee358b38";
    //self.adBanner.delegate = self;
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
} */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) Carregar_Radio{

    // Set AVAudioSession
    NSError *sessionError = nil;
    [[AVAudioSession sharedInstance] setDelegate:self];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    
    // Change the default output audio route
  //  UInt32 doChangeDefaultRoute = 1;
  //  AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof(doChangeDefaultRoute), &doChangeDefaultRoute);
    
    NSString *url = self.BuscarStrieming;
   
    NSURL *urlStream = [NSURL URLWithString:url];
    
    NSArray *queue = @[[AVPlayerItem playerItemWithURL:urlStream]];
    
    self.Iniciar = [[AVQueuePlayer alloc] initWithItems:queue];
    self.Iniciar.actionAtItemEnd = AVPlayerActionAtItemEndAdvance;
    
    [self.Iniciar addObserver:self
                   forKeyPath:@"currentItem"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)Teste_Conexao{
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
    //Change the host name here to change the server your monitoring
	hostReach = [Reachability reachabilityWithHostName: @"www.apple.com"];
	
    [hostReach startNotifier];
	[self updateInterfaceWithReachability: hostReach];
	
    internetReach = [Reachability reachabilityForInternetConnection];
	
    [internetReach startNotifier];
	[self updateInterfaceWithReachability: internetReach];
    
    wifiReach = [Reachability reachabilityForLocalWiFi];
	
    [wifiReach startNotifier];
	[self updateInterfaceWithReachability: wifiReach];
}

- (IBAction)BtnFacabook:(id)sender {
  
    NSURL *fanPageURL = [NSURL URLWithString:@"fb://profile/157101884370855"];
    
    if (![[UIApplication sharedApplication] openURL: fanPageURL]) {
        //fanPageURL failed to open.  Open the website in Safari instead
        NSURL *webURL = [NSURL URLWithString:@"http://www.facebook.com/pages/Blackout-Labs/157101884370855"];
        [[UIApplication sharedApplication] openURL: webURL];
    }
}

- (IBAction)Play_Stop:(id)sender {
    
    if (Clicked == 0) {
        Clicked = 1;
        [start setImage:_Stop forState:UIControlStateNormal];
        [self.Iniciar play];
     //   [self Controle_Ouvintes];
        [self.Iniciar addObserver:self forKeyPath:@"status" options:0 context:nil];
     } else {
        [self.Iniciar pause];
        [start setImage:_Player forState:UIControlStateNormal];
        Clicked = 0;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    
    if (object == self.Iniciar && [keyPath isEqualToString:@"status"]) {
        if (self.Iniciar.status == AVPlayerStatusReadyToPlay) {
            
        } else if (self.Iniciar.status == AVPlayerStatusFailed) {
            [start setImage:_Stop forState:UIControlStateNormal];
        }
    }
}

- (void) configureTextField: (UILabel*) textField reachability: (Reachability*) curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    BOOL connectionRequired = [curReach connectionRequired];
    
    NSString * statusString = @"";

    switch (netStatus)
    {
        case NotReachable:
        {
            statusString = @"Rede indisponível.";
            Tem_Conexao = FALSE;
            connectionRequired = NO;
            break;
        }
        case ReachableViaWWAN:
        {
            statusString = @" ";
            connectionRequired = YES;
            break;
        }
        case ReachableViaWiFi:
        {
            statusString= @" ";
            connectionRequired = YES;
            break;
        }
    }
    _Lb_Rede.text = statusString;
    
    if(connectionRequired)
    {
       
        [self Carregar_Radio];
        _Lb_Rede.enabled = false;
        Imagem_Fundo.alpha = 1;
        
        start.enabled = YES;
        start.alpha = 1;

        BtnFacebook.enabled = YES;
        BtnFacebook.alpha = 1;
        
        BtnFaceBookIpad.enabled = YES;
        BtnFaceBookIpad.alpha = 1;
    }
    else
    {
        _Lb_Rede.enabled = true;
        Imagem_Fundo.alpha = 0.1;
        
        start.enabled = NO;
        start.alpha = 0.1;
        
        BtnFacebook.enabled = NO;
        BtnFacebook.alpha = 0.1;
        
        BtnFaceBookIpad.enabled = NO;
        BtnFaceBookIpad.alpha = 0.1;
        
        if (Clicked == 1)
        {
            [start setImage:_Player forState:UIControlStateNormal];
            Clicked = 0;
        }
    }
}

- (void) updateInterfaceWithReachability: (Reachability *) curReach
{
    if (curReach == hostReach)
    {
        [self configureTextField: _Lb_Info reachability: curReach];
    
    }
	if(curReach == internetReach)
	{
		[self configureTextField: _Lb_Info reachability: curReach];
	}
	if(curReach == wifiReach)
	{
		[self configureTextField: _Lb_Info reachability: curReach];
	}
}

//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification* )note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    [self updateInterfaceWithReachability: curReach];
    
}

-(NSString *) BuscarStrieming {
 //iserir na banco as vezes que foi ouvida a radio.
    NSMutableString *strURL = [[NSMutableString alloc] initWithFormat:@"http://www.promastersolution.com/x7890_IOS/Radios/ParaisoFM/link_paraisofm.php"];
    
    [strURL setString:[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    NSMutableString *SrtResult = [[NSMutableString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    //NSLog(@"Resultado: %@", SrtResult);
    
    return SrtResult;
}

@end

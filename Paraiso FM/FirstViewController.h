//
//  FirstViewController.h
//  Paraiso FM
//
//  Created by Fabricio Aguiar de Padua on 13/04/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GADInterstitial.h"
//#import "GADInterstitialDelegate.h"

@class Reachability;// , GADBannerView, GADRequest, GADBannerViewDelegate;

@interface FirstViewController : UIViewController {
    UIImage *Player, *Stop;
    IBOutlet UIButton *start;
    int Clicked, Iserido_Banco;
    UILabel *Lb_Info;
    Boolean *Tem_Conexao;
    __weak IBOutlet UILabel *Lb_Rede;
    __weak IBOutlet UIImageView *Imagem_Fundo;
    NSString *Radio, *Aparelho;
    
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
    
    __weak IBOutlet UIButton *BtnFaceBookIpad;
    __weak IBOutlet UIButton *BtnFacebook;
    
//    GADInterstitial *interstitial_;

}

@property (weak, nonatomic) IBOutlet UILabel *Lb_Info;
@property (nonatomic, retain) UIImage *Player, *Stop;
@property (weak, nonatomic) IBOutlet UILabel *Lb_Rede;
@property (nonatomic, retain) NSString  *Radio, *Aparelho;
//@property(nonatomic, strong) GADBannerView *adBanner;
//@property(nonatomic, retain) GADInterstitial *interstitial;



- (IBAction)BtnFacabook:(id)sender;

- (IBAction)Play_Stop:(id)sender;

-(void)Carregar_Banner;

-(void)Teste_Conexao;

-(NSString *) BuscarStrieming;

//- (GADRequest *)request;

@end

//
//  SecondViewController.m
//  Paraiso FM
//
//  Created by Fabricio Aguiar de Padua on 13/04/13.
//  Copyright (c) 2013 Pro Master Solution. All rights reserved.
//

#import "TerceiraTela.h"
#import <sys/utsname.h>

//#import "GADBannerView.h"
//#import "GADRequest.h"

#import "AppID.h"

@interface TerceiraTela ()

@end

@implementation TerceiraTela

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   	   
    Contato.layer.cornerRadius = 10.0f;
    Contato.layer.masksToBounds = YES;
    
    Contar_amigo.layer.cornerRadius = 10.0f;
    Contar_amigo.layer.masksToBounds = YES;
    
    Comentario.layer.cornerRadius = 10.0f;
    Comentario.layer.masksToBounds = YES;
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Fundo~iphone.png"]];

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
                                 posicao_banner /* status bar );
    
    // Initialize the banner at the bottom of the screen.
    /*   CGPoint origin = CGPointMake(0.0,
     self.view.frame.size.height -
     CGSizeFromGADAdSize(kGADAdSizeBanner).height);
     */
    
    // Use predefined GADAdSize constants to define the GADBannerView.
   /* self.adBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait origin:origin];
    
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
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Site:(id)sender {
    [[UIApplication sharedApplication]
	 openURL:[NSURL URLWithString: @"http://www.promastersolution.com.br"]];

}

- (IBAction)Contato:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setSubject:@"Contato"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"sac@promastersolution.com", nil];
        [mailer setToRecipients:toRecipients];
        // only for iPad
       //  mailer.modalPresentationStyle = UIModalPresentationPageSheet;
    //    [self presentModalViewController:mailer animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falha"
                                                        message:@"Este dispositivo não suporta o envio de e-mail."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}




#pragma mark - MFMailComposeController delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    UIAlertView *alertMFMailComposeResultCancelled = [[UIAlertView alloc] initWithTitle:@"E-mail cancelado"
                                                    message:@"Você cancelou a operação e nenhuma mensagem de e-mail foi enviada."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    
    UIAlertView *alertMFMailComposeResultSaved = [[UIAlertView alloc] initWithTitle:@"E-mail salvo"
                                                                                message:@"Você salva a mensagem de e-mail na pasta rascunhos."
                                                                               delegate:nil
                                                                      cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
    
    UIAlertView *alertMFMailComposeResultSent = [[UIAlertView alloc] initWithTitle:@"E-mail enviado"
                                                                            message:@"A mensagem de e-mail está na fila na caixa de saída. Ele está pronto para enviar a próxima vez que o usuário se conecta ao enviar e-mail."
                                                                           delegate:nil
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles: nil];
    
    UIAlertView *alertMFMailComposeResultFailed = [[UIAlertView alloc] initWithTitle:@"E-mail falhou"
                                                                           message:@"A mensagem de e-mail não foi salvo ou enviado, possivelmente devido a um erro."
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"OK"
                                                                 otherButtonTitles: nil];
    
	switch (result)
	{
		case MFMailComposeResultCancelled:
            [alertMFMailComposeResultCancelled show];
			break;
		case MFMailComposeResultSaved:
			[alertMFMailComposeResultSaved show];
			break;
		case MFMailComposeResultSent:
			[alertMFMailComposeResultSent show];
			break;
		case MFMailComposeResultFailed:
			[alertMFMailComposeResultFailed show];
			break;
		default:
			NSLog(@"Mail não enviado.");
			break;
	}
//	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)Contar_amigo:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setSubject:@"Veja esta aplicação do Iphone."];
        
        UIImage *myImage = [UIImage imageNamed:@"Disponivel_ParaisoFM_pequena.png"];
        NSData *imageData = UIImagePNGRepresentation(myImage);
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        
        NSString *emailBody = @"Olá,\n\n Estou utilizando o aplicativo da Paraíso FM para ouvir a rádio, ele está disponivel para IPhone, IPad e IPod. \n\n Baixe ele na Itunes.";
        
        [mailer setMessageBody:emailBody isHTML:NO];
        
        // only for iPad
        //  mailer.modalPresentationStyle = UIModalPresentationPageSheet;
    //    [self presentModalViewController:mailer animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falha"
                                                        message:@"Este dispositivo não suporta o envio de e-mail."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }

}


@end

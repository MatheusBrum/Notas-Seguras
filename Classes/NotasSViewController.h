//
//  NotasSViewController.h
//  NotasS
//
//  Created by Matheus Brum on 25/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotasSViewController : UIViewController  <UITextFieldDelegate, UITextViewDelegate>  {
	IBOutlet UITextView *texto;
	IBOutlet UITextField *campoTextoSenha;
	IBOutlet UITextField *campoNovaSenha;
	IBOutlet UIView *view1;
	IBOutlet UIView *view2;
	IBOutlet UIView *view3;
	IBOutlet UISwitch *chaveImagem;
	IBOutlet UIImageView *imagemTexto;
	NSString *textoEscrito;
	NSInteger senha;
	NSInteger cor;
	NSInteger chave;
	NSInteger alinhamento;

}
-(IBAction)sobre;
-(IBAction)corPreto;
-(IBAction)corBranco;
-(IBAction)corAzul;
-(IBAction)textoDireita;
-(IBAction)textoEsquerda;
-(IBAction)textoCentro;
-(IBAction)voltar;
-(IBAction)ok;
-(IBAction)okSenha;
-(IBAction)okNovaSenha;
-(IBAction)configuracoes;
@end


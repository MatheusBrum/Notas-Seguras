//
//  NotasSViewController.m
//  NotasS
//
//  Created by Matheus Brum on 25/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//
// the amount of vertical shift upwards keep the Notes text view visible as the keyboard appears

// the duration of the animation for the view shift
#import "NotasSViewController.h"

@implementation NotasSViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view addSubview:view2];
	NSUserDefaults *txt = [NSUserDefaults standardUserDefaults];
	textoEscrito = [txt stringForKey:@"textoEscritoSalvo"];
	[texto setText:textoEscrito];
	campoTextoSenha.delegate = self;
	campoNovaSenha.delegate = self;
	NSUserDefaults *senhaPath = [NSUserDefaults standardUserDefaults];
	senha = [senhaPath integerForKey:@"integerKey"];
	NSLog(@"Senha = %i",senha);
	NSUserDefaults *corPath = [NSUserDefaults standardUserDefaults];
	cor = [corPath integerForKey:@"CorKey"];
	NSLog(@"Cor = %i",cor);
	switch (cor) {
		case 1:
			[texto setTextColor:[UIColor blackColor]];
			break;
		case 2:
			[texto setTextColor:[UIColor whiteColor]];
			break;
		case 3:
			[texto setTextColor:[UIColor blueColor]];
			break;
	}
	NSUserDefaults *chavePath = [NSUserDefaults standardUserDefaults];
	chave = [chavePath integerForKey:@"chaveKey"];
	NSLog(@"Chave = %i",chave);
	switch (chave) {
		case 0:
			[imagemTexto setHidden:NO];
			[chaveImagem setOn:YES];
			break;
		case 1:
			[imagemTexto setHidden:YES];
			[chaveImagem setOn:NO];

			break;
	}
	NSUserDefaults *alinhamentoPath = [NSUserDefaults standardUserDefaults];
	alinhamento = [alinhamentoPath integerForKey:@"alinhamentoKey"];
	NSLog(@"Alinhamento = %i",alinhamento);
	switch (alinhamento) {
		case 2:
			texto.textAlignment = UITextAlignmentCenter;
			break;
		case 0:
			texto.textAlignment = UITextAlignmentLeft;
			break;
		case 1:
			texto.textAlignment = UITextAlignmentRight;
			break;
	}
}

-(IBAction)ok{
	[texto resignFirstResponder];
	textoEscrito = texto.text;
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setObject:textoEscrito forKey:@"textoEscritoSalvo"];

}
-(IBAction)okSenha{
	[campoTextoSenha resignFirstResponder];
	if ([campoTextoSenha.text intValue] == senha  ) {
		[UIView beginAnimations:@"fadeout" context:nil];
		[UIView setAnimationDuration:1.0f];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view2 cache:YES];
		[UIView setAnimationDelegate:self];
		view2.alpha = 0.0;
		[UIView commitAnimations];
	}else {
		UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"OPS!" message:@"Senha incorreta, tente novamente" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alerta show];
		[alerta release];
	}

}
-(IBAction)okNovaSenha{
	[campoNovaSenha resignFirstResponder];
}
-(IBAction)configuracoes{
	NSLog(@"Configurações");
	[texto resignFirstResponder];
	[self.view addSubview:view3];
	[view3 setAlpha:1.0];
	
}
-(IBAction)sobre{
	UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Sobre o programa" message:@"Programa criado por Matheus Brum, membro do blog AppleManiacos.com e distribuido grátis por código aberto" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Como utilizar",nil];
	[alerta show];
	[alerta release];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (buttonIndex == 1) {
		UIAlertView *alerta2 = [[UIAlertView alloc]initWithTitle:@"Como utilizar" message:@"Por default a senha é 0, neste caso não é necessário que a senha seja digitada, na página de edição de texto quando o botão OK é pressionado o texto é automaticamente salvo, as configurações da pagina de ajustes são salvas ao clicar o botão Voltar" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alerta2 show];
		[alerta2 release];
	}
}
-(IBAction)voltar{
	[campoNovaSenha resignFirstResponder];
	NSLog(@"Salvando e voltando para o texto");
	[view3 setAlpha:0.0];
	if (chaveImagem.on) {
		[imagemTexto setHidden:NO];
		chave = 0;
	}else {
		[imagemTexto setHidden:YES];
		chave = 1;
	}
	NSUserDefaults *chavePath = [NSUserDefaults standardUserDefaults];
	[chavePath setInteger:chave forKey:@"chaveKey"];
	NSLog(@"Valor do Switch salo =  %i",chave);
	NSUserDefaults *corPath = [NSUserDefaults standardUserDefaults];
	[corPath setInteger:cor forKey:@"CorKey"];
	NSLog(@"Cor salva %i",cor);
	NSUserDefaults *senhaPath = [NSUserDefaults standardUserDefaults];
	[senhaPath setInteger:[campoNovaSenha.text intValue] forKey:@"integerKey"];
	NSLog(@"Senha salva");
	NSUserDefaults *alinhamentoPath = [NSUserDefaults standardUserDefaults];
	[alinhamentoPath setInteger:alinhamento forKey:@"alinhamentoKey"];
	NSLog(@"Alinhamento salvo");
}
-(IBAction)corPreto{
	cor = 1;
	[texto setTextColor:[UIColor blackColor]];
}
-(IBAction)corBranco{
	cor = 2;
 	[texto setTextColor:[UIColor whiteColor]];
}
-(IBAction)corAzul{
	cor = 3;
	[texto setTextColor:[UIColor blueColor]];
}
-(IBAction)textoDireita{
	texto.textAlignment = UITextAlignmentRight;
	alinhamento = 1;

}
-(IBAction)textoEsquerda{
	texto.textAlignment = UITextAlignmentLeft;
	alinhamento = 0;

}
-(IBAction)textoCentro{
	texto.textAlignment = UITextAlignmentCenter;
	alinhamento = 2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)textViewDidBeginEditing:(UITextView *)textField {
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
	CGRect r = CGRectMake (0, 44, 320, 230);
	[texto setFrame: r];
	[UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView *)textField {
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
	CGRect r = CGRectMake (0, 44, 320, 416);
	[texto setFrame: r];
	[UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end

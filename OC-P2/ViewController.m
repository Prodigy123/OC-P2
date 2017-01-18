//
//  ViewController.m
//  OC-P2
//
//  Created by 吉安 on 18/01/2017.
//  Copyright © 2017 An Ji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController
- (IBAction)changeBodyColorIntoTheBackgroundColorOfTheButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}
- (IBAction)OutlineSelectedCOntent {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3,
                                           NSStrokeColorAttributeName : [UIColor blackColor]}                                 range:self.body.selectedRange];
}
- (IBAction)UnOutlineSelectedContent {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self preferredFont];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}
-(void)preferredFontsChange: (NSNotification *) notification{
    [self preferredFont];
}
-(void) preferredFont{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName : @3,
                           NSStrokeColorAttributeName : [UIColor blackColor]} range:NSMakeRange(0, [self.outlineButton.currentTitle length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
}




@end

//
//  AnswersViewController.m
//  sbsHomework14
//
//  Created by Igor Chernyshov on 07/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "AnswersViewController.h"
#import "GameProtocol.h"


@interface AnswersViewController ()

@property (nonatomic, strong) UITextField *answerField;
@property (nonatomic, strong) UIButton *checkAnswerButton;
@property (nonatomic, strong) UILabel *answerResultLabel;
@property (nonatomic, weak) UIViewController <AnswersOutputProtocol> *output;

@end


@implementation AnswersViewController


#pragma mark - View Controller's Lifecycle

- (instancetype)initWithOutput:(UIViewController <AnswersOutputProtocol> *)output
{
	self = [super init];
	if (self) {
		_output = output;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self createInterface];
	[self setupConstraints];
}


#pragma mark - Setup UI

-(void)createInterface
{
	self.view.backgroundColor = [UIColor whiteColor];
	[self createAnswerField];
	[self createCheckAnswerButton];
	[self createAnswerResultLabel];
}

- (void)createAnswerField
{
	self.answerField = [UITextField new];
	self.answerField.translatesAutoresizingMaskIntoConstraints = NO;
	self.answerField.borderStyle = UITextBorderStyleRoundedRect;
	[self.view addSubview:self.answerField];
}

- (void)createCheckAnswerButton
{
	self.checkAnswerButton = [UIButton buttonWithType:UIButtonTypeSystem];
	self.checkAnswerButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.checkAnswerButton setTitle:@"Answer" forState:UIControlStateNormal];
	[self.checkAnswerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[self.checkAnswerButton addTarget:nil action:@selector(checkAnswerButtonWasTapped) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.checkAnswerButton];
}

- (void)createAnswerResultLabel
{
	self.answerResultLabel = [UILabel new];
	self.answerResultLabel.translatesAutoresizingMaskIntoConstraints = NO;
	self.answerResultLabel.textAlignment = NSTextAlignmentCenter;
	self.answerResultLabel.textColor = [UIColor whiteColor];
	self.answerResultLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.f];
	self.answerResultLabel.alpha = 0.f;
	[self.view addSubview:self.answerResultLabel];
}

- (void)setupConstraints
{
	[self.view addConstraints:@[
								[self.answerField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
								[self.answerField.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 10.f],
								[self.answerField.heightAnchor constraintEqualToConstant:30.f],
								[self.answerField.widthAnchor constraintEqualToConstant:150.f],
								
								[self.checkAnswerButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
								[self.checkAnswerButton.topAnchor constraintEqualToAnchor:self.answerField.bottomAnchor constant: 10.f],
								[self.checkAnswerButton.heightAnchor constraintEqualToConstant:20.f],
								
								[self.answerResultLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
								[self.answerResultLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
								[self.answerResultLabel.heightAnchor constraintEqualToConstant:30.f],
								[self.answerResultLabel.widthAnchor constraintEqualToConstant:100.f],
								]];
}


#pragma mark - Game logic

- (void)checkAnswerButtonWasTapped
{
	NSString *answer = [NSString new];
	answer = self.answerField.text;
	[self.output playerSubmitedStringWithAnswer:answer];
	self.answerField.text = @"";
}


#pragma mark - AnswersInputProtocol

- (void)showAnswerIsCorrect
{
	self.answerResultLabel.text = @"Correct!";
	self.answerResultLabel.backgroundColor = [UIColor blueColor];
	[UIView animateWithDuration:0.5 animations:^{
		self.answerResultLabel.alpha = 1.f;
	} completion:^(BOOL finished) {
		[UIView animateWithDuration:0.5 animations:^{
			self.answerResultLabel.alpha = 0.f;
		}];
	}];
}

- (void)showAnswerIsIncorrect
{
	self.answerResultLabel.text = @"Incorrect!";
	self.answerResultLabel.backgroundColor = [UIColor redColor];
	[UIView animateWithDuration:0.5 animations:^{
		self.answerResultLabel.alpha = 1.f;
	} completion:^(BOOL finished) {
		[UIView animateWithDuration:0.5 animations:^{
			self.answerResultLabel.alpha = 0.f;
		}];
	}];
}

@end

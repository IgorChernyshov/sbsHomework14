//
//  QuestionViewController.m
//  sbsHomework14
//
//  Created by Igor Chernyshov on 07/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "QuestionViewController.h"


@interface QuestionViewController ()

@property (nonatomic, strong) UIImageView *questionImageView;
@property (nonatomic, strong) NSArray<UIImage *> *questionsImages;
@property (nonatomic, strong) NSArray<NSString *> *questionsText;
@property (nonatomic, assign) NSInteger currentQuestionNumber;
@property (nonatomic, assign) NSInteger score;

@property (nonatomic, weak) UIViewController <QuestionsOutputProtocol> *output;

@end


@implementation QuestionViewController


#pragma mark - View Controller's Lifecycle

- (instancetype)initWithOutput:(UIViewController <QuestionsOutputProtocol> *)output
{
	self = [super init];
	if (self) {
		_output = output;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self createInterface];
	[self setupConstraints];
}


#pragma mark - Configure UI

- (void)createInterface
{
	self.questionImageView = [UIImageView new];
	self.questionImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:self.questionImageView];
}

- (void)setupConstraints
{
	[self.view addConstraints:@[
								[self.questionImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
								[self.questionImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
								[self.questionImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
								[self.questionImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
								]];
}


#pragma mark - QuestionsInputProtocol

- (void)startGame
{
	self.questionsText = @[@"horse", @"dog", @"cat", @"parrot", @"woman"];
	NSMutableArray *questionsImages = [NSMutableArray new];
	for (NSString *question in self.questionsText)
	{
		UIImage *questionImage = [UIImage imageNamed:question];
		[questionsImages addObject:questionImage];
	}
	self.questionsImages = [questionsImages copy];
	self.currentQuestionNumber = -1;
	[self displayNextQuestion];
}

- (void)displayNextQuestion
{
	self.currentQuestionNumber += 1;
	self.questionImageView.image = self.questionsImages[self.currentQuestionNumber];
}

- (void)checkAnswer:(NSString *)answer;
{
	NSString *correctAnswer = self.questionsText[self.currentQuestionNumber];
	if ([answer caseInsensitiveCompare:correctAnswer])
	{
		self.score -= 100;
		[self.output isAnswerCorrect:NO];
		return;
	}
	self.score += 200;
	[self.output isAnswerCorrect:YES];
	
	if (self.currentQuestionNumber == self.questionsImages.count - 1)
	{
		[self.output gameEndedWithScore: self.score];
		return;
	}
	
	[self displayNextQuestion];
}

@end

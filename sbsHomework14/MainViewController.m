//
//  MainViewController.m
//  sbsHomework14
//
//  Created by Igor Chernyshov on 10/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionViewController.h"
#import "AnswersViewController.h"
#import "GameResultsViewController.h"


@interface MainViewController ()

@property (nonatomic, strong) UIViewController <QuestionsInputProtocol> *questionsViewController;
@property (nonatomic, strong) UIViewController <AnswersInputProtocol> *answersViewController;
@property (nonatomic, strong) UIViewController *gameResultsViewController;
@property (nonatomic, strong) UIStackView *contentStackView;

@end


@implementation MainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self createStackView];
	[self createChildViewControllers];
	[self.questionsViewController startGame];
}


#pragma mark - Configure UI

- (void)createStackView
{
	self.contentStackView = [UIStackView new];
	self.contentStackView.frame = self.view.bounds;
	self.contentStackView.axis = UILayoutConstraintAxisVertical;
	self.contentStackView.distribution = UIStackViewDistributionFillEqually;
	
	[self.view addSubview:self.contentStackView];
}

- (void)createChildViewControllers
{
	self.questionsViewController = [[QuestionViewController alloc] initWithOutput:self];
	[self addContentWithViewController:self.questionsViewController];
	
	self.answersViewController = [[AnswersViewController alloc] initWithOutput:self];
	[self addContentWithViewController:self.answersViewController];
}


#pragma mark - View Controllers Container Methods

- (void)addContentWithViewController:(UIViewController *)childViewController
{
	[self addChildViewController:childViewController];
	[self.contentStackView addArrangedSubview:childViewController.view];
	[childViewController didMoveToParentViewController:self];
}

- (void)removeContentOfViewController:(UIViewController *)childViewController
{
	[childViewController willMoveToParentViewController:nil];
	[self.contentStackView removeArrangedSubview:childViewController.view];
	[childViewController.view removeFromSuperview];
	[childViewController removeFromParentViewController];
}


#pragma mark - AnswersOutputProtocol

- (void)playerSubmitedStringWithAnswer:(NSString *)answer
{
	[self.questionsViewController checkAnswer:answer];
}


#pragma mark - QuestionsOutputProtocol

- (void)isAnswerCorrect:(BOOL)correct;
{
	if (correct)
	{
		[self.answersViewController showAnswerIsCorrect];
	}
	else
	{
		[self.answersViewController showAnswerIsIncorrect];
	}
}

- (void)gameEndedWithScore:(NSInteger)score
{
	[self removeContentOfViewController:self.questionsViewController];
	[self removeContentOfViewController:self.answersViewController];
	
	self.gameResultsViewController = [[GameResultsViewController alloc] initWithScore:score];
	[self addContentWithViewController:self.gameResultsViewController];
}

@end

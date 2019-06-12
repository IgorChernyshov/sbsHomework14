//
//  GameResultsViewController.m
//  sbsHomework14
//
//  Created by Igor Chernyshov on 12/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "GameResultsViewController.h"


@interface GameResultsViewController ()

@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, assign) NSInteger score;

@end


@implementation GameResultsViewController


#pragma mark - View Controller's Lifecycle

- (instancetype)initWithScore:(NSInteger)score
{
	self = [super init];
	if (self) {
		_score = score;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createInterface];
	[self setupConstraints];
}


#pragma mark - Setup UI

- (void)createInterface
{
	self.view.backgroundColor = [UIColor whiteColor];
	self.scoreLabel = [UILabel new];
	self.scoreLabel.textColor = [UIColor darkTextColor];
	self.scoreLabel.font = [UIFont fontWithName:@"Helvetica" size:18.f];
	self.scoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
	self.scoreLabel.text = [NSString stringWithFormat:@"You scored %ld!", (long)self.score];
	
	[self.view addSubview:self.scoreLabel];
}

- (void)setupConstraints
{
	[self.view addConstraints:@[
								[_scoreLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
								[_scoreLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
								]];
}

@end

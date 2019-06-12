//
//  GameProtocol.h
//  sbsHomework14
//
//  Created by Igor Chernyshov on 11/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol AnswersOutputProtocol

- (void)playerSubmitedStringWithAnswer:(NSString *)answer;

@end


@protocol AnswersInputProtocol

- (void)showAnswerIsCorrect;
- (void)showAnswerIsIncorrect;

@end


@protocol QuestionsOutputProtocol

- (void)isAnswerCorrect:(BOOL)correct;
- (void)gameEndedWithScore:(NSInteger)score;

@end


@protocol QuestionsInputProtocol

- (void)startGame;
- (void)checkAnswer:(NSString *)answer;

@end

NS_ASSUME_NONNULL_END

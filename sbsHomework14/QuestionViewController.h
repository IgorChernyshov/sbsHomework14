//
//  LabelViewController.h
//  sbsHomework14
//
//  Created by Igor Chernyshov on 07/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface QuestionViewController : UIViewController <QuestionsInputProtocol>

- (instancetype)initWithOutput:(UIViewController <QuestionsOutputProtocol> *)output;

@end

NS_ASSUME_NONNULL_END

//
//  MainViewController.h
//  sbsHomework14
//
//  Created by Igor Chernyshov on 10/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface MainViewController : UIViewController <AnswersOutputProtocol, QuestionsOutputProtocol>

@end

NS_ASSUME_NONNULL_END

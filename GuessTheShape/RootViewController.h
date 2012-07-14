//
//  RootViewController.h
//  shapes
//
//  Created by Haifa Carina Baluyos on 7/15/12.
//  Copyright 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController <UITextFieldDelegate> {
    UIImageView *guessThisImage;
    NSArray *shapes_collection;
    UITextField *answerField;
    NSUInteger randomIndex;
    UILabel *resultLabel;
}

@end

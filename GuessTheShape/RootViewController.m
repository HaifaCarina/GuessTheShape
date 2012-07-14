//
//  RootViewController.m
//  shapes
//
//  Created by Haifa Carina Baluyos on 7/15/12.
//  Copyright 2012 NMG Resources, Inc. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

- (void) generateRandomImage {
    NSUInteger tmpRandomIndex = arc4random() % [shapes_collection count];
    
    while (tmpRandomIndex == randomIndex) {
        tmpRandomIndex = arc4random() % [shapes_collection count];
        NSLog(@"same, generate again!");
    }
    
    randomIndex = tmpRandomIndex;
    
    for (id key in [shapes_collection objectAtIndex:randomIndex] ) {
        guessThisImage.image = [[shapes_collection objectAtIndex:randomIndex] valueForKey:key];
    }
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    for (id key in [shapes_collection objectAtIndex:randomIndex] ) {
        
        if ([answerField.text isEqualToString:key]) {
            answerField.text = nil;
            resultLabel.text = @"Correct!";
            [self generateRandomImage];
        } else {
            resultLabel.text = @"Wrong!";
        }
        
    }
    [textField resignFirstResponder];
    return YES;
}
- (void) loadView {
    [super loadView];
    
    shapes_collection = [[NSArray alloc] initWithObjects: [NSDictionary dictionaryWithObject:
                                [UIImage imageNamed:@"circle.png"] forKey:@"circle"],
                                [NSDictionary dictionaryWithObject:[UIImage imageNamed:@"rectangle.png"] forKey:@"rectangle"],
                                [NSDictionary dictionaryWithObject:[UIImage imageNamed:@"square.png"] forKey:@"square"],
                                [NSDictionary dictionaryWithObject:[UIImage imageNamed:@"star.png"] forKey:@"star"],
                                [NSDictionary dictionaryWithObject:[UIImage imageNamed:@"triangle.png"] forKey:@"triangle"], nil];
    
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextButton.frame = CGRectMake(0, 300, 180, 30);
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(generateRandomImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    
    resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 230, 180, 30)];
    resultLabel.text = @" ";
    [self.view addSubview:resultLabel];
    
    answerField = [[UITextField alloc] initWithFrame:CGRectMake(0, 200, 180, 30)];
    answerField.borderStyle = UITextBorderStyleRoundedRect;
    answerField.returnKeyType = UIReturnKeyDone;  
    answerField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    answerField.delegate = self;
    [self.view addSubview:answerField];
    
    randomIndex = arc4random() % [shapes_collection count];
    for (id key in [shapes_collection objectAtIndex:randomIndex] ) {
        guessThisImage = [[UIImageView alloc]initWithImage: [[shapes_collection objectAtIndex:randomIndex] valueForKey:key] ];
    }
    [self.view addSubview:guessThisImage];
    
}

- (void) dealloc {
    
    [super dealloc];
}
@end

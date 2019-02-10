//
//  ThirdViewController.h
//  AlienESP
//
//  Created by Sophia Setsu on 3/17/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//
#import "FirstViewController.h"
#import "SecondViewController.h"
#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *productField;
@property int numGuesses;
@property NSMutableArray *card;
@property NSMutableArray *guessedcard;
@end

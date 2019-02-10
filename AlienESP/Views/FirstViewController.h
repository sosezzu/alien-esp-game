//
//  FirstViewController.h
//  AlienESP
//
//  Created by Sophia Setsu on 3/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property NSMutableArray *card;
@property int numGuesses;
@property (weak, nonatomic) IBOutlet UIPickerView *myPicker;
@property NSMutableArray *guessedcard;
@property NSMutableArray *allguessed;
@end


//
//  SecondViewController.h
//  AlienESP
//
//  Created by Sophia Setsu on 3/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface UIApplication (extended)
-(void) terminateWithSuccess;
@end

@interface SecondViewController : UIViewController
@property NSMutableArray *card;
@property int numGuesses;
@property NSMutableArray *guessedcard;
@property (weak, nonatomic) IBOutlet UITextField *guessed;
@property (weak, nonatomic) IBOutlet UITextField *correct;
@property (weak, nonatomic) IBOutlet UITextField *totalguessed;
@property (weak, nonatomic) IBOutlet UITextField *lowestscore;
@property SystemSoundID mySound;
@property AVAudioPlayer *player;
@end


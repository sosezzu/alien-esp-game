//
//  SecondViewController.m
//  AlienESP
//
//  Created by Sophia Setsu on 3/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "../GameData/GameData.h"
@interface SecondViewController ()<UITextFieldDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.totalguessed.delegate =self;
    self.guessed.delegate = self;
    self.correct.delegate = self;
    self.lowestscore.delegate = self;
    
    self.totalguessed.text = [@(self.numGuesses) stringValue];
    int score =  [GameData sharedGameData].lowScore;
    if (([self.card[0] integerValue] == [self.guessedcard[0] integerValue]) && ([self.card[1]  integerValue] == [self.guessedcard[1] integerValue]))
    {
        self.correct.text = @"Correct!";
        self.lowestscore.text = [NSString stringWithFormat:@"%i guesses", [GameData sharedGameData].lowScore];
        
        if (score > self.numGuesses || score == 0)
        {
            [GameData sharedGameData].lowScore = self.numGuesses;
            [[GameData sharedGameData] save];
            self.lowestscore.text =  [@(self.numGuesses) stringValue];;
        }
        else
        {
            self.lowestscore.text = [NSString stringWithFormat:@"%i", score];
        }
        
        AudioServicesPlaySystemSound(_mySound);
        NSString *soundFilePath = [NSString stringWithFormat:@"%@/doot.wav", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        self.player.delegate = self;
        [_player play];
    }
    else
    {
        self.correct.text = @"Incorrect!";
        if (score == 0) {
            self.lowestscore.text = @"No previous score";
        }
        else{ self.lowestscore.text = [NSString stringWithFormat:@"%i guesses", score];}
    }
    
    NSString *one, *two;
    if ([self.guessedcard[0]  integerValue] < 10 && [self.guessedcard[0] integerValue] != 0)
    {
        one =  [NSString stringWithFormat:@"%li of", [self.guessedcard[0] integerValue] + 1];
    }
    else if ([self.guessedcard[0] integerValue] == 10)
    {
        one = [NSString stringWithFormat:@"Jack of"];
    }
    else if([self.guessedcard[0]integerValue] == 11)
    {
        one =  [NSString stringWithFormat:@"Queen of"];
    }
    else if([self.guessedcard[0]integerValue] == 0)
    {
        one =  [NSString stringWithFormat:@"Ace of"];
    }
    else
    {
        one =   [NSString stringWithFormat:@"King of"];
    }
    
    if ([self.guessedcard[1]  integerValue] == 0)
    {
        two =  [NSString stringWithFormat:@" Diamonds"];
    }
    else if ([self.guessedcard[1] integerValue] == 1)
    {
        two = [NSString stringWithFormat:@" Clubs"];
    }
    else if([self.guessedcard[1] integerValue] == 2)
    {
        two =  [NSString stringWithFormat:@" Hearts"];
    }
    else
    {
        two =   [NSString stringWithFormat:@" Spades"];
    }
    self.guessed.text =  [NSString stringWithFormat:@"%@%@", one, two];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)data successfully:(BOOL)flag{
    [[UIApplication sharedApplication] terminateWithSuccess];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[FirstViewController class]])
    {
        FirstViewController *svc = (FirstViewController *) viewController;
        svc.card = self.card;
        svc.numGuesses = self.numGuesses ;
        [svc.guessedcard removeAllObjects];[self.guessedcard removeAllObjects];
        
    }
    else if ([viewController isKindOfClass:[ThirdViewController class]])
    {
        ThirdViewController *tvc = (ThirdViewController *) viewController;
        tvc.card = self.card;
        self.numGuesses = self.numGuesses ;
    }
    return TRUE;
}
@end

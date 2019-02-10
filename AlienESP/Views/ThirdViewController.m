//
//  ThirdViewController.m
//  AlienESP
//
//  Created by Sophia Setsu on 3/17/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThirdViewController.h"

@interface ThirdViewController ()<UITextFieldDelegate>
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.productField.delegate = self;
}

- (IBAction)buttonPressed:(id)sender
{
    NSString *one, *two;
    if ([self.card[0]  integerValue] < 10 && [self.card[0] integerValue] != 0)
    {
        one =  [NSString stringWithFormat:@"%li of", [self.card[0] integerValue] + 1];
    }
    else if ([self.card[0] integerValue] == 10)
    {
        one = [NSString stringWithFormat:@"Jack of"];
    }
    else if([self.card[0]integerValue] == 11)
    {
        one =  [NSString stringWithFormat:@"Queen of"];
    }
    else if([self.card[0]integerValue] == 12)
    {
        one =  [NSString stringWithFormat:@"King of"];
    }
    else
    {
        one =   [NSString stringWithFormat:@"Ace of"];
    }
    
    if ([self.card[1]  integerValue] == 0)
    {
        two =  [NSString stringWithFormat:@" Diamonds"];
    }
    else if ([self.card[1] integerValue] == 1)
    {
        two = [NSString stringWithFormat:@" Clubs"];
    }
    else if([self.card[1] integerValue] == 2)
    {
        two =  [NSString stringWithFormat:@" Hearts"];
    }
    else
    {
        two =   [NSString stringWithFormat:@" Spades"];
    }
    self.productField.text =  [NSString stringWithFormat:@"%@%@", one, two];
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[FirstViewController class]])
    {
        FirstViewController *svc = (FirstViewController *) viewController;
        svc.card = self.card;
    }
    else if ([viewController isKindOfClass:[SecondViewController class]])
    {
        SecondViewController *tvc = (SecondViewController *) viewController;
        tvc.card = self.card;
        tvc.numGuesses = self.numGuesses + 1;
        tvc.guessedcard = self.guessedcard;
        [tvc viewDidLoad];
    }
    return TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

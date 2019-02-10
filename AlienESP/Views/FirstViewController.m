//
//  FirstViewController.m
//  AlienESP
//
//  Created by Sophia Setsu on 3/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"
@interface FirstViewController () < UIPickerViewDelegate, UIPickerViewDataSource, UITabBarControllerDelegate>
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPicker.dataSource = self;
    self.myPicker.delegate = self;self.tabBarController.delegate = self;
    srandom(time(NULL));
    self.numGuesses = 0;
    int num = (random() % 52);
    self.card = [NSMutableArray array];
    self.allguessed = [NSMutableArray array];
    [self.card addObject: [NSNumber numberWithInt: num/4]];
    [self.card addObject: [NSNumber numberWithInt: num%4]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//picker has 2 columns
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 2;
}
//13 and 4 columns
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 13;
    }
    else
    {
        return 4;
    }
}
//labels picker rowsf
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        if (row < 10 && row != 0)
        {
            return [NSString stringWithFormat:@"%li of", row + 1];
        }
        else if (row == 10)
        {
            return [NSString stringWithFormat:@"Jack of"];
        }
        else if(row == 11)
        {
            return [NSString stringWithFormat:@"Queen of"];
        }
        else if(row == 12)
        {
            return [NSString stringWithFormat:@"King of"];
        }
        else
        {
            return  [NSString stringWithFormat:@"Ace of"];
        }
    }
    else
    {
        return  [NSString stringWithFormat:@""];
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == 1)
    {
        if (row == 0 )
        {
            UIView *myPicView = [UIView new];
            UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"diamonds.png"]];
            [myImageView setFrame:CGRectMake(0, 0, 25, 25)];
            
            [myPicView addSubview:myImageView];
            return myPicView;
        }
        else if(row == 1)
        {
            UIView *myPicView = [UIView new];
            UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clubs.png"]];
            [myImageView setFrame:CGRectMake(0, 0, 25, 25)];
            
            [myPicView addSubview:myImageView];
            return myPicView;
        }
        else if(row == 2)
        {
            UIView *myPicView = [UIView new];
            UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hearts.png"]];
            [myImageView setFrame:CGRectMake(0, 0, 25, 25)];
            
            [myPicView addSubview:myImageView];
            return myPicView;
        }
        else
        {
            UIView *myPicView = [UIView new]; //Set desired frame.
            UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spades.png"]];
            [myImageView setFrame:CGRectMake(0, 0, 30, 30)];
            [myPicView addSubview:myImageView];
            return myPicView;
        }
    }
    else
    {
        if (row == 0)
        {
            UIView *myPicView = [UIView new];
            
            UILabel *mytext = [[UILabel alloc] init];
            mytext.text =  [NSString stringWithFormat:@"Ace of"];
            [mytext setFrame:CGRectMake(60,0,80,30)];
            [myPicView addSubview:mytext];
            return myPicView;
        }
        else if (row < 10)
        {
            UIView *myPicView = [UIView new];
            
            UILabel *mytext = [[UILabel alloc] init];
            mytext.text = [NSString stringWithFormat:@"%li of", row + 1];
            [mytext setFrame:CGRectMake(60,0,80,30)];
            [myPicView addSubview:mytext];
            return myPicView;
        }
        else if (row == 10)
        {
            UIView *myPicView = [UIView new];
            
            UILabel *mytext = [[UILabel alloc] init];
            mytext.text = [NSString stringWithFormat:@"Jack of"];
            [mytext setFrame:CGRectMake(60,0,80,30)];
            [myPicView addSubview:mytext];
            return myPicView;
        }
        else if(row == 11)
        {
            UIView *myPicView = [UIView new];
            
            UILabel *mytext = [[UILabel alloc] init];
            mytext.text = [NSString stringWithFormat:@"Queen of"];
            [mytext setFrame:CGRectMake(60,0,80,30)];
            [myPicView addSubview:mytext];
            return myPicView;
        }
        else
        {
            UIView *myPicView = [UIView new];
            
            UILabel *mytext = [[UILabel alloc] init];
            mytext.text = [NSString stringWithFormat:@"King of"];
            [mytext setFrame:CGRectMake(60,0,80,30)];
            [myPicView addSubview:mytext];
            return myPicView;
        }
    }
    for(NSMutableArray *oldcard in self.allguessed)
    {
        if (row == [oldcard[0] integerValue])
    {
        
            UIView *myPicView = [UIView new];
            return myPicView;
    }
        else if(row == 1)
        {
            UIView *myPicView = [UIView new]; //Set desired frame.
            UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clubs.png"]];
            [myImageView setFrame:CGRectMake(0, 0, 25, 25)];
            
            [myPicView addSubview:myImageView];
            return myPicView;
        }
    }
}


-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[SecondViewController class]]){
        SecondViewController *svc = (SecondViewController *) viewController;
        svc.card = self.card; svc.numGuesses += 1;
        self.guessedcard = [NSMutableArray array];
        NSInteger cardnum = [self.myPicker selectedRowInComponent:0];
        NSInteger cardsuite  = [self.myPicker selectedRowInComponent:1];
        [self.guessedcard addObject: [NSNumber numberWithInt: cardnum]];
        [self.guessedcard addObject: [NSNumber numberWithInt: cardsuite]];
        [self.allguessed addObject:self.guessedcard];
        svc.guessedcard = self.guessedcard;
        [svc viewDidLoad];
    }
    else if ([viewController isKindOfClass:[ThirdViewController class]]){
        ThirdViewController *tvc = (ThirdViewController *) viewController;
        tvc.card = self.card; tvc.numGuesses = self.numGuesses + 1;
        self.guessedcard = [NSMutableArray array];
        NSInteger cardnum = [self.myPicker selectedRowInComponent:0];
        NSInteger cardsuite  = [self.myPicker selectedRowInComponent:1];
        [self.guessedcard addObject: [NSNumber numberWithInt: cardnum]];
        [self.guessedcard addObject: [NSNumber numberWithInt: cardsuite]];
        tvc.guessedcard = self.guessedcard;
    }
    return TRUE;
}


@end

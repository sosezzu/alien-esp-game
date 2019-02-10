//
//  GameData.h
//  AlienESP
//
//  Created by Sophia Setsu on 3/25/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>
@property (assign, nonatomic) int lowScore;
-(void)save;+(instancetype)sharedGameData;
@end

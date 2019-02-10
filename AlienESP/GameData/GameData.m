//
//  GameData.m
//  AlienESP
//
//  Created by Sophia Setsu on 3/25/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "GameData.h"
@interface GameData()
@end

@implementation GameData
static NSString* const SSGameDataLowScoreKey = @"lowScore";

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeDouble:self.lowScore forKey: SSGameDataLowScoreKey];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)decoder {
    self = [self init];
    if (self) {
        _lowScore = [decoder decodeDoubleForKey: SSGameDataLowScoreKey];
    }
    return self;
}
-(void)save
{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[GameData filePath] atomically:YES];
}
+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}
+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}
+(instancetype)loadInstance
{
    NSData* decodedData = [NSData dataWithContentsOfFile: [GameData filePath]];
    if (decodedData) {
        GameData* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    
    return [[GameData alloc] init];
}
@end

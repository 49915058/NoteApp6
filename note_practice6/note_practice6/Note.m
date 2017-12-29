//
//  Note.m
//  note_practice6
//
//  Created by user37 on 2017/12/29.
//  Copyright © 2017年 user37. All rights reserved.
//

#import "Note.h"

@implementation Note
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageID = [[NSUUID UUID]UUIDString];
        self.imageName = [NSString stringWithFormat:@"%@.jpg",self.imageID];
    }
    return self;
}
-(UIImage*) image {
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:self.imageName];
    return [UIImage imageWithContentsOfFile:filePath];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]) {
        self.text=[aDecoder decodeObjectForKey:@"text"];
        self.imageName=[aDecoder decodeObjectForKey:@"imageName"];
        self.imageID=[aDecoder decodeObjectForKey:@"imageId"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.text forKey:@"text"];
    [aCoder encodeObject:self.imageName forKey:@"imageName"];
    [aCoder encodeObject:self.imageID forKey:@"imageId"];
}
@end

//
//  Note.h
//  note_practice6
//
//  Created by user37 on 2017/12/29.
//  Copyright © 2017年 user37. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface Note : NSObject 
@property NSString * text;
@property NSString * imageID;
@property NSString * imageName;
-(UIImage*) image;
@end

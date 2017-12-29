//
//  NoteViewController.h
//  note_practice6
//
//  Created by user37 on 2017/12/29.
//  Copyright © 2017年 user37. All rights reserved.
//
@protocol NoteViewController
-(void)update;
@end

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "Note.h"
@interface NoteViewController : UIViewController
@property Note* note;
@property id <NoteViewController>delegate;
@end

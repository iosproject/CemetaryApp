//
//  DetailsViewController.h
//  CemeteryApp
//
//  Created by Joshua Lisojo on 11/8/12.
//  Copyright (c) 2012 KeanU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tomb.h"

@interface DetailsViewController : UIViewController
{
    Tomb *selectedTomb;
    NSInteger selectedIndex;
}

@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic, retain) Tomb *selectedTomb;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) IBOutlet UITextField *bornTextField;
@property (strong, nonatomic) IBOutlet UITextField *diedTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *sectionTextField;

@end

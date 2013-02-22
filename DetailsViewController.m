//
//  DetailsViewController.m
//  CemeteryApp
//
//  Created by Joshua Lisojo on 11/8/12.
//  Copyright (c) 2012 KeanU. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize selectedTomb, selectedIndex;
@synthesize scrollView = _scrollView;
@synthesize textView = _textView,
bornTextField = _bornTextField,
diedTextField = _diedTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
    
    [_bornTextField setText:selectedTomb.birthDate];
    [_diedTextField setText:selectedTomb.deathDate];
    [_sectionTextField setText:selectedTomb.section];
    [_ageTextField setText:selectedTomb.years];
    
    
    [_textView setText: [NSString stringWithFormat:@"%@", selectedTomb.epitaph,nil]];
     
    
    
}

// DATE FORMAT
// YYYY-MM-DD

- (void)viewWillAppear:(BOOL)animated
{
    if([selectedTomb.middleName isEqual:nil] || [selectedTomb.middleName isEqual:NULL] || [selectedTomb.middleName isEqualToString:@""])
    {
        if([selectedTomb.middleName length] == 1)
        {
            [selectedTomb.middleName stringByAppendingString:@"."];
        }
        [self setTitle:[NSString stringWithFormat:@"%@ %@", selectedTomb.firstName, selectedTomb.lastName]];
    }
    else
    {
        [self setTitle:[NSString stringWithFormat:@"%@ %@ %@", selectedTomb.firstName, selectedTomb.middleName,selectedTomb.lastName]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
       [super viewDidUnload];
}
@end

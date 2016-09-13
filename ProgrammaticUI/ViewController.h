//
//  ViewController.h
//  ProgrammaticUI
//
//  Created by Jesse Sahli on 7/12/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>


@property (strong, nonatomic) NSMutableArray *capcomChars;
@property (strong, nonatomic) NSMutableArray *nintendoChars;
@property (strong, nonatomic) UISegmentedControl *companyControl;
@property (strong, nonatomic) UIImageView *characterImage;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UIView *cornerSquare;


@end


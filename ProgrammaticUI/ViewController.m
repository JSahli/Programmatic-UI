//
//  ViewController.m
//  ProgrammaticUI
//
//  Created by Jesse Sahli on 7/12/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCharacters];
    [self createPickerView];
    [self createLabelAndImage];
    [self createSegmentControl];
    [self createSquare];
    self.companyControl.selectedSegmentIndex = 0;
}



- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    // Code here will execute before the rotation begins.
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Place code here to perform animations during the rotation.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice]orientation];
        if (UIDeviceOrientationIsLandscape(orientation)) {
            self.cornerSquare.frame = CGRectMake(680, 360, 20, 20);
        } else {
            self.cornerSquare.frame = CGRectMake(360, 680, 20, 20);
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)createSquare {
    self.cornerSquare = [[UIView alloc]initWithFrame:CGRectMake(360, 680, 20, 20)];
    self.cornerSquare.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.cornerSquare];
}



-(void)createLabelAndImage {
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x - 100, 30, 220, 60)];
    self.nameLabel.text = @"Choose a Character!";
    self.nameLabel.font = [UIFont fontWithName:@"Futura" size:20];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.nameLabel];
    self.characterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 300)];
    self.characterImage.center = self.view.center;
    self.characterImage.image = [UIImage imageNamed:@"QuestionMark.png"];
    self.characterImage.frame = CGRectOffset(self.characterImage.frame, 0, -80);
    [self.view addSubview:self.characterImage];
}



-(void)createSegmentControl {
    
    self.companyControl = [[[UISegmentedControl alloc] initWithFrame:self.pickerView.frame] initWithItems:[NSArray arrayWithObjects:@"Nintendo",@"Capcom", nil]];
    self.companyControl.frame = CGRectOffset(self.companyControl.frame, 50, -20);
    [self.companyControl setBackgroundColor:[UIColor redColor]];
    [self.companyControl addTarget:self action:@selector(pushSegCtrl) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.companyControl];
}



-(void)pushSegCtrl {
    
    [self.pickerView reloadAllComponents];
    self.nameLabel.text = @"Choose a Character!";
     self.characterImage.image = [UIImage imageNamed:@"QuestionMark.png"];
}



-(void)createCharacters {

    self.nintendoChars = [[NSMutableArray alloc]init];
    Character *dK = [[Character alloc]initWithName:@"Donkey Kong" imageString:@"NCDonkeyKong.png"];
    [self.nintendoChars addObject:dK];
    Character *mario = [[Character alloc]initWithName:@"Mario" imageString:@"NCMario.png"];
    [self.nintendoChars addObject:mario];
    Character *kirby = [[Character alloc]initWithName:@"Kirby" imageString:@"NCKirby.png"];
    [self.nintendoChars addObject:kirby];
    Character *link = [[Character alloc]initWithName:@"Link" imageString:@"NCLink.png"];
    [self.nintendoChars addObject:link];
    
    self.capcomChars = [[NSMutableArray alloc]init];
    Character *megaMan = [[Character alloc]initWithName:@"Mega Man" imageString:@"CCMegaMan.png"];
    [self.capcomChars addObject:megaMan];
    Character *akuma = [[Character alloc]initWithName:@"Akuma" imageString:@"CCAkuma.gif"];
    [self.capcomChars addObject:akuma];
    Character *jill = [[Character alloc]initWithName:@"Jill Valentine" imageString:@"CCJillVal.png"];
     [self.capcomChars addObject:jill];
    Character *arthur = [[Character alloc]initWithName:@"Arthur" imageString:@"CCArthur.png"];
     [self.capcomChars addObject:arthur];
}



-(void)createPickerView {
    
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(self.view.center.x -120, 520, 240, 180)];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    self.pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:self.pickerView];
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.companyControl.selectedSegmentIndex == 1) {
        return self.capcomChars.count;
    } else {
         return self.nintendoChars.count;
    }
}



- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    Character *character = [[Character alloc]init];
    if (self.companyControl.selectedSegmentIndex == 1) {
        character = self.capcomChars[row];
    } else {
        character = self.nintendoChars[row];
    }
    
    return character.name;
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    Character *character = [[Character alloc]init];
    if (self.companyControl.selectedSegmentIndex == 1) {
        character = self.capcomChars[row];
    } else {
        character = self.nintendoChars[row];
    }

    self.nameLabel.text = [NSString stringWithFormat:@"You picked %@!",character.name];
    self.characterImage.image = [UIImage imageNamed:character.imageString];
    self.characterImage.contentMode = UIViewContentModeScaleAspectFit;
}


@end

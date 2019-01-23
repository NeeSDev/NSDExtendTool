//
//  ViewController.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/18.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "ViewController.h"
#import "NSDExtendTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)testClicked:(id)sender {
    [UIAlertController AlertWithTips:@"你好" Tag:self];
}

@end

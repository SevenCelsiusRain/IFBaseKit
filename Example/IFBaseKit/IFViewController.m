//
//  IFViewController.m
//  IFBaseKit
//
//  Created by 张高磊 on 01/04/2022.
//  Copyright (c) 2022 张高磊. All rights reserved.
//

#import "IFViewController.h"
#import "IFTestCollectionController.h"

@interface IFViewController ()

@end

@implementation IFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
	// Do any additional setup after loading the view, typically from a nib.
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupViews {
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton setTitle:@"测试" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonAction) forControlEvents:UIControlEventTouchUpInside];
    testButton.backgroundColor = UIColor.grayColor;
    testButton.frame = CGRectMake(100, 100, 160, 50);
    [self.view addSubview:testButton];
}


- (void)testButtonAction {
    IFTestCollectionController *vc = [[IFTestCollectionController alloc] init];
    [vc setRefreshHeaderAndFooterType:IFTestRefreshTypeGif];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

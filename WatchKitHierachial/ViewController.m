//
//  ViewController.m
//  WatchKitHierachial
//
//  Created by Logesh K on 24/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //To share the content with WatchKit
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendMessageToWatch {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"fromApp",@"Key1", nil];
    [[WCSession defaultSession] sendMessage:dict
                               replyHandler:^(NSDictionary *replyHandler) {
                                   
                               }
                               errorHandler:^(NSError *error) {
                                   
                               }
     ];
}

@end

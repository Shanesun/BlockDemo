//
//  ViewController.m
//  BlockDemo
//
//  Created by Shane on 2018/8/8.
//  Copyright © 2018 Shane. All rights reserved.
//

#import "ViewController.h"

typedef void(^blk_t)(id obj);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchObject];
    
}

- (id)getBlockArray {
    int val = 10;
    return [[NSArray alloc] initWithObjects:^{NSLog(@"block0:%d",val);},
            ^{NSLog(@"block1:%d",val);}, nil];
}

- (void)fetchObject {
    blk_t blk;
    {
        id array = [[NSMutableArray alloc] init];
        blk = [^(id obj){
            [array addObject:obj];
            NSLog(@"array count = %ld", [array count]);
        } copy];
    }
    
    blk([[NSObject alloc] init]);
    blk([[NSObject alloc] init]);
    blk([[NSObject alloc] init]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

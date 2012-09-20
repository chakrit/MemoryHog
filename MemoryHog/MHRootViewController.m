//
//  MHRootViewController.m
//  MemoryHog
//
//  Created by Chakrit Wichian on 9/20/12.
//  Copyright (c) 2012 Oozou Ltd.,. All rights reserved.
//

#import "MHRootViewController.h"


#define HOG_AMOUNT 32
#define HOG_SIZE 1024 * 1024


@implementation MHRootViewController {
    NSMutableArray *_hog;
    NSTimer *_timer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _hog = [[NSMutableArray arrayWithCapacity:1024] retain];
        _timer = nil;
    }
    return self;
}


- (void)dealloc {
    [_hog removeAllObjects];
    [_hog release];
    _hog = nil;

    [_timer invalidate];
    [_timer release];
    _timer = nil;
    
    [super dealloc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Memory Hog"];
}

- (void)didReceiveMemoryWarning {
    [self setTitle:@"MEM WARN"];
    [super didReceiveMemoryWarning];
}


- (void)userDidPressHog {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(hog)
                                            userInfo:nil
                                             repeats:YES];
    [_timer retain];
}

- (void)userDidReleaseHog {
    [_timer invalidate];
    [_timer release];
    _timer = nil;
}


- (void)hog {
    for (int i = 0; i < HOG_AMOUNT; i++) {
        void *buffer = malloc(HOG_SIZE);
        NSData *data = [NSData dataWithBytes:buffer length:HOG_SIZE];
        free(buffer);

        [_hog addObject:data];
    }

    [self setTitle:[NSString stringWithFormat:@"Hog: %d objects", [_hog count]]];
}

@end

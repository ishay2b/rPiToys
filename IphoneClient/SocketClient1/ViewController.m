//
//  ViewController.m
//  SocketClient1
//
//  Created by Ishay Tubi on 15/03/2016.
//  Copyright © 2016 magisto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSStreamDelegate>

@end

@implementation ViewController

- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@SERVER, PORT, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
}


- (IBAction)joinChat:(id)sender {
    
    NSString *response  = [NSString stringWithFormat:@"iam:%@", @"AAA.BBB"];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNetworkCommunication];
    [self joinChat:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.h
//  SocketClient1
//
//  Created by Ishay Tubi on 15/03/2016.
//  Copyright © 2016 magisto. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SERVER "192.168.1.20"
#define PORT 9876

@interface ViewController : UIViewController{
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
}

@end


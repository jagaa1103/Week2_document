//
//  ViewController.m
//  TestDocumentFile
//
//  Created by Enkhjargal Gansukh on 14/08/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveImage:(id)sender {
    NSString *imgPath =  [[NSBundle mainBundle] pathForResource:@"img1" ofType:@"jpeg"];
    NSData *imgData = [NSData dataWithContentsOfFile:imgPath];
//    NSLog(@"%@", imgData);
    NSString *saveImagePath = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject].path;
    NSString *path = [saveImagePath stringByAppendingPathComponent:@"image1.jpeg"];
    [imgData writeToFile:path atomically:true];
}
- (IBAction)getImage:(id)sender {
    NSString *imgPath = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject].path;
    NSString *imgPathInDocument = [imgPath stringByAppendingPathComponent:@"image1.jpeg"];
    NSData *imgData = [[NSData alloc] initWithContentsOfFile:imgPathInDocument];
//    NSLog(@"%@", imgData);
    UIImage *thumbNail = [[UIImage alloc] initWithData:imgData];
//    imageView.image = [UIImage imageWithContentsOfFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Filename"]];
    _imgView.image = thumbNail;
}


@end

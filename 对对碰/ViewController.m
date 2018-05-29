//
//  ViewController.m
//  对对碰
//
//  Created by 寂惺 on 2018/5/29.
//  Copyright © 2018年 haha. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray* array = [[NSMutableArray alloc]init];
    for (int i = 0; i<18; i++) {
        int random = arc4random()%9+1;
        //diamond9.png
        NSString* imageName = [NSString stringWithFormat:@"/Users/jixing/Pictures/diamond%d.png",random];
        ImageModel* imageModel = [[ImageModel alloc]init];
        imageModel.imageName = imageName;
        imageModel.imageTag = random;
        [array addObject:imageModel];
        [array addObject:imageModel];
    }
    CGFloat height = self.view.bounds.size.height;
    CGFloat width = self.view.bounds.size.width;
    NSLog(@"%ld",array.count);
    for (int i =0; i<6; i++) {
        for (int j = 0; j<6; j++) {
            int randomFromArray = arc4random()%(array.count);
            ImageModel* imageModel = [array objectAtIndex:randomFromArray];
            [array removeObjectAtIndex:randomFromArray];
            UIImage* image = [UIImage imageNamed:imageModel.imageName];
//            NSLog(@"%d %d %@",i,j,imageName);
//            UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:image forState:UIControlStateNormal];
            btn.frame = CGRectMake(width/60+i*width/6, height/60+j*height/6, width/6-width/30, height/6-height/30);
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = imageModel.imageTag;
            [self.view addSubview:btn];
        }
    }
    
}
-(void) pressBtn:(UIButton*) btn{
    static UIButton* firstBtn = nil;
    if(firstBtn == nil){
        firstBtn = btn;
        btn.enabled = NO;
    }else{
        if(firstBtn.tag == btn.tag){
            NSLog(@"同 %ld %ld",firstBtn.tag,btn.tag);
            firstBtn.hidden = YES;
            btn.hidden = YES;
            firstBtn = nil;
        }else{
            NSLog(@"不同 %ld %ld",firstBtn.tag,btn.tag);
            firstBtn.enabled = YES;
            firstBtn = nil;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

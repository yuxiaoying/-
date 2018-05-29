//
//  ImageModel.h
//  对对碰
//
//  Created by 寂惺 on 2018/5/29.
//  Copyright © 2018年 haha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

{
    
        NSString* _imageName;
        int _imageTag;
    
}
@property (retain,nonatomic)NSString* imageName;
@property (assign,nonatomic)int imageTag;


@end

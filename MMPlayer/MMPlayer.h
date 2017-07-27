//
//  MMPlayer.h
//  PracticeKit
//
//  Created by 李晓东 on 2017/7/26.
//  Copyright © 2017年 Xiaodong. All rights reserved.
//

#ifndef MMPlayer_h
#define MMPlayer_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define RGBA(r,g,b,a)                   [UIColor colorWithRed:r/255.f, green:g/255.f blue:b/255.f alpha:a]

#define MMPlayerBundlePath(file)        [@"MMPlayer.bundle" stringByAppendingPathComponent:file]
#define MMPlayerFrameworkPath(file)     [@"Frameworks/MMPlayer.framework/MMPlayer.bundle" stringByAppendingPathComponent:file]
#define MMPlayerImage(file)             [UIImage imageNamed:MMPlayerBundlePath(file)] ?: [UIImage imageNamed:MMPlayerFrameworkPath(file)]
#define MMPlayerShared                  [MMBrightnessView sharedBrightnessView]

#define MMPlayerOrientationIsLandscape  UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)

#define MMPlayerOrientationIsPortrait   UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)


#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH                    [UIScreen mainScreen].bounds.size.width
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT                   [UIScreen mainScreen].bounds.size.height
#endif

static NSString *const MMPlayerContentOffset = @"contentOffset";

#endif /* MMPlayer_h */
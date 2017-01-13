//
//  Kodimacros.h
//  ctrlable
//
//  Created by Ronald In 't Velt on 29/09/15.
//  Copyright (c) 2015 WaveSquare. All rights reserved.
//

#ifndef ctrlable_Kodimacros_h
#define ctrlable_Kodimacros_h

/*
 *  System Versioning Preprocessor Macros
 */

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

#define APP_TINT_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]
//#define APP_TINT_COLOR [UIColor colorWithRed:61.0f/255.0f green:132.0f/255.0f blue:1.0f alpha:1]

#define TINT_COLOR [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:.35f]
//#define TINT_COLOR [UIColor colorWithRed:88.0f/255.0f green:149.0f/255.0f blue:1.0f alpha:1]

#define BAR_TINT_COLOR [UIColor colorWithRed:.1f green:.1f blue:.1f alpha:1]
#define REMOTE_CONTROL_BAR_TINT_COLOR [UIColor colorWithRed:12.0f/255.0f green:12.0f/255.0f blue:15.0f/255.0f alpha:1]
#define IOS6_BAR_TINT_COLOR [UIColor colorWithRed:.14f green:.14f blue:.14f alpha:1]
#define SLIDER_DEFAULT_COLOR [UIColor colorWithRed:87.0f/255.0f green:158.0f/255.0f blue:186.0f/255.0f alpha:1]

#define STACKSCROLL_WIDTH 476

#define PHONE_TV_SHOWS_BANNER_HEIGHT 61
#define PHONE_TV_SHOWS_POSTER_HEIGHT 76

#define PHONE_TV_SHOWS_BANNER_WIDTH 320
#define PHONE_TV_SHOWS_POSTER_WIDTH 53

#define PAD_TV_SHOWS_BANNER_HEIGHT 91
#define PAD_TV_SHOWS_POSTER_HEIGHT 76

#define PAD_TV_SHOWS_BANNER_WIDTH STACKSCROLL_WIDTH
#define PAD_TV_SHOWS_POSTER_WIDTH 53

#define PAD_MENU_HEIGHT 50.0f
#define PAD_MENU_INFO_HEIGHT 18.0f

#endif

//
//  Logger.h
//  ZPanel
//
//  Created by Ronald In 't Velt on 4/30/13.
//
//

#import <Foundation/Foundation.h>

#define MAXLOGSIZE 1500000

#ifdef NDEBUG
#define DebugLog(...)
#else
//#define DebugLog NSLog
void DebugLog (NSString *message);
#endif

#define LOG_LOW 1
#define LOG_MED 2
#define LOG_HIGH 3

#define LOG_MIN 2

void MyLog(NSString *format, ...);
void WriteLog(int logLevel, NSString *format, ...);
void WriteToLog (NSString *format, va_list args);

NSString *MyLocalizedString(NSString *key, NSString *comment);

@interface Logger : NSObject

@end
 
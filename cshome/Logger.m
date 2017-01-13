//
//  Logger.m
//  ZPanel
//
//  Created by Ronald In 't Velt on 4/30/13.
//
//

#import "Logger.h"
#ifndef TARGET_IS_EXTENSION
#import "AppDelegate.h"
#endif


#ifdef DEBUG
void DebugLog (NSString *message)
{
    NSLog(@"%@",message);
}
#endif

void WriteLog(int logLevel, NSString *format, ...)
{
    if (logLevel >= LOG_MIN)
    {
        va_list args;
        va_start(args, format);
        WriteToLog(format, args);
        va_end(args);
    }
}

void MyLog (NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    WriteToLog(format, args);
    va_end(args);
}


void WriteToLog (NSString *format, va_list args)
{
    @autoreleasepool
    {
        NSString *message = nil;
        message = [[NSString alloc] initWithFormat:format
                                                   arguments:args];
        DebugLog(message);
        
#ifndef TARGET_IS_EXTENSION
        AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        if ([mainDelegate loggingIsEnabled])
        {
        
            if (mainDelegate.logString.length > MAXLOGSIZE)
            {
                mainDelegate.logString = [mainDelegate.logString substringFromIndex:MAXLOGSIZE/5];
            }
            mainDelegate.logString = [mainDelegate.logString stringByAppendingFormat:@"%@\r\n", message];
        }
#endif
    }
}


NSString *MyLocalizedString(NSString *key, NSString *comment)
{
    NSString *s = NSLocalizedString(key, comment);
    s = [s stringByReplacingOccurrencesOfString:@"Vera" withString:@"Ctrlable"];
    s = [s stringByReplacingOccurrencesOfString:@"Squeezebox" withString:@"ctrlableTunes"];
    s = [s stringByReplacingOccurrencesOfString:@"Kodi" withString:@"ctrlableMedia"];
    s = [s stringByReplacingOccurrencesOfString:@"MiOS" withString:@"Ctrlable"];
    s = [s stringByReplacingOccurrencesOfString:@"MIOS" withString:@"Ctrlable"];
    return s;
}

@implementation Logger

@end

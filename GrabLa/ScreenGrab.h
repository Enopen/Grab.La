//
//  ScreenGrab.h
//  GrabLa
//
//  Created by Fergus Morrow on 25/06/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/* Check out the awesome "Son of Grab" example at Apple for
 * advanced Screencapture features if they're required later */

/**
 As of Version 1 this class is empty of members, apart from a method to get a screenshot.
 @auther Fergus Morrow fergus@enopen.co.uk
 */
@interface ScreenGrab : NSObject {

}

/**
 This method takes a screenshot.
 @returns An NSBitmapRep of the screenshot.
*/
-(NSBitmapImageRep *) getScreenshot;
//-(NSImage) getWindowshot;			//implement when required.

@end

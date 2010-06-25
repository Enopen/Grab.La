//
//  ScreenGrab.m
//  GrabLa
//
//  Created by Fergus Morrow on 25/06/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScreenGrab.h"


@implementation ScreenGrab

/* This grabs a simple screenshot */
-(NSBitmapImageRep *) getScreenshot{
	CGImageRef screenShot = CGWindowListCreateImage(CGRectInfinite, kCGWindowListOptionOnScreenOnly, kCGNullWindowID, kCGWindowImageDefault);
	NSBitmapImageRep *bitmap = [[[NSBitmapImageRep alloc] initWithCGImage:screenShot] autorelease];
	CGImageRelease(screenShot);	
	return bitmap;
}

/* Implement a simple window shot
 *
 -(CGImageRef) getWindowshot{
 
 
 }*/

@end
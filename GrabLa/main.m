//
//  main.m
//  GrabLa
//
//  Created by Fergus Morrow on 06/06/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#define _plist_SETTINGS_ @""
#define _GRABLA_VERSION_ @"v0.1 BETA"

#import <Cocoa/Cocoa.h>

#include "InvisiView.h"

/* main()
 * Just declare an Invisiview
 */
int main(int argc, char *argv[]){
	
	[NSApplication sharedApplication];
	NSAutoreleasePool *autoPool = [[NSAutoreleasePool alloc] init];
	
	/* Declare a InvisiView and register it to pick up dragged files */
	InvisiView *view = [[[InvisiView alloc] init] autorelease];

 	[NSApp run];
	[autoPool release];
}



/*
 * check for .plist file 
 */
//	NSString *path = [[NSBundle mainBundle] bundlePath];
//	NSString *finalPath = [path stringByAppendingPathComponent:@"User.plist"];
//	NSDictionary *plistData = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];

//	if( [NSFileManager fileExistsAtPath:plistData] ){
/*
 * Read input; else run first-run wizard
 */
//			NSString *url	= [NSString stringWithFormat:@"v%@", [plistData objectForKey:@"Server"]];;
//			NSString *user	= [NSString stringWithFormat:@"v%@", [plistData objectForKey:@"Username"]];;
//			NSString *pass	= [NSString stringWithFormat:@"v%@", [plistData objectForKey:@"Password"]];;
//			} else /* first run wizard call here! */;

/*
 * Start status bar app
 */

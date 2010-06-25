//
//  InvisiView.m
//  GrabLa
//
//  Created by Fergus Morrow on 09/06/2010.
//  Copyright 2010 http://www.grabla.com All rights reserved.
//
//	Licensed under the GNU LPGPL


#ifndef _INVISIVIEW_IMPLEM_
#define _INVISIVIEW_IMPLEM_

/*for *login()* */
#define _PASS_DECRYPT_ 1
#define _PASS_HASH_ 2

#import "InvisiView.h"

@implementation InvisiView

/********************************** Initialisation code here ****************************************/

-(id) init{
	[super init];
	
	/* Configure Drag'n'Drop interface */
	[self registerForDraggedTypes: [NSArray arrayWithObject:NSFilenamesPboardType]];
	
	/* Declare an NSStatusItem and configure it for use with InvisiView */
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:22];	
	[statusItem setTitle: NSLocalizedString(@"GrabLa", @"")];
	[statusItem setHighlightMode:YES];
	[statusItem setView:self];

	/* Get User Defaults - done it this way, incase we expand and end up having loootttss of User Defaults*/
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	username = [prefs stringForKey:@"username"];
	passwordhash = [prefs stringForKey:@"password"];
	
	/* Log in */
	if( (username == nil) || (passwordhash == nil) ){
		[self showLogin];
		if( remember == YES){
			/* write user prefs here */	
		}
		[self logIn:username pass:passwordhash typeOfPass:_PASS_DECRYPT_];
	 } else { [self logIn:username pass:passwordhash typeOfPass:_PASS_HASH_]; }

	/* Add hotKey */
	DDHotKeyCenter *hotKey = [[DDHotKeyCenter alloc] init];
	if(![hotKey registerHotKeyWithKeyCode:9 modifierFlags:NSCommandKeyMask target:self action:@selector(hotkeyWithEvent:) object:nil]){
		NSLog(@"Failed to register hotkey");
	} else {
		NSLog(@"hotkey registered!");
	}
	[hotKey release];
	
	return self;
}

/**************************************  HotKey Callback function here **********************************/

-(void) hotkeyWithEvent:(NSEvent *)hkEvent object:(id)anObject{
	NSLog(@"Got hotkey!");
	[self gotScreenRequest];
}


-(void) gotScreenRequest{
	/* Take screenshot */
	NSBitmapImageRep *screencap = [ScreenGrab getScreenshot];
	
	/* Write to temporary file */
	NSData *file = [screencap representationUsingType:NSPNGFileType					//or NSBMPFileType, NSGIFFi.., NSJPEGFi.., NSTIFFFi..
										   properties:[NSDictionary dictionary]];					
	//http://developer.apple.com/mac/library/documentation/cocoa/reference/ApplicationKit/Classes/NSBitmapImageRep_Class/Reference/Reference.html#//apple_ref/doc/constant_group/Bitmap_image_properties
	NSError *err;
	[file writeToFile:@"~/tempScreen.png"		//Should probably randomise this to avoid overwriting existing files
			  options:NSDataWritingAtomic
				error:&err];
	if( err.code != nil ) NSLog:@"Error creating screenshot file."; 			//Debug. Release use NSAlert
	
	/* send file for upload */
	[self uploadFile:@"~/tempScreen.png"];
	
	/* delete */
	[NSFileManager removeItemAtPath:@"~/tempScreen.png" error:&err];
	if( err.code != nil ) NSLog(@"Error removing screenshot file.");				//Debug. Release use NSAlert	
}

/********************************************* File handling methods here ***************************************/

/* This takes the NSArray of files from the drag-n-drop operation */
- (void) gotFiles {
	
	/* If there is more than one file, we zip em up! */
	if( files.count > 1 ){
		[self zipFiles:files];
		return;
	}
	
	/* There is one file, so we call uploadFile - which takes NSString */
	[self uploadFile:[files objectAtIndex:0]];
}

/* This uploads the file to the internet */
- (void) uploadFile:(NSString *)path{
	NSLog(path);
	/*
	 * Awaiting finalisation of the PHP Server App + Debug.
	 *
	 */	
}

/* This creates the .ZIP file, calls uploadFile, then deletes .ZIP file */
- (void) zipFiles:(NSArray *)filelist{
	/* */
	
}


/******************************* GUILogin communication methods here ******************************/
-(void) showLogin{
	[[[GUILogin alloc] initWithParent:self] autorelease];
}
-(void) setRemember:(NSString *)remb{
	remember = remb;
}
-(void) setUsername:(NSString *)user{
	username = user;
}
-(void) setPassword:(NSString *)pass{
	passwordhash = pass;
}

- (void) logIn:(NSString *)user pass:(NSString *)pass typeOfPass:(int)type{
	/*
	 * To be implemented once the PHP Server Application is debugged and finalised.
	 */
}

/******************************* NSView Sub-classing methods here *********************************/
/* Automagically called when the user drags something onto the NSView   *
 * This copies the NSPasteBoard entry for whatever the user has dropped */
- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
	
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
	
	/* Ensure that it is a File that has been dropped */
    if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
 		files = [pboard propertyListForType:NSFilenamesPboardType];
		[self gotFiles];
	}
	
	/* If its not a file we're not interested! */
    return NSDragOperationNone;
}

/* Detect a right click and bring up GUILogin.xib */
- (void)rightMouseDown:(NSEvent *)theEvent{
	MainWindow *main = [[[MainWindow alloc] init] autorelease];
}

/* drawRect() has to be implemented to sub-class NSView */
- (void) drawRect:(NSRect)rect {
	[[NSColor blackColor] set];
	NSRectFill(rect);
}

/****************************** ZipArchiveDelegate ******************************/
-(void) ErrorMessage:(NSString*) msg{
	/* We will use a NSAlert for the release code */
	NSLog(msg);
}

@end

#endif
//
//  InvisiView.h
//  GrabLa
//
//  Created by Fergus Morrow on 09/06/2010.
//  Copyright 2010 http://www.grabla.com All rights reserved.
//
//	Licensed under the GNU LPGPL

#ifndef _INVISIVIEW_HEADER_
#define _INVISIVIEW_HEADER_

#import "GUILogin.h"
#import "MainWindow.h"

#import "DDHotKeyCenter.h"
#import "ScreenGrab.h"
#import "ZipArchive.h"


#import <Cocoa/Cocoa.h>

/**
 Class contains initialisation code, drag-and-drop features and event handling.
 @auther Fergus Morrow fergus@enopen.co.uk
 */
@interface InvisiView : NSView
<ZipArchiveDelegate>{
	NSStatusItem *statusItem;		/**<  NSStatusItem object which Grabla is based around */
	NSArray *files;					/**<  NSArray to store a list of files thats dragged/dropped */
	
	/* authentication variables */
	NSString *authtoken;			/**< NSString storing the authentication token from the PHP server app */
	NSString *username;				/**< NSString storing the user's username */
	NSString *passwordhash;			/**< NSString storing a hash of the user's password */
	bool remember;					/**< Boolean value storing whether the user wishes to have his login credentials stored or not */
	
}

/* ZipArchiveDelegate method - we wont doxygen this yet, until
 * I doxygen the whole ZipArchive code and upstream it to google code */

/* Error handler */
-(void) ErrorMessage:(NSString *) msg;

/**
 Is called when the user presses the screenshot hotkey by the event handler. (hotKeyCallback)
 */

- (void) gotScreenRequest;

/**
 Is a required method for the Drag and Drop functionality. It is called when a Draggig Operation enters the NSStatusItem.
 @param sender - the sender of the operation.
 @returns No return value.
 */
- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender;

/**
 Logs the user in with the remote PHP server
 @param user the username to authenticate with
 @param pass the password to authenticate with (either plain text, or its hash)
 @param type either _PASS_DECRYPT_ or _PASS_HASH_
 */
- (void) logIn:(NSString *)user pass:(NSString *)pass typeOfPass:(int)type;

/**
 Shows the Login GUI window (GUILogin.xib).
 @returns No return value.
 */
- (void) showLogin;

/**
 Takes an NSArray of NSFilenamesPboardType when a drag-and-drop operation occurs.
 @returns No return value.
 */
- (void) gotFiles;

/**
 Creates a .zip archive from an NSArray of files.
 @param filelist - The NSArray of files to be zipped.
 @returns No return value.
 */
- (void) zipFiles:(NSArray *)filelist;

/**
 Uploads the file to our PHP server application.
 @param path An NSString  to the path of the file
 @returns No return value.
 */
- (void) uploadFile:(NSString *)path;

/**
 Initialisation code - sets up the NSStatusBarItem, configures Drag-n-Drop, calls the Carbon code for HotKeys..
 @returns An instance of itself.
 */
- (id) init;

@end

#endif
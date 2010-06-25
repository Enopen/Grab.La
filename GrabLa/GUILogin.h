//
//  GUILogin.h
//  GrabLa
//
//  Created by Fergus Morrow on 09/06/2010.
//  Copyright 2010 http://www.grabla.com All rights reserved.
//
//	Licensed under the GNU LPGPL


#ifndef _GUILOGIN_HEADER_
#define _GUILOGIN_HEADER_


#import <Cocoa/Cocoa.h>

/* Corresponding nib file: GUILogin.xib */

/**
 The small login dialog that is displayed when a members user details are not stored.
 @auther Fergus Morrow fergus@enopen.co.uk
 */
@interface GUILogin : NSWindow {
	/* The only three controls on the xib, minus the NSButton */
	IBOutlet NSTextField			*username; /**< NSTextField storing the username */
	IBOutlet NSSecureTextField		*password; /**< NSSecureTextField storing the password */
	IBOutlet NSButton				*remember; /**< NSButton which is actually a Check Box, asking if the user wants their details remembered. */
	
	id owner;	/**< An instance of the class (InvisiView) which called this object */
}

/**
 Is called when a user clicks the "login button" - throws the users details back to the "owner" object.
 */
-(IBAction) logIn:(id)sender;			// Called on button click

/**
 This instantiates the object, opens the nib file and sets it's "owner" object.
 */
-(id) initWithParent:(id)parent;		// Initialisation Code

@end

#endif
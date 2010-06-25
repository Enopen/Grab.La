//
//  GUILogin.m
//  GrabLa
//
//  Created by Fergus Morrow on 09/06/2010.
//  Copyright 2010 http://www.grabla.com All rights reserved.
//
//	Licensed under the GNU LPGPL


#ifndef _GUILOGIN_IMPLEM_
#define _GUILOGIN_IMPLEM_


#import "GUILogin.h"


@implementation GUILogin

/********************************************** Initialisation Code ***************************************/
- (id) initWithParent:(id)parent{
	[super init];
	owner = parent;
	[NSBundle loadNibNamed:@"GUILogin" owner:self];
	return self;
}

/********************************************** Button Handler ********************************************/
-(IBAction) logIn:(id)sender {
	
	/* Check the state of the "Remember Me" button */
	bool option;
	if([remember state] == NSOnState) option = YES;
	else if([remember state] != NSOnState) option = NO; 
	
	/* Set the variables back at InvisiView */
	[owner setPassword: [password stringValue]];
	[owner setUsername: [username stringValue]];
	[owner setRemember:option];
	
}




@end

#endif
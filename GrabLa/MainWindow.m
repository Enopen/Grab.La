//
//  MainWindow.m
//  GrabLa
//
//  Created by Fergus Morrow on 09/06/2010.
//  Copyright 2010 http://www.grabla.com All rights reserved.
//
//	Licensed under the GNU LPGPL


#import "MainWindow.h"


@implementation MainWindow

-(IBAction) loadTab:(id)sender{
	NSString *ident = [sender itemIdentifier];
	[mainView selectTabViewItemAtIndex:[tabs indexOfObject:ident]];	
}


/******************************************** Initialisation Code *************************************/
-(id) init{
	[super init];
	[NSBundle loadNibNamed:@"MainWindow" owner:self];
	[mainView selectTabViewItemAtIndex:0];
	tabs = [NSArray arrayWithObjects:@"gen", @"acc", @"fil", @"upd", @"sup", nil];
	return self;
}

-(IBAction) sendSupport:(id)sender{}

-(IBAction) upgrade:(id)sender{}

-(IBAction) changePass:(id)sender{}
@end

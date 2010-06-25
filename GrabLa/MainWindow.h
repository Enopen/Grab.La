//
//  GUIHistory.h
//  GrabLa
//
//  Created by Fergus Morrow on 09/06/2010.
//  Copyright 2010 http://www.grabla.com All rights reserved.
//
//	Licensed under the GNU LPGPL

#import <Cocoa/Cocoa.h>

/* Corresponding xib file: MainWindow.xib */

/**
 The "MainWindow" - where the user can select preferences, file bug reports, check for updates etc. All members marked one require a connection to the server to populate.
 @auther Fergus Morrow fergus@enopen.co.uk
 */
@interface MainWindow : NSWindow
<NSTabViewDelegate>{

	IBOutlet NSTabView *mainView; /**< The main TabView - where the TabViewItems are displayed for each preference view */
	NSArray *tabs;
	/* general */
	
	
	/* account */
	IBOutlet NSTextField *username;		/**< The username (1) */
	IBOutlet NSTextField *email;		/**< The user's email address (1) */
	IBOutlet NSTextField *quota;		/**< The user's file quota (1) */
	IBOutlet NSTextField *files;		/**< The user's amount of files (1) */
	IBOutlet NSTextField *downloads;	/**< The number of downloads the users file's have got (1) */
	IBOutlet NSTextField *popular;		/**< The most popular upload the user has posted (1) */
	IBOutlet NSTextField *dunno;
	
	/* files */
	IBOutlet NSTableView *fileHistory;		/**< A table of the user's past downloads (1) */
	IBOutlet NSScrollView *fileScroller;	/**< A NSScrollView encapsulating fileHistory (1) */
	
	/* updates */
	IBOutlet NSImageView *status;		/**< An ImageView - image provided by the server depending on if their upto date (1) */
	IBOutlet NSTextField *isAvailable;	/**< A label telling the user if their up to date or not (1) */
	IBOutlet NSTextField *updateDesc;	/**< A TextField allowing the user to see a description of the update (1) */
	
	/* support */
	IBOutlet NSPopUpButton *menu;		/**< PopUpButton (Menu) allowing the user to select what kind of issue */
	IBOutlet NSTextField *title;		/**< A text field allowing the user to input a title to their query */
	IBOutlet NSTextField *description;	/**< A text field allowing the user to describe their query */
}

/**
 The initialiser - just runs the nib file (MainWindow)
 */
-(id) init;

/**
 Sends a support query. (support.php)
 */
-(IBAction) sendSupport:(id)sender;

/**
 Allows the user to download the upgrade. (upgrade.php)
 */
-(IBAction) upgrade:(id)sender;

/**
 Allows the user to change their password.
 */
-(IBAction) changePass:(id)sender;

/**
 Every NSToolbarItem goes to this, it acts upon the NSToolbarItem's identifier and changes the active NSTabViewItem.
 */
-(IBAction) loadTab:(id)sender;

/****************************** NSTableViewDelegate Methods ******************************/

@end

//
//  ZipArchive.h - (http://code.google.com/p/ziparchive/)  
//
//  Created by aish on 08-9-11. (acsolu@gmail.com) 
//  Copyright 2008  Under the MIT License. (http://www.opensource.org/licenses/mit-license.php)
//
//  This is a FORK of the above project, used for the purposes of (http://www.grabla.com) - 
//  all specific modifications to this code have been carried out by Fergus Morrow for Grabla.
//
//  Any and/or all modifications relating to the below subjects will be contributed upstream to the
//  original project out of gratitude and respect:
//  a) Bugs
//  b) Performance
//  c) Functionality (non project specific)


//#import <UIKit/UIKit.h>

#include "minizip/zip.h"
#include "minizip/unzip.h"


@protocol ZipArchiveDelegate <NSObject>
@optional
-(void) ErrorMessage:(NSString*) msg;
-(BOOL) OverWriteOperation:(NSString*) file;

@end


@interface ZipArchive : NSObject {
@private
	zipFile		_zipFile;
	unzFile		_unzFile;
	
	NSString*   _password;
	id			_delegate;
}

@property (nonatomic, retain) id delegate;

-(BOOL) CreateZipFile2:(NSString*) zipFile;
-(BOOL) CreateZipFile2:(NSString*) zipFile Password:(NSString*) password;
-(BOOL) addFileToZip:(NSString*) file newname:(NSString*) newname;
-(BOOL) CloseZipFile2;

-(BOOL) UnzipOpenFile:(NSString*) zipFile;
-(BOOL) UnzipOpenFile:(NSString*) zipFile Password:(NSString*) password;
-(BOOL) UnzipFileTo:(NSString*) path overWrite:(BOOL) overwrite;
-(BOOL) UnzipCloseFile;
@end

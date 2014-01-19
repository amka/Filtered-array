//
//  AppDelegate.h
//  RebelTest
//
//  Created by Andrey M on 19.01.14.
//  Copyright (c) 2014 Andrey M. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate> {
    NSMutableArray *_searchArray;
    NSArray *_filtered;
}

@property NSArray *filtered;
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSearchField *serachField;
@property (weak) IBOutlet NSTableView *tableView;

@end

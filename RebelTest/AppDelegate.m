//
//  AppDelegate.m
//  RebelTest
//
//  Created by Andrey M on 19.01.14.
//  Copyright (c) 2014 Andrey M. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (id)init {
    self =[super init];
     if (self) {
         _searchArray = [NSMutableArray arrayWithObjects:
                         @{@"title": @"Sleepy Hollow", @"ru": @"Сонная лощина"},
                         @{@"title": @"Black List", @"ru": @"Чёрный список"},
                         @{@"title": @"White Collar", @"ru": @"Белый воротничок"},
                         @{@"title": @"Criminal Minds", @"ru": @"Мыслить как преступник"},
                         @{@"title": @"Suits", @"ru": @"Костюмы"},
                         @{@"title": @"Blue Blood", @"ru": @"Голубая кровь"},
                         nil];
         _filtered = [NSMutableArray arrayWithArray:_searchArray];
     }
     return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
//    PopoverViewController *viewController = [[PopoverViewController alloc] initWithNibName:@"PopoverViewController" bundle:nil];
//    // Insert code here to initialize your application
//    self.rblPopover = [[RBLPopover alloc] initWithContentViewController:viewController];

    
}
- (IBAction)addShow:(id)sender {
    NSButton *button = (NSButton *)sender;
    NSLog(@"Add show %@", [[_filtered objectAtIndex:[_tableView rowForView:button.superview]] valueForKey:@"title"]);
}

- (IBAction)searchName:(id)sender {
    if (_filtered != nil) {
        _filtered = nil;
    }
    
    if ([[_serachField stringValue] isEqualToString:@""]) {
        
        _filtered = [NSMutableArray arrayWithArray:_searchArray];
        return [_tableView reloadData];;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(%K CONTAINS[cd] %@) or (%K CONTAINS[cd] %@)", @"title", [_serachField stringValue], @"ru", [_serachField stringValue]];
    _filtered = [NSMutableArray arrayWithArray:[_searchArray filteredArrayUsingPredicate:predicate]];
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [_filtered count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *tableCellView = [tableView makeViewWithIdentifier:@"tableView" owner:self];
    
    [[tableCellView viewWithTag:0] setStringValue:[[_filtered objectAtIndex:row] valueForKey:@"title"]];
    [[tableCellView viewWithTag:1] setStringValue:[[_filtered objectAtIndex:row] valueForKey:@"ru"]];
    return tableCellView;
}

@end

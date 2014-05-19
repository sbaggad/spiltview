//
//  ViewController.h
//  SplitView
//
//  Created by Shona Baggad on 03/02/14.
//  Copyright (c) 2014 HTECH-008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSMutableArray *arrBankArray;
     BOOL isSearchActive;
}
@property (retain, nonatomic) IBOutlet UITableView *tblSplitView;
@property (retain, nonatomic) IBOutlet UIView *viewForCell;
@property (retain, nonatomic) IBOutlet UILabel *lblView;
@property (retain, nonatomic) IBOutlet UIView *viewForsumcell;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) NSMutableArray *filteredTableArray,*arrBankArray;

@end

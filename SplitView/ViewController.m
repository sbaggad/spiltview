//
//  ViewController.m
//  SplitView
//
//  Created by Shona Baggad on 03/02/14.
//  Copyright (c) 2014 HTECH-008. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize arrBankArray,filteredTableArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrBankArray =[[NSMutableArray alloc]initWithObjects:@"SBI",@"PNB",@"Canera Bank",@"Dena Bank",@"UBI",@"Sindh Band",@"ICICI",@"UCO Bank",@"Kotak Bank",@"Oriental Bank", nil];
    self.filteredTableArray=[[NSMutableArray alloc]initWithArray:arrBankArray];
    NSLog(@"%@",filteredTableArray);
//    self.tblSplitView.scrollEnabled=NO;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Hello sona you have selected =%d ",indexPath.row);
    if ((indexPath.row)%2==0) {
        
        [self.viewForsumcell setFrame:CGRectMake(147, 0, 173, 416)];
        [self.view addSubview:self.viewForsumcell];
        self.lblView.text=[NSString stringWithFormat:@"You have selected %d",indexPath.row
                           ];
    }else{
        [self.viewForsumcell removeFromSuperview];
        
        self.viewForCell.backgroundColor=[UIColor greenColor];
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",[self.filteredTableArray objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text=@"Sona";
        
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.filteredTableArray count];
    
}

- (void)dealloc {
    [_tblSplitView release];
    [_viewForCell release];
    [_lblView release];
    [_viewForsumcell release];
    [_searchBar release];
    [super dealloc];
}
#pragma mark - SearchBar Delegate Method

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    isSearchActive=true;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    isSearchActive=false;
    [searchBar resignFirstResponder];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    isSearchActive=FALSE;
    [searchBar resignFirstResponder];
    [self.filteredTableArray removeAllObjects];
    for (NSString *element in arrBankArray) {
        [self.filteredTableArray addObject:element];
    }
    [self.tblSplitView reloadData];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    if(searchText.length==0)
    {
        
        isSearchActive=false;
        [self.filteredTableArray removeAllObjects];
        self.filteredTableArray=[[NSMutableArray alloc]init];
        for (NSString *element in arrBankArray) {
            [self.filteredTableArray addObject:element];
        }
        [self.tblSplitView reloadData];
        [self.tblSplitView resignFirstResponder];
        [searchBar performSelector: @selector(resignFirstResponder)
                        withObject: nil
                        afterDelay: 0.1];
        
        
    }else
    {
        isSearchActive=TRUE;
        [self.filteredTableArray removeAllObjects];
        self.filteredTableArray =[[NSMutableArray alloc]init];
        
        for (NSString *rec in arrBankArray)
        {
            NSRange strtitlerange=[rec rangeOfString:searchBar.text options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
            if(strtitlerange.location != NSNotFound)
            {
                [self.filteredTableArray addObject:rec];
            }
            
        }
        [self.tblSplitView reloadData];
    }
}


@end

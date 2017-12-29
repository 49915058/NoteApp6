//
//  ListViewController.m
//  note_practice6
//
//  Created by user37 on 2017/12/29.
//  Copyright © 2017年 user37. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController () <UITableViewDataSource,NoteViewController>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray<Note*> *data;
@end

@implementation ListViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //self.data = [NSMutableArray array];
        [self load];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"noteCell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row].text;
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.data removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
}
- (IBAction)add:(id)sender {
    Note *note =[Note new];
    note.text = @"Note";
    [self save];
    [self.data insertObject:note atIndex:0];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:YES];
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"123123123%@",docPath);
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:YES];
    [self.tableView setEditing:editing animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)update {
    [self.tableView reloadData];
    [self save];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if([segue.identifier isEqualToString:@"toNote"]){
        NoteViewController *noteVC=segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        noteVC.note = self.data[indexPath.row];
        noteVC.delegate=self;
}
-(void)save{
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.archive"];
    [NSKeyedArchiver archiveRootObject:self.data toFile:filePath];
}
-(void)load{
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.archive"];
    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if(data){
        self.data = [NSMutableArray arrayWithArray:data];
    }
    else{
        self.data = [NSMutableArray new];
    }
}
@end

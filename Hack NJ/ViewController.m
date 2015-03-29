//
//  ViewController.m
//  Hack NJ
//
//  Created by Alex Cevallos on 3/28/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Issue.h"

@interface ViewController () {
    NSArray *arrayForClass;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *stringConnectingToAPI = @"https://hackjersey-app-server.herokuapp.com/api/bills";
    
    NSURL *urlToConnect = [[NSURL alloc] initWithString:stringConnectingToAPI];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlToConnect];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error == nil){
            arrayForClass = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            NSLog(@"Array: %@", arrayForClass);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        }
        
        
    }];
    
    [task resume];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = arrayForClass[indexPath.row][@"description"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayForClass count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"pushDetail" sender:arrayForClass[indexPath.row]];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [segue.destinationViewController setSwagTest:sender];
}






@end

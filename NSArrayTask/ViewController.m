//
//  ViewController.m
//  NSArrayTask
//
//  Created by lizaveta shulskaya on 12.04.2018.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create NSArray,containing several strings, using literal declaration.
    NSArray *severalStringsArray = @[@"A", @"B", @"C"];
    
    
    // Create mutable array from previously created NSArray.
    NSMutableArray *severalStringsMutableArray2 = [NSMutableArray arrayWithArray:severalStringsArray];
    
    
    // Create an empty array and obtain its first and last element in a safe way.
    NSArray *emptyArray = [[NSArray alloc] init];
    NSLog(@"%@", [emptyArray firstObject]);
    NSLog(@"%@", [emptyArray lastObject]);
    
    
    // Create NSArray, containing strings from 1 to 20.
    NSArray *numbersArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                              @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20"];
    // Get its shallow copy and real deep copy.
    NSArray *shallowCopy = [[NSArray alloc] initWithArray:numbersArray copyItems:NO];
    NSArray *trueDeepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:numbersArray]];
    // Iterate over array and obtain item at index 13. Print an item.
    for (int i = 0; i < numbersArray; i++) {
        if (i == 13) {
            NSLog(@"%@", numbersArray[i]);
        }
    }
    //Make array mutable. Add two new entries to the end of the array, add an entry to the beginning of the array.Iterate over an array and remove item at index 5.
    NSMutableArray *numbersMutableArray = [NSMutableArray arrayWithArray:numbersArray];
    [numbersMutableArray addObject:@"21"];
    [numbersMutableArray addObject:@"22"];
    [numbersMutableArray insertObject:@"0" atIndex:0];
    for(int i = 0; i < numbersMutableArray.count; i++) {
        if (i == 5) {
            [numbersMutableArray removeObjectAtIndex:i];
        }
    }
    NSLog(@"%@", numbersMutableArray);
    
    
    // Create new array of mixed numbers. Sort it in an ascending and descending order.
    NSMutableArray *randomNumbersArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 20; i++){
        int element = arc4random_uniform(100);
        [randomNumbersArray addObject:[NSNumber numberWithInt:element]];
    }
    NSLog(@"%@", randomNumbersArray);
    NSMutableArray *sortedArrayIncrease = [NSMutableArray arrayWithArray:randomNumbersArray];
    [sortedArrayIncrease sortUsingSelector:@selector(compare:)];
    NSLog(@"%@", sortedArrayIncrease);
    NSMutableArray *sortedArrayDecrease = [randomNumbersArray sortedArrayUsingComparator:^NSComparisonResult(id element1, id element2){return [element2 compare: element1];}];
    NSLog(@"%@", sortedArrayDecrease);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

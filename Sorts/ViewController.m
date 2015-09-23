//
//  ViewController.m
//  Sorts
//
//  Created by Abhishek Banthia on 9/22/15.
//  Copyright © 2015 Abhishek Banthia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *unsortedArray = [NSMutableArray arrayWithArray:@[@16, @5, @14, @3, @1]];
    
//    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:@[@14, @17, @33, @39, @102]];
    
    [self mergeSortOnArray:unsortedArray];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)selectionSortOnArray:(NSMutableArray *)array
{
    NSLog(@"Original Array:%@", array);
    
   [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
       NSInteger minimumIndex = idx;
       
       for (NSInteger j = minimumIndex + 1; j < array.count; j++)
       {
           if (array[idx] > array[j]) {
               minimumIndex = j;
           }
       }
       
       [array exchangeObjectAtIndex:idx withObjectAtIndex:minimumIndex];
       
   }];
    
    NSLog(@"Selection sort result:%@", array);
}

/*
 
 Best case is when the array is sorted and the time complexity is O(n)
 Worst case is when the array is reverse sorted and the complexity is o(n^2)
 */

- (void)bubbleSortOnArray:(NSMutableArray *)array
{
    NSLog(@"Original Array:%@", array);
    
    for (int k = 1; k < array.count; k++) //passes always begin with one, dumbass
    {
        /*Worst case is as follows as is O(n^2)
            for (int i = 0; i < array.count - 1; i++)
         */
        
        /*Best case: If array is already sorted, then time complexity is O(n)*/
        int flag = 0;
        
        for (int i = 0; i < array.count - k; i++) //Average Case
        {
            if (array[i] > array[i+1])
            {
                [array exchangeObjectAtIndex:i+1 withObjectAtIndex:i];
                
                flag = 1;
            }
        }
        
        if (flag == 0)
        {
            NSLog(@"Array is already sorted");
            break;
        }
    }
    
    NSLog(@"Bubble sort result:%@", array);
}

-(void)insertionSortOnArray:(NSMutableArray *)array
{
    //Remember the concepts of hole and temp variable value
    
    //Remember the value residing at zero index already is in sorted phase
    
    NSLog(@"Original Array:%@", array);
    
    for (NSInteger i = 1; i < array.count; i++)
    {
        NSNumber *value = array[i];
        NSInteger hole = i;
        

        while (hole > 0 && array[hole - 1] > value)
        {
            [array replaceObjectAtIndex:hole withObject:array[hole - 1]];
            hole = hole - 1;
        }
        
        [array replaceObjectAtIndex:hole withObject:value];
        
    }
    
    NSLog(@"Insertion Sort Results:%@", array);
}

- (void)mergeSortOnArray:(NSMutableArray *)array
{
   
    
    //Array is sorted
    if (array.count < 2)
    {
        return;
    }
    
    NSInteger midpoint = array.count/2;
    
    NSMutableArray *leftArray = [NSMutableArray arrayWithCapacity:midpoint];
    NSMutableArray *rightArray = [NSMutableArray arrayWithCapacity:array.count - midpoint];
    
    for (NSInteger i = 0; i <= midpoint - 1; i++)
    {
        [leftArray addObject:array[i]];
    }
    
    for (NSInteger j = midpoint; j < array.count; j++)
    {
        [rightArray addObject:array[j]];
    }
    
    [self mergeSortOnArray:leftArray];
    [self mergeSortOnArray:rightArray];
    [self mergeFunction:leftArray andRight:rightArray withFinalArray:array];
}

- (void)mergeFunction:(NSMutableArray *) left andRight:(NSMutableArray *) right withFinalArray:(NSMutableArray *) finalArray
{
    NSInteger i = 0, j = 0, k = 0;
    
    while (i < left.count && j < right.count)
    {
        if (left[i] <= right[j])
        {
            [finalArray replaceObjectAtIndex:k withObject:left[i]];
            i++;
        }
        else
        {
            [finalArray replaceObjectAtIndex:k withObject:right[i]];
            j++;
        }
        
        k++;
    }
    
    while (i < left.count)
    {
        [finalArray replaceObjectAtIndex:k withObject:left[i]];
        i++;
        k++;
    }
    
    while (j < right.count)
    {
        [finalArray replaceObjectAtIndex:k withObject:right[j]];
        j++;
        k++;
    }
    
    NSLog(@"Final array:%@", finalArray);
}

@end

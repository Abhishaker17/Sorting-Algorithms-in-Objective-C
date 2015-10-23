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
    
//    NSMutableArray *unsortedArray = [NSMutableArray arrayWithArray:@[@16, @5, @14, @3, @1]];
    
//    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:@[@14, @17, @33, @39, @102]];
    
//    [self quickSort:unsortedArray withStartIndex:0 andEndIndex:unsortedArray.count-1];
    
//    [self hashTableMethods:[NSMutableArray array]];
    
//    [self rodCuttingProblem:[NSMutableDictionary dictionaryWithDictionary:@{@1 : @1, @2 : @3, @3 : @9, @4 : @13 }] AndInteger:4];
    
//    [self computingPowerOfNumber:2 toThePower:14];
    
//    NSLog(@"Hamming distance:%zd", [self compute:@"GAGCCTACTAACGGGAT" against:@"CATCGTAATGACGGCCT"]);
    
//    [self creatingRansomNoteFromMagazineString:@"Hello, is anybody in there?"];
    
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *newDateString = [outputFormatter stringFromDate:now];
    NSLog(@"newDateString %@", newDateString);
    
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
 Computing power of a number
 
 */

- (void)plantedMotifSearch:(NSString *)sequence withLength:(NSInteger)length andDifference:(NSInteger)difference
{
    
}

- (NSUInteger)compute:(NSString *)strand against:(NSString *)otherStrand {
    unsigned long commonLength = MIN([strand length], [otherStrand length]);
    int distance = 0;
    
    for (NSInteger i = 0; i < commonLength; i++) {
        unichar nucleotide = [strand characterAtIndex:i];
        unichar otherNucleotide = [otherStrand characterAtIndex:i];
        
        if (nucleotide != otherNucleotide) {
            distance++;
        }
    }
    
    return distance;
}

- (void)computingPowerOfNumber:(NSInteger)number toThePower:(NSInteger)power
{
    NSInteger answer = number;
    
    for (NSInteger i = 1; i < power ; i++)
    {
        answer = answer * number;
    }
    
    NSLog(@"Answer:%zd", answer);
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

/*
 
 Best and worst case time complexity is o(nlogn) 
 
    Order of n for the merge function and the length of the recursion tree is logn
 */

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

/*
 
 The time complexity for this method will be O(n)
 */

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

/*
 Best and Average case: O(nlogn) 
 
 Best case is one where the subpartitions are almost of equal size i.e. Pivot divides the array into two.
 
 Worst Case: O(n^2) --> Can be avoided by using randomized version of quicksort
 
 Worst case will be for eg [1,2,3,4,5,6,7,8] where 8 is the pivot element matlab array is reverse sorted.
 
 Merge Sort always divides in 2. But Quick sort does not which means one processor has to do more work than the other.
 
 */

- (void)quickSort:(NSMutableArray *)array withStartIndex:(NSInteger)startIndex andEndIndex:(NSInteger)endIndex
{
    if (startIndex < endIndex)
    {
        NSInteger pivotIndex = [self partitionArray:array andStartIndex:startIndex andEndIndex:endIndex];
        
        //The next two calls must not include the pivot element
        
        [self quickSort:array withStartIndex:startIndex andEndIndex:pivotIndex - 1];
        
        [self quickSort:array withStartIndex:pivotIndex + 1 andEndIndex:endIndex];
    }
    
     NSLog(@"Quick sort implementation result:%@", array);
}

/*
 
 Partitioning does not ensure stability; which means relative order won't be preserved all the time.
 
 */

- (NSInteger)partitionArray:(NSMutableArray *)array andStartIndex:(NSInteger)startIndex andEndIndex:(NSInteger)endIndex
{
    NSInteger partitionIndex = startIndex; //c1
    
    NSNumber *pivotValue = array[endIndex]; //c1
    
    for (NSInteger i = startIndex; i < endIndex; i++) //n*c3
    {
        if (array[i] < pivotValue)
        {
            [array exchangeObjectAtIndex:i withObjectAtIndex:partitionIndex];
            partitionIndex++;
        }
    }
    
    [array exchangeObjectAtIndex:endIndex withObjectAtIndex:partitionIndex];
    
    return partitionIndex;
}

- (void)hashTableMethods:(NSMutableArray *)array
{
    NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    [hashTable addObject:@14];
    [hashTable addObject:@17];
    [hashTable addObject:@"Abhishek"];
    NSLog(@"Hashtable 1:%@", hashTable);
    NSLog(@"Does the hashtable contain Abhishek:%zd", [hashTable containsObject:@"Abhishek"]);
    NSLog(@"Printing all objects of Hash Table:%zd", [hashTable allObjects]);
    NSLog(@"Random Selection from Hash Table%zd", [hashTable anyObject]);
    NSLog(@"Set representation:%@", [hashTable setRepresentation]);
//    NSLog(@"Hash Table with weak reference objects:%@", );
    
}

- (NSInteger)rodCuttingProblem:(NSMutableDictionary *)prices AndInteger:(NSInteger)integer
{
    if (integer == 0) {
        return 0;
    }
    
    NSInteger q = INFINITY;
    
    for (int i = 1; i <= integer ; i++) {
        q = MAX(q, (NSInteger)[prices objectForKey:[NSNumber numberWithInt:i]] + [self rodCuttingProblem:prices AndInteger:integer - 1]);
    }
    
//    NSLog(@"Return Value:%zd", q);
    
    return q;
}

- (NSString *)creatingRansomNoteFromMagazineString:(NSString *)magString
{
    NSMutableString *ransomString = [NSMutableString string];
    
    NSMutableArray *randomArray = [NSMutableArray array];
    
    [magString enumerateSubstringsInRange:NSMakeRange(0, magString.length) options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        [randomArray addObject:substring];
        
    }];
    
    NSInteger randomNumber = arc4random_uniform(randomArray.count);
    
    for (NSInteger i = 0; i <= randomNumber; i++)
    {
        [ransomString appendFormat:@"%@ ",randomArray[i]];
    }
    
    NSLog(@"Ransom String:%@", ransomString);
    
    return ransomString;
}

@end

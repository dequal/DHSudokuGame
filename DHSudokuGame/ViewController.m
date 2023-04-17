//
//  ViewController.m
//  DHSudokuGame
//
//  Created by 宝付 on 2023/4/17.
//

#import "ViewController.h"
#import "DHSudokuBoard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DHSudokuBoard *board = [[DHSudokuBoard alloc] init];
    printf("Enter numbers to fill the board, one row at a time. Use 0 for blank spaces.\n");
    for (NSUInteger row = 0; row < 9; row++) {
        printf("Row %lu: ", row + 1);
        for (NSUInteger column = 0; column < 9; column++) {
            scanf("%lu", board.grid[row][column]);
        }
    }
    [board display];
    if ([board solve]) {
        printf("Solved!\n");
        [board display];
    } else {
        printf("No solution found.\n");
    }
}

@end

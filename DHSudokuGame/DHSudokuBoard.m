//
//  DHSudokuBoard.m
//  DHSudokuGame
//
//  Created by 宝付 on 2023/4/17.
//

#import "DHSudokuBoard.h"

@implementation DHSudokuBoard

- (instancetype)init {
    if (self = [super init]) {
        self.grid = [NSMutableArray arrayWithCapacity:9];
        for (NSUInteger i = 0; i < 9; i++) {
            NSMutableArray *row = [NSMutableArray arrayWithCapacity:9];
            for (NSUInteger j = 0; j < 9; j++) {
                [row addObject:@(0)];
            }
            [self.grid addObject:row];
        }
    }
    return self;
}

- (void)display {
    for (NSUInteger i = 0; i < 9; i++) {
        for (NSUInteger j = 0; j < 9; j++) {
            NSUInteger value = [self.grid[i][j] unsignedIntegerValue];
            if (value == 0) {
                printf(". ");
            } else {
                printf("%lu ", value);
            }
            if ((j + 1) % 3 == 0 && j != 8) {
                printf("| ");
            }
        }
        printf("\n");
        if ((i + 1) % 3 == 0 && i != 8) {
            printf("-----------------\n");
        }
    }
}

- (BOOL)isValidMoveForRow:(NSUInteger)row column:(NSUInteger)column value:(NSUInteger)value {
    // Check row and column for duplicates
    for (NSUInteger i = 0; i < 9; i++) {
        if ([self.grid[row][i] unsignedIntegerValue] == value) {
            return NO;
        }
        if ([self.grid[i][column] unsignedIntegerValue] == value) {
            return NO;
        }
    }
    // Check subgrid for duplicates
    NSUInteger subgridRow = (row / 3) * 3;
    NSUInteger subgridColumn = (column / 3) * 3;
    for (NSUInteger i = subgridRow; i < subgridRow + 3; i++) {
        for (NSUInteger j = subgridColumn; j < subgridColumn + 3; j++) {
            if ([self.grid[i][j] unsignedIntegerValue] == value) {
                return NO;
            }
        }
    }
    return YES;
}

- (BOOL)isComplete {
    for (NSUInteger i = 0; i < 9; i++) {
        for (NSUInteger j = 0; j < 9; j++) {
            if ([self.grid[i][j] unsignedIntegerValue] == 0) {
                return NO;
            }
        }
    }
    return YES;
}

- (BOOL)solve {
    for (NSUInteger row = 0; row < 9; row++) {
        for (NSUInteger column = 0; column < 9; column++) {
            NSUInteger value = [self.grid[row][column] unsignedIntegerValue];
            if (value == 0) {
                for (NSUInteger attempt = 1; attempt <= 9; attempt++) {
                    if ([self isValidMoveForRow:row column:column value:attempt]) {
                        self.grid[row][column] = @(attempt);
                        if ([self solve]) {
                            return YES;
                        } else {
                            self.grid[row][column] = @(0);
                        }
                    }
                }
                return NO;
            }
        }
    }
    return YES;
}



@end

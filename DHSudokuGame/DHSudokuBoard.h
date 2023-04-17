//
//  DHSudokuBoard.h
//  DHSudokuGame
//
//  Created by 宝付 on 2023/4/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHSudokuBoard : NSObject

@property (nonatomic, strong) NSMutableArray *grid;

- (void)display;
- (BOOL)isValidMoveForRow:(NSUInteger)row column:(NSUInteger)column value:(NSUInteger)value;
- (BOOL)isComplete;
- (BOOL)solve;

@end

NS_ASSUME_NONNULL_END

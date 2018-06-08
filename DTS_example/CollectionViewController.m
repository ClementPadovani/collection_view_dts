//
//  CollectionViewController.m
//  DTS_example
//
//  Created by Clément Padovani on 6/8/18.
//  Copyright © 2018 Clement Padovani. All rights reserved.
//

#import "CollectionViewController.h"

@interface MyCell: UICollectionViewCell

@property (nonatomic, weak) UILabel *label;

@end

@implementation MyCell

- (instancetype) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];

    if (self)
    {
        UILabel *label = [[UILabel alloc] init];
        
        [label setTextAlignment: NSTextAlignmentCenter];
        
        [[self contentView] addSubview: label];
        
        [self setLabel: label];
    }
    
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    [[self label] setFrame: [self bounds]];
}

@end

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self collectionView] registerClass: [MyCell class] forCellWithReuseIdentifier: @"cell"];
    
    [[self collectionView] setPagingEnabled: YES];
    
    CGRect sanitizedBounds = [[self view] bounds];
    
    CGFloat statusBarHeight = ({
        CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
        
        CGFloat _height = CGRectGetHeight(statusBarFrame);
        
        _height - 20.;
    });
    
    sanitizedBounds.size.height -= statusBarHeight;

    [(UICollectionViewFlowLayout *) [[self collectionView] collectionViewLayout] setItemSize: sanitizedBounds.size];
    
    // Do any additional setup after loading the view.
}

- (void) setCurrentIndex: (NSInteger) currentIndex
{
    _currentIndex = currentIndex;
    
    if ([self isViewLoaded])
    {
        [[self collectionView] scrollToItemAtIndexPath: [NSIndexPath indexPathForItem: currentIndex inSection: 0] atScrollPosition: UICollectionViewScrollPositionNone animated: NO];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    [[self collectionView] scrollToItemAtIndexPath: [NSIndexPath indexPathForItem: [self currentIndex] inSection: 0] atScrollPosition: UICollectionViewScrollPositionNone animated: NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath: indexPath];
    
    [[cell label] setText: [NSString stringWithFormat: @"%ld", [indexPath item]]];
    
    return cell;
}

@end

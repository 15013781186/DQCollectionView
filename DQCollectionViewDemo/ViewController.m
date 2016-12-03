//
//  ViewController.m
//  DQCollectionViewDemo
//
//  Created by 邓琪 dengqi on 16/12/3.
//  Copyright © 2016年 邓琪 dengqi. All rights reserved.
//

#import "ViewController.h"
#import "DQHeaderFooterView.h"
#import "DQViewController.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *DQCollectionView;

@property (nonatomic, copy) NSArray *dataColorArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionHeadersPinToVisibleBounds = NO;
    layout.sectionFootersPinToVisibleBounds = NO;
    
    self.dataColorArr = @[[UIColor redColor],[UIColor lightGrayColor],[UIColor greenColor],[UIColor blueColor],[UIColor yellowColor],[UIColor orangeColor]];
    
    self.DQCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:self.DQCollectionView];
    self.DQCollectionView.delegate = self;
    self.DQCollectionView.dataSource = self;
    [self.DQCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.DQCollectionView.backgroundColor = [UIColor whiteColor];
  
    [self.DQCollectionView registerNib:[UINib nibWithNibName:@"DQHeaderFooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.DQCollectionView registerNib:[UINib nibWithNibName:@"DQHeaderFooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 6;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{


    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger numColor =arc4random()%6;
    cell.backgroundColor = self.dataColorArr[numColor];
    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((375-30)/2.0, 200);

}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            DQHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            header.titleLab.text = @"头部第一个";
            return header;
            
        }else{
            DQHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            header.titleLab.text = @"尾部第一个";
            
            return header;
        }
    }else{
    
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            DQHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            header.titleLab.text = @"头部第二个";
            
            return header;
            
        }else{
            DQHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            header.titleLab.text = @"尾部第二个";
            
            return header;
        }
    
    }


}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(375, 30);
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeMake(375, 30);
}
@end

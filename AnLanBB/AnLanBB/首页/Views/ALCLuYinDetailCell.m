//
//  ALCLuYinDetailCell.m
//  AnLanBB
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLuYinDetailCell.h"
#import "ALCJianKangTiXingOneCell.h"
#import "ALCHomeLuYinCell.h"
@interface ALCLuYinDetailCell()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *backV;
@end

@implementation ALCLuYinDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.backV = [[UIView alloc] init];
        [self addSubview:self.backV];
        [self.backV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(15);
            make.bottom.equalTo(self).offset(-10);
            make.right.equalTo(self).offset(-15);
        }];
        self.backV.backgroundColor = WhiteColor;
        self.backV.layer.cornerRadius = 5;
        self.backV.layer.shadowColor = [UIColor blackColor].CGColor;
        self.backV.layer.shadowOffset = CGSizeMake(0, 0);
        self.backV.layer.shadowRadius = 5;
        self.backV.layer.shadowOpacity = 0.08;
        
        self.tableView = [[UITableView alloc] init];
        [self.backV addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.backV);
        }];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[ACLHeadOrFootView class] forHeaderFooterViewReuseIdentifier:@"head"];
        
        [self.tableView registerNib:[UINib nibWithNibName:@"ALCJianKangTiXingOneCell" bundle:nil] forCellReuseIdentifier:@"ALCJianKangTiXingOneCell"];
        [self.tableView registerNib:[UINib nibWithNibName:@"ALCHomeLuYinCell" bundle:nil] forCellReuseIdentifier:@"ALCHomeLuYinCell"];

        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
    }
    return self;
}


- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if  (self.dataArray.count == 0) {
        return 0;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        ALCJianKangTiXingOneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ALCJianKangTiXingOneCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.leftLB.textColor = CharacterColor50;
        cell.leftLB.text = @"图片语音文件";
        return cell;
    }else {
        ALCHomeLuYinCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ALCHomeLuYinCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = WhiteColor;
        cell.contentView.backgroundColor = WhiteColor;
        cell.numberLB.textColor = cell.timeLB.textColor = CharacterBlack100;
        cell.delectBt.hidden = YES;
        cell.model = self.dataArray[indexPath.row];
//        cell.leftImgV.image = [UIImage imageNamed:@""];
        return cell;
    }
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didClickALCLuYinDetailCell:withIndex:)]) {
        
        [self.delegate didClickALCLuYinDetailCell:self withIndex:indexPath.row];
        
    }
    
}


@end

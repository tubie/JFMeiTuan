//
//  JFAllCityNameCell.m
//  JF团购
//
//  Created by 保修一站通 on 15/9/14.
//  Copyright (c) 2015年 JF团购. All rights reserved.
//

#import "JFAllCityNameCell.h"

@implementation JFAllCityNameCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities{
    static NSString *cellIndentifier = @"JFAllCityNameCell";
    JFAllCityNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JFAllCityNameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier cellForRowAtIndexPath:indexPath keys:keys cities:cities];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSString *key = [keys objectAtIndex:indexPath.section];
        self.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
       
    }
    return self;
}

@end

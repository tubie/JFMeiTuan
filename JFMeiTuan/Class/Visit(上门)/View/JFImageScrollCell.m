//
//  JFImageScrollCell.m
//  https://github.com/tubie/JFMeiTuan
//  http://www.jianshu.com/p/e47ca64b8caa
//

#import "JFImageScrollCell.h"
#import "JFImageScrollView.h"

@implementation JFImageScrollCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [super awakeFromNib];

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//+ (instancetype)cellWithTableView:(UITableView *)tableView ;
//{
//    static NSString *menuID = @"menu";
//    JFImageScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
//    if (cell == nil) {
//        cell = [[JFImageScrollCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID ];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    }
//    return cell;
//}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ];
    if (self) {
        
        self.imageScrollView = [[JFImageScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) imageArray:self.imageArr];
        [self.contentView addSubview:self.imageScrollView];
    }
    return self;
}

-(void)setImageArray:(NSArray *)imageArray{
    [self.imageScrollView setImageArray:imageArray];
}

@end

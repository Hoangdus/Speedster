#include "sdrRootListController.h"
#import  "spawn.h"

@implementation sdrRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}    
	return _specifiers;
}

- (void)respring:(id)sender{ //handle the "respring" button
    pid_t pid;
    // const char *args[] = {"killall", "-9", "backboardd", NULL};
    posix_spawn(&pid, "/var/jb/usr/bin/sbreload", NULL, NULL, NULL, NULL); 
}

- (void)github{
  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/Hoangdus/Speedster"]options:@{} completionHandler:nil];
}

- (void)twitter{
  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Hoangdev23"]options:@{} completionHandler:nil];
}

- (void)paypal{
  [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://ko-fi.com/hoangdus"]options:@{} completionHandler:nil];
}

@end

@implementation SdrHeaderCell
- (id)initWithSpecifier:(PSSpecifier *)specifier {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];

  if (self) {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 60)];
    title.numberOfLines = 1;
    title.font = [UIFont systemFontOfSize:50];
    title.text = @"Speedster";
    title.textColor = [UIColor orangeColor];
    title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:title];

    UILabel *subtitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, self.frame.size.width, 30)];
    subtitle.numberOfLines = 1;
    subtitle.font = [UIFont systemFontOfSize:20];
    subtitle.text = @"By HoangDus";
    subtitle.textColor = [UIColor grayColor];
    subtitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:subtitle];
  }
  return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
  return 150.0;
}
@end

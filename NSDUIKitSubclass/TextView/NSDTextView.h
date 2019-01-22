
#import <UIKit/UIKit.h>
@class NSDTextView;

/**
 @brief FSTextView回调

 @param textView FSTextView
 */
typedef void(^NSDTextViewHandler)(NSDTextView *textView);

IB_DESIGNABLE

/**
 @discussion 可设置placeholder的textview
 @discussion 文本变化block，可设置最大字符串长度blck
 */
@interface NSDTextView : UITextView

/**
 便利构造器.
 */
+ (instancetype)nsd_TextView;

/**
 @brief 设定文本改变Block回调

 @param eventHandler 回调 FSTextViewHandler
 */
- (void)nsd_AddTextDidChangeHandler:(NSDTextViewHandler)eventHandler;

/**
 @brief 设定达到最大长度Block回调
 
 @param maxHandler 回调 FSTextViewHandler
 */
- (void)nsd_AddTextLengthDidMaxHandler:(NSDTextViewHandler)maxHandler;

/**
 最大限制文本长度, 默认为无穷大, 即不限制, 如果被设为 0 也同样表示不限制字符数.
 */
@property (nonatomic, assign) IBInspectable NSUInteger maxLength;

/**
 圆角半径.
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/**
 边框宽度.
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

/**
 边框颜色.
 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/**
 placeholder, 会自适应TextView宽高以及横竖屏切换, 字体默认和TextView一致.
 */
@property (nonatomic, copy)   IBInspectable NSString *placeholder;

/**
 placeholder文本颜色, 默认为#C7C7CD.
 */
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

/**
 placeholder文本字体, 默认为UITextView的默认字体.
 */
@property (nonatomic, strong) UIFont *placeholderFont;

/**
 是否允许长按弹出UIMenuController, 默认为YES.
 */
@property (nonatomic, assign, getter=isCanPerformAction) BOOL canPerformAction;

/**
 该属性返回一个经过处理的 `self.text` 的值, 去除了首位的空格和换行.
 */
@property (nonatomic, readonly) NSString *formatText;

@end

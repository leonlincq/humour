
#import <UIKit/UIKit.h>

typedef enum {
    KSCTopicTypeAll = 1,
    KSCTopicTypePicture = 10,
    KSCTopicTypeWord = 29,
    KSCTopicTypeVoice = 31,
    KSCTopicTypeVideo = 41
} KSCTopicType;

/** 精华-顶部标题的高度 */
UIKIT_EXTERN CGFloat const KSCTitilesViewH;
/** 精华-顶部标题的Y */
UIKIT_EXTERN CGFloat const KSCTitilesViewY;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const KSCTopicCellMargin;
/** 精华-cell-文字内容的Y值 */
UIKIT_EXTERN CGFloat const KSCTopicCellTextY;
/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const KSCTopicCellBottomBarH;

/** 精华-cell-图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const KSCTopicCellPictureMaxH;
/** 精华-cell-图片帖子一旦超过最大高度,就是用Break */
UIKIT_EXTERN CGFloat const KSCTopicCellPictureBreakH;

/** KSCUser模型-性别属性值 */
UIKIT_EXTERN NSString * const KSCUserSexMale;
UIKIT_EXTERN NSString * const KSCUserSexFemale;

/** 精华-cell-最热评论标题的高度 */
UIKIT_EXTERN CGFloat const KSCTopicCellTopCmtTitleH;

/** tabBar被选中的通知名字 */
UIKIT_EXTERN NSString * const KSCTabBarDidSelectNotification;
/** tabBar被选中的通知 - 被选中的控制器的index key */
UIKIT_EXTERN NSString * const KSCSelectedControllerIndexKey;
/** tabBar被选中的通知 - 被选中的控制器 key */
UIKIT_EXTERN NSString * const KSCSelectedControllerKey;

/** 标签-间距 */
UIKIT_EXTERN CGFloat const KSCTagMargin;
/** 标签-高度 */
UIKIT_EXTERN CGFloat const KSCTagH;


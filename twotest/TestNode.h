//
//  TestNode.h
//  twotest
//
//  Created by Kim JinHyuck on 12/07/27.
//
//

#import "cocos2d.h"

inline void CGPointSet (CGPoint *v, float x, float y);

@interface TestNode : CCNode

@property(nonatomic, retain) CCTexture2D* texture;

+ (id) testNode;

@end











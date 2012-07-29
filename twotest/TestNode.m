//
//  TestNode.m
//  twotest
//
//  Created by Kim JinHyuck on 12/07/27.
//
//


#import "TestNode.h"

void CGPointSet (CGPoint *v, float x, float y)
{
    v->x = x;
    v->y = y;
}

@implementation TestNode

@synthesize
texture = texture_;

+ (id) testNode
{
    return [[[TestNode alloc] init] autorelease];
}

- (id) init
{
    if ((self = [super init]))
    {
        // とりあえず、テキストをロード
        // 今はランダムで。
//        int rand = arc4random() % 3 + 1;
        self.texture = [[CCTextureCache sharedTextureCache] addImage: [NSString stringWithFormat: @"streak%d.png", 3]];
        
        
    }
    
    return self;
}

- (void) dealloc
{
    self.texture = nil;
    
    [super dealloc];
}


- (void) draw
{
    int verticesMax = 6;
    CGPoint vertices[verticesMax];
	CGPoint coordinates[verticesMax];
    
    CGPointSet(&vertices[0], 300, 100);
    CGPointSet(&vertices[1], 350, 100);
    CGPointSet(&vertices[2], 300, 150);
    CGPointSet(&vertices[3], 350, 100);
    CGPointSet(&vertices[4], 300, 150);
    CGPointSet(&vertices[5], 350, 150);
//    CGPointSet(&vertices[3], 350, 150);
//    CGPointSet(&vertices[4], 325, 200);
//    CGPointSet(&vertices[3], 100, 100);
//    CGPointSet(&vertices[5], 150, 150);
    
    CGPointSet(&coordinates[0], 0, 0);
    CGPointSet(&coordinates[1], 0, 1);
    CGPointSet(&coordinates[2], 1, 0);
    CGPointSet(&coordinates[3], 1, 0);
    CGPointSet(&coordinates[3], 0, 1);
    CGPointSet(&coordinates[3], 1, 1);
//    CGPointSet(&coordinates[4], 1, 1);
//    CGPointSet(&coordinates[5], 1, 1);
//    CGPointSet(&coordinates[4], 0.5, 0.5);
    
    
    ccGLBlendFunc( CC_BLEND_SRC, CC_BLEND_DST );
    
    ccGLBindTexture2D(self.texture.name);
    
    glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, sizeof(vertices[0]), vertices);
    glEnableVertexAttribArray(kCCVertexAttrib_Position);
    glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, sizeof(coordinates[0]), coordinates);
    glEnableVertexAttribArray(kCCVertexAttrib_TexCoords);

    glDrawArrays(GL_TRIANGLES, 0, verticesMax);
    
//    NSMutableArray* ar = [NSMutableArray array];
//    [ar addObject: [NSValue valueWithCGPoint: vertices[0]]];
//    [ar addObject: [NSValue valueWithCGPoint: vertices[1]]];
//    [ar addObject: [NSValue valueWithCGPoint: vertices[2]]];
//    [ar addObject: [NSValue valueWithCGPoint: vertices[3]]];
//    [ar addObject: [NSValue valueWithCGPoint: vertices[4]]];
//    [ar addObject: [NSValue valueWithCGPoint: vertices[5]]];
//    
//    
//    glDrawArrays(GL_TRIANGLE_STRIP, 0, 2*[ar count]-2);
}

@end











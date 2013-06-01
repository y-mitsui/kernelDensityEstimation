//
//  kernelDensityEstimation.h
//  meanShift
//
//  Created by  on 13/05/26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kernelDensityEstimation : NSObject{
    NSArray *_data;
    double _bandWidth;
}
-(double)norm:(double)x;
-(id)initWithData:(NSArray*)data;
-(double)porobabilityDensityFunction:(double)x;

@end

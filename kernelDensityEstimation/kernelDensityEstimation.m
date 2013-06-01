//
//  kernelDensityEstimation.m
//  meanShift
//
//  Created by  on 13/05/26.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "kernelDensityEstimation.h"


@implementation kernelDensityEstimation

+(double)gaussian:(double)x{
    return exp(-x/2.0);
}

/* plug-in method */
-(double)calcBandWidth:(NSArray*)data{
    double div[2],x,c1,c2,c3,i;
    
    for(i=0,c1=0;i<[data count]-2;i++){
        x=[[data objectAtIndex:i+1] doubleValue];
        c1+=pow(x,2)*[kernelDensityEstimation gaussian:x];
    }
    
    for(i=0,c2=0;i<[data count]-2;i++){
        c2+=pow([kernelDensityEstimation gaussian:x],2);
    }
    
    for(i=0,c3=0;i<[data count]-2;i++){
        div[0]=[[data objectAtIndex:i+1] doubleValue]-[[data objectAtIndex:i] doubleValue];
        div[1]=[[data objectAtIndex:i+2] doubleValue]-[[data objectAtIndex:i+1] doubleValue];
        c3+=pow(div[1]-div[0],2);
    }
    NSLog(@"c1:%lf c2:%lf c3:%lf",c1,c2,c3);
    return pow(c1,-2.0/5.0)*pow(c2,1.0/5.0)*pow(c3,-1.0/5.0)/pow([data count],1.0/5.0);
}

-(id)initWithData:(NSArray*)data{
    self=[super init];
    _data=data;
    _bandWidth=[self calcBandWidth:data];
    NSLog(@"band width: %lf",_bandWidth);
    return self;
}
-(double)norm:(double)x{
    return sqrt(pow(x,2));
}

-(double)porobabilityDensityFunction:(double)x{
    double sum;
    for(NSInteger i=0;i<[_data count];i++){
        double xi=[[_data objectAtIndex:i] doubleValue];
        sum+=[kernelDensityEstimation gaussian:-[self norm:x-xi/_bandWidth]];
    }
    return 1/[_data count]*_bandWidth*sum;
}
@end

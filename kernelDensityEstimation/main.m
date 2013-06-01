//
//  main.m
//  kernelDensityEstimation
//
//  Created by  on 13/05/27.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kernelDensityEstimation.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *arr=[NSArray arrayWithObjects:[NSNumber numberWithDouble:1.1]
                      ,[NSNumber numberWithDouble:1.1]
                      ,[NSNumber numberWithDouble:1.1]
                      ,[NSNumber numberWithDouble:1.1]
                      ,[NSNumber numberWithDouble:1.1]
                      ,[NSNumber numberWithDouble:1.2]
                      ,[NSNumber numberWithDouble:1.2]
                      ,[NSNumber numberWithDouble:1.2]
                      ,[NSNumber numberWithDouble:1.2]
                      ,[NSNumber numberWithDouble:1.3]
                      ,[NSNumber numberWithDouble:1.3]
                      ,[NSNumber numberWithDouble:1.3]
                      ,[NSNumber numberWithDouble:1.1]
                      ,[NSNumber numberWithDouble:1.1]
                      , nil];
        kernelDensityEstimation *de=[[kernelDensityEstimation alloc] initWithData:arr];
        double y=[de porobabilityDensityFunction:1.4];
        NSLog(@"y^=%lf",y);
        
    }
    return 0;
}


//
//  Politician.h
//  Hack NJ
//
//  Created by Alex Cevallos on 3/28/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Issue : NSObject


@property (nonatomic) NSString *stringOfDescription;
@property (nonatomic) NSString *billNumber;
@property (nonatomic) NSArray *arrayOfPList;
//@property (nonatomic) NSString *string

//Bills
@property (nonatomic) NSString *stringTotalAgainst;
@property (nonatomic) NSString *stringTotalFor;
@property (nonatomic) NSString *stringYear;



@end

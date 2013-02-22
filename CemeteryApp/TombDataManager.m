//
//  TombDataManager.m
//  CemeteryApp
//
//  Created by Joshua Lisojo on 11/12/12.
//  Copyright (c) 2012 KeanU. All rights reserved.
//

#import "TombDataManager.h"
#import "Tomb.h"
#import "JSONHandler.h"
@implementation TombDataManager
{

    
}

@synthesize tombs;
//@synthesize jsonArray;
@synthesize didGetCols;

- (id)init
{
    self = [super init];
    if (self)
    {
        [self loadTombs];
        
    }
    return self;
}

-(void)loadTombs
{
    JSONHandler *db = [[JSONHandler alloc] init];
    NSDictionary *dict = [[NSDictionary alloc] init];
    tombs = [[NSMutableArray alloc]init];
    NSArray *columns = [[NSArray alloc] init];
    
    for (int i =1; i < [db.jsonArray count]; i++)
    {
        dict = [db.jsonArray objectAtIndex:i];
        columns = [TombDataManager getDBColumns:dict];
        tomb = [[Tomb alloc]initWithFirstName:[dict objectForKey:@"FirstName"]
                                  andLastName:[dict objectForKey:@"LastName"]
                                andMiddleName:[dict objectForKey:@"Middle"]
                                 andBirthDate:([[dict objectForKey:@"DOB"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"DOB"]
                                 andDeathDate:([[dict objectForKey:@"DOD"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"DOD"]
                                    andPrefix:[dict objectForKey:@"Prefix"]
                                    andSuffix:[dict objectForKey:@"Suffix"]
                                       andRef:[dict objectForKey:@"Ref"]
                                      andTour:[dict objectForKey:@"Tour"]
                                  andInternet:[dict objectForKey:@"InternetLink"]
                                     andNotes:[dict objectForKey:@"Notes"]
                              andSextonsNotes:[dict objectForKey:@"SextonsNotes"]
                                   andEpitaph:[dict objectForKey:@"Epitaph"]
                                   andSection:[dict objectForKey:@"Section"]
                                        andID:[dict objectForKey:@"ID"]
                                  andSandston:[dict objectForKey:@"Sandstone"]
                                     andYears:([[dict objectForKey:@"DOB"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"Years"]
                                    andMonths:([[dict objectForKey:@"DOB"] isEqualToString:@""]) ? @"n/a " : [dict objectForKey:@"Months"]
                                 andCondition:[dict objectForKey:@"Condition"]
                                   andVeteran:[dict objectForKey:@"Veteran"]
                                  andUniqueId:[dict objectForKey:@"UID"]];
        
        [tombs addObject:tomb];
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"DataController: tombs =%@", self.tombs];
}

+(TombDataManager *)instance
{
    static TombDataManager* instance = nil;
    
    if (!instance)
    {
        instance = [[TombDataManager alloc]init];
    }
    return instance;
}

-(NSMutableArray *)filterTombs:(NSString *)search withFilter:(NSString *)filter
 {
     if (search && [search length] > 0)
     {
         NSMutableArray *filterTombs = [[NSMutableArray alloc]initWithArray:tombs];
         
         NSPredicate *predicate;
         if([filter isEqualToString:@"All"])
         {
            predicate = [NSPredicate predicateWithFormat:@"(fullName CONTAINS[cd] %@) OR (firstAndLastName CONTAINS[cd] %@) OR (firstName CONTAINS[cd] %@) OR (lastName CONTAINS[cd] %@) OR (birthDate CONTAINS[cd] %@) OR (birthDate CONTAINS[cd] %@) OR (section CONTAINS[cd] %@)",search,search,search,search,search,search,search];
         }
         else if([filter isEqualToString:@"Name"])
         {
             predicate = [NSPredicate predicateWithFormat:@"lastName CONTAINS[cd] %@",search];
         }
         else if ([filter isEqualToString:@"Date of Birth"])
         {
             predicate = [NSPredicate predicateWithFormat:@"birthDate CONTAINS[cd] %@",search];
         }
         else if ([filter isEqualToString:@"Date of Death"])
         {
             predicate = [NSPredicate predicateWithFormat:@"deathDate CONTAINS[cd] %@",search];
         }
         else if ([filter isEqualToString:@"Section"])
         {
             predicate = [NSPredicate predicateWithFormat:@"section CONTAINS[cd] %@",search];
         }
         else
         {
             predicate = [NSPredicate predicateWithFormat:@"years == %@",search];
         }
         [filterTombs filterUsingPredicate:predicate];
         return filterTombs;
     }
     else
     {
         return tombs;
     }
 }

+(NSArray *)getDBColumns:(NSDictionary *)jsonData
{
    return [jsonData allKeys];
}
@end

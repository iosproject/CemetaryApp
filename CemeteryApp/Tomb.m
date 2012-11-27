//
//  Tomb.m
//  CemeteryApp
//
//  Created by Joshua Lisojo on 11/12/12.
//  Copyright (c) 2012 KeanU. All rights reserved.
//

#import "Tomb.h"

@implementation Tomb
@synthesize firstName, lastName, middleName;
@synthesize birthDate, deathDate;
@synthesize prefix, suffix, ref, tour, internet;
@synthesize notes, sextonsNotes;
@synthesize epitaph, section, tombId;
@synthesize sandstone, years, months, condition, veteran, uniqueId;


-(id)initWithFirstName:(NSString*)aFirstName
           andLastName:(NSString*)aLastName
         andMiddleName:(NSString*)aMiddleName
          andBirthDate:(NSString*)aBirthDate
          andDeathDate:(NSString*)aDeathDate
             andPrefix:(NSString*)aPrefix
             andSuffix:(NSString*)aSuffix
                andRef:(NSString*)aRef
               andTour:(NSString*)aTour
           andInternet:(NSString*)aInternet
              andNotes:(NSString*)aNotes
       andSextonsNotes:(NSString*)aSextonsNotes
            andEpitaph:(NSString*)anEpitaph
            andSection:(NSString*)aSection
                 andID:(NSString*)aTombID
           andSandston:(NSString*)aSandstone
              andYears:(NSString*)aYears
             andMonths:(NSString*)aMonths
          andCondition:(NSString*)aCondition
            andVeteran:(NSString*)aVeteran
           andUniqueId:(NSString*)aUniqueId
{
    self = [super init];
    if (self) {
        self.firstName = aFirstName;
        self.lastName = aLastName;
        self.middleName = aMiddleName;
        self.birthDate = aBirthDate;
        self.deathDate = aDeathDate;
        self.prefix = aPrefix;
        self.suffix = aSuffix;
        self.ref = aRef;
        self.tour = aTour;
        self.internet = aInternet;
        self.notes = aNotes;
        self.sextonsNotes = aSextonsNotes;
        self.epitaph = anEpitaph;
        self.section = aSection;
        self.tombId =  aTombID;
        self.sandstone = aSandstone;
        self.years = aYears;
        self.months = aMonths;
        self.condition = aCondition;
        self.veteran = aVeteran;
        self.uniqueId = aUniqueId;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Tomb: firstName = %@ lastName = %@ deathDate = %@", self.firstName, self.lastName, self.deathDate];
}

@end

//
//  favCarsViewController.m
//  favCarsCoreData
//
//  Created by Enterpi on 28/11/14.
//  Copyright (c) 2014 Praveen. All rights reserved.
//

#import "favCarsViewController.h"

@interface favCarsViewController ()

@end

@implementation favCarsViewController


@synthesize textFieldColor,textFieldMake,textFieldModel,car;

//We need this to retrieve managed object context and later save the device data
-(NSManagedObjectContext *)managedObjectContext\
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (car)
    {
        [self.textFieldMake setText:[car valueForKey:@"make"]];
        [self.textFieldModel setText:[car valueForKey:@"model"]];
        [self.textFieldColor setText:[car valueForKey:@"color"]];
       
         [self.navigationController popViewControllerAnimated:YES];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)savePressed:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (car) {
        
        // Update exisiting cat
        [car setValue:textFieldMake.text forKey:@"make"];
        [car setValue:textFieldModel.text forKey:@"model"];
        [car setValue:textFieldColor.text forKey:@"color"];
        
    }
    
    else {
        // Create a new car
        NSManagedObject *newCar = [NSEntityDescription insertNewObjectForEntityForName:@"Cars" inManagedObjectContext:context];
        [newCar setValue:textFieldMake.text forKey:@"make"];
        [newCar setValue:textFieldModel.text forKey:@"model"];
        [newCar setValue:textFieldColor.text forKey:@"color"];
        
    }
    // invode the save method to commit the change
    NSError *error = nil;
    // Save the context
    if (![context save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)cancelPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



























@end

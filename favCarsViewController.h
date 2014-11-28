//
//  favCarsViewController.h
//  favCarsCoreData
//
//  Created by Enterpi on 28/11/14.
//  Copyright (c) 2014 Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface favCarsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFieldMake;
@property (weak, nonatomic) IBOutlet UITextField *textFieldModel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldColor;
@property(strong)NSManagedObject *car;

@end

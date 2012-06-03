/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComMeeechMixpanelModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "MixpanelAPI.h"

@implementation ComMeeechMixpanelModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"a316635f-db8c-4eb5-8b0f-1167109938e8";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.meeech.mixpanel";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)init:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    mixpanel = [MixpanelAPI sharedAPIWithToken:value];
}

-(void)identifyUser:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[DEBUG] indentifyUser: %@", value);
    [mixpanel identifyUser:value];
}

-(void)nameTag:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    NSLog(@"[DEBUG] setNameTag: %@", value);
    [mixpanel setNameTag:value];
}

//args[0]: str event
//args[1]: (opt) dict of properties to send along with event
-(void)track:(id)args
{
    NSString *event = [TiUtils stringValue:[args objectAtIndex:0]];
	NSDictionary *props = nil;

    NSLog(@"[DEBUG] Tracking Event: %@", event);

	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}

	if (props==nil)
	{
        [mixpanel track:event];
	}
	else 
	{
        [mixpanel track:event properties:props];
	}
}

-(void)setUploadInterval:(id)args
{
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    NSUInteger i = (NSUInteger)[value integerValue];
    NSLog(@"[DEBUG] uploadInterval: %u", i);
    mixpanel.uploadInterval = i;
}


-(void)testargs:(id)args
{
    NSLog(@"[WARN] %@", [args class]);
}

@end

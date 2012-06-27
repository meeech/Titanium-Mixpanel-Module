// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white',
	layout: 'vertical'
});
window.open();

//Get started, require the module.
var mixpanel = require('com.meeech.mixpanel');

//You need to init the object - pass in your token value.
mixpanel.init('YOUR-TOKEN-HERE');

//Set the uploadInterval. 
//NOTE: Interval uploading doesn't seem to be working ATM - NSTimer doesn't seem to work within Ti context?
//Only delivers on pause
//mixpanel.uploadInterval(60);

//Set the user id.
//Otherwise, Mixpanel makes a uniq id for you from
//device MAC address. Unless you need it, don't set it
// mixpanel.identifyUser(UNIQID);

//Name user will show up under in Mixpanel dashboard.
mixpanel.nameTag('meeech');

mixpanel.registerSuperProperties({
	model: Ti.Platform.model,
    os: Ti.Platform.osname,
    name:Ti.Platform.name
});

mixpanel.registerSuperPropertiesOnce({
    model: 'Should Fail', //model already set
    theme: 'math'
});

//Track a simple event.
mixpanel.track('A Tracked Event!');

//Track an event with a note & properties
mixpanel.track('Event Name', {
    //This note will show up in the stream feed with event
    mp_note: 'This is a test note to go with event.',

    //These properties will be available for segmentation
    propX: 'valueX',
    propY: 'valueY'
});

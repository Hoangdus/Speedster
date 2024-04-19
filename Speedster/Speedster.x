#import <UIKit/UIKit.h>
static BOOL isOnSpringBoard;
static double SwitcherDismiss;

static Class CASpringAnimationClass = Nil;
// static Class SBFAnimationSettingsClass = Nil;

static BOOL isSpeedEnable;
static BOOL isBounceEnable;
static int Speedvalue;
static int Bouncevalue;
static BOOL isFineTuneSpeedEnable;
static BOOL isFineTuneBounceEnable;
static double FineTuneSpeedValue;
static double FineTuneBounceValue;

static BOOL isFolderAnimationEnabled;
static BOOL isFolderAnimationBounceEnabled;
// static double FolderInitialVelocityValue;
// static double FolderSpeedValue;
// static double FolderStiffnessValue;
static double FolderMassValue;
static double FolderDampingValue;

static BOOL inAppAnimationEnabled;
static BOOL inAppAnimationBounceEnabled;
// static double InitialVelocityValue;
// static double VelocityValue;
// static double StiffnessValue;
static double MassValue;
static double DampingValue;
static double DurationValue;

static BOOL isScreenwakeEnable;
static BOOL isScreensleepEnable;
static double Screensleepvalue;
static double Screenwakevalue;

static BOOL isNoiconflyEnable;
static BOOL isNoiconshakingEnable;
static BOOL isNoiconZoominSwitcher;
static BOOL isNoWallZoominSwitcher;
static BOOL isInstantFolder;

void preferencesthings(){ //pref starts to look THICC
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/jb/var/mobile/Library/Preferences/com.hoangdus.speedsterprefs.plist"];
    //app close/open values
    // NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.hoangdus.speedsterprefs"];
    isSpeedEnable = (prefs && [prefs objectForKey:@"isSpeedEnable"] ? [[prefs valueForKey:@"isSpeedEnable"] boolValue] : NO );
    isBounceEnable = (prefs && [prefs objectForKey:@"isBounceEnable"] ? [[prefs valueForKey:@"isBounceEnable"] boolValue] : NO );
    Speedvalue = (prefs && [prefs objectForKey:@"Speedvalue"] ? [[prefs valueForKey:@"Speedvalue"] integerValue] : 1 );
    Bouncevalue = (prefs && [prefs objectForKey:@"Bouncevalue"] ? [[prefs valueForKey:@"Bouncevalue"] integerValue] : 1 );
    isFineTuneSpeedEnable = (prefs && [prefs objectForKey:@"isFineTuneSpeedEnable"] ? [[prefs valueForKey:@"isFineTuneSpeedEnable"] boolValue] : NO );
    isFineTuneBounceEnable = (prefs && [prefs objectForKey:@"isFineTuneBounceEnable"] ? [[prefs valueForKey:@"isFineTuneBounceEnable"] boolValue] : NO );
    FineTuneSpeedValue = (prefs && [prefs objectForKey:@"FineTuneSpeedValue"] ? [[prefs valueForKey:@"FineTuneSpeedValue"] doubleValue] : 1 );
    FineTuneBounceValue = (prefs && [prefs objectForKey:@"FineTuneBounceValue"] ? [[prefs valueForKey:@"FineTuneBounceValue"] doubleValue] : 1 );

    //screen sleep/wake values
    isScreenwakeEnable = (prefs && [prefs objectForKey:@"isScreenwakeEnable"] ? [[prefs valueForKey:@"isScreenwakeEnable"] boolValue] : NO );
    isScreensleepEnable = (prefs && [prefs objectForKey:@"isScreensleepEnable"] ? [[prefs valueForKey:@"isScreensleepEnable"] boolValue] : NO );
    Screensleepvalue = (prefs && [prefs objectForKey:@"Screensleepvalue"] ? [[prefs valueForKey:@"Screensleepvalue"] doubleValue] : 0.01 );
    Screenwakevalue = (prefs && [prefs objectForKey:@"Screenwakevalue"] ? [[prefs valueForKey:@"Screenwakevalue"] doubleValue] : 2 );
    
    //folder values
    isFolderAnimationEnabled = (prefs && [prefs objectForKey:@"isFolderAnimationEnabled"] ? [[prefs valueForKey:@"isFolderAnimationEnabled"] boolValue] : NO );
    isFolderAnimationBounceEnabled = (prefs && [prefs objectForKey:@"isFolderBounceEnabled"] ? [[prefs valueForKey:@"isFolderBounceEnabled"] boolValue] : NO );
    // FolderInitialVelocityValue
    // FolderSpeedValue = (prefs && [prefs objectForKey:@"FolderVelocityValue"] ? [[prefs valueForKey:@"FolderVelocityValue"] doubleValue] : 1 );
    FolderDampingValue = (prefs && [prefs objectForKey:@"FolderDampingValue"] ? [[prefs valueForKey:@"FolderDampingValue"] doubleValue] : 0 );
    FolderMassValue = (prefs && [prefs objectForKey:@"FolderMassValue"] ? [[prefs valueForKey:@"FolderMassValue"] doubleValue] : 0 );
    // FolderStiffnessValue = (prefs && [prefs objectForKey:@"FolderStiffnessValue"] ? [[prefs valueForKey:@"FolderStiffnessValue"] doubleValue] : 1 );

    //in-app values
    inAppAnimationEnabled = (prefs && [prefs objectForKey:@"InAppAnimationEnabled"] ? [[prefs valueForKey:@"InAppAnimationEnabled"] boolValue] : NO );
    inAppAnimationBounceEnabled = (prefs && [prefs objectForKey:@"isInAppBounceEnabled"] ? [[prefs valueForKey:@"isInAppBounceEnabled"] boolValue] : NO );
    // InitialVelocityValue
    // VelocityValue = (prefs && [prefs objectForKey:@"VelocityValue"] ? [[prefs valueForKey:@"VelocityValue"] doubleValue] : 1 );
    DampingValue = (prefs && [prefs objectForKey:@"DampingValue"] ? [[prefs valueForKey:@"DampingValue"] doubleValue] : 0 );
    MassValue = (prefs && [prefs objectForKey:@"DurationMassValue"] ? [[prefs valueForKey:@"DurationMassValue"] doubleValue] : 0 );
    // StiffnessValue = (prefs && [prefs objectForKey:@"StiffnessValue"] ? [[prefs valueForKey:@"StiffnessValue"] doubleValue] : 1 );
    DurationValue = (prefs && [prefs objectForKey:@"DurationMassValue"] ? [[prefs valueForKey:@"DurationMassValue"] doubleValue] : 0 );

    //extra
    isNoiconflyEnable = (prefs && [prefs objectForKey:@"nofly"] ? [[prefs valueForKey:@"nofly"] boolValue] : NO );
    isNoiconZoominSwitcher = (prefs && [prefs objectForKey:@"nozoom"] ? [[prefs valueForKey:@"nozoom"] boolValue] : NO );
    isNoWallZoominSwitcher = (prefs && [prefs objectForKey:@"noWPzoom"] ? [[prefs valueForKey:@"noWPzoom"] boolValue] : NO );
    isNoiconshakingEnable = (prefs && [prefs objectForKey:@"noshaking"] ? [[prefs valueForKey:@"noshaking"] boolValue] : NO );
    isInstantFolder = (prefs && [prefs objectForKey:@"InstantFolder"] ? [[prefs valueForKey:@"InstantFolder"] boolValue] : NO );
}

//reverse number to make sliders go from left to right lol
static double reverseSpeedSliderValue(double input){
    double total = 0.45;
    return total - input;
}

static double reverseBounceSliderValue(double input){
    double total = 1.1;
    return total - input;
}

static double reverseTurnOffSpeed(double input){
    double total = 0.91;
    return total - input;
}

static double reverseAppSpeedSliderValue(double input){
    double total = 1.0;
    return total - input;
}

static double reverseFolderSliderValue(double input){
    double total = 1.0;
    return total - input;
}


//App Open animation and bouncing
%hook SBFFluidBehaviorSettings
    -(void)setResponse:(double)arg1{ //App open and close speed
        if(isSpeedEnable){
            if(!isFineTuneSpeedEnable){
                //Change speed value base on selector pos
                switch (Speedvalue){
                case 1:
                    %orig(0.37);
                    SwitcherDismiss = 0.2;
                    break;
                case 2: 
                    %orig(0.25);
                    SwitcherDismiss = 0.17;
                    break;
                case 3:
                    %orig(0.19);
                    SwitcherDismiss = 0.15;
                    break;
                case 4:
                    %orig(0.1);
                    SwitcherDismiss = 0.12;
                    break;
                case 5:   
                    %orig(0.07);
                    SwitcherDismiss = 0.1;
                    break;   
                default:
                    %orig;
                    SwitcherDismiss = -1;    
                    break;
                }
            }else{
                //Fine Tune Mode
                %orig(reverseSpeedSliderValue(FineTuneSpeedValue));
                //Check Speed Value and change SpringBoard and Switcher Dismiss speed accordingly
                if (reverseSpeedSliderValue(FineTuneSpeedValue) < 0.4 && reverseSpeedSliderValue(FineTuneSpeedValue) >= 0.37){
                    SwitcherDismiss = 0.2;
                    //SpringboardSpeed = 1.1;
                }else if(reverseSpeedSliderValue(FineTuneSpeedValue) < 0.37 && reverseSpeedSliderValue(FineTuneSpeedValue) >= 0.25){
                    SwitcherDismiss = 0.17;
                    //SpringboardSpeed = 1.3;
                }else if(reverseSpeedSliderValue(FineTuneSpeedValue) < 0.25 && reverseSpeedSliderValue(FineTuneSpeedValue) >= 0.19){
                    SwitcherDismiss = 0.15;
                    //SpringboardSpeed = 1.5;
                }else if(reverseSpeedSliderValue(FineTuneSpeedValue) < 0.19 && reverseSpeedSliderValue(FineTuneSpeedValue) >= 0.1){
                    SwitcherDismiss = 0.12;
                    //SpringboardSpeed = 1.75;
                }else if(reverseSpeedSliderValue(FineTuneSpeedValue) < 0.1){
                    SwitcherDismiss = 0.1;
                    //SpringboardSpeed = 2;                    
                }
            }            
        }else{
            %orig;
            SwitcherDismiss = -1;
            //SpringboardSpeed = -1;
        }
    }
    -(void)setDampingRatio:(double)arg1{ //App open and close bouncing (has a small side effect on iOS 13 and above with stock volume hud)
        if(isBounceEnable){
            if(!isFineTuneBounceEnable){
                switch (Bouncevalue){
                    case 1:
                        %orig(0.9);
                        break;
                    case 2:
                        %orig(0.8);
                        break;
                    case 3:
                        %orig(0.6);
                        break;
                    case 4:
                        %orig(0.4);
                        break;
                    case 5:
                        %orig(0.2);
                        break;
                    default:
                        %orig;
                        break;    
                }
            }else{
                %orig(reverseBounceSliderValue(FineTuneBounceValue));
            }
        }else{
            %orig;
        }
    }

%end

//Springboard speed (mostly for folder but might affect something else on springboard too)
%hook SBFAnimationSettings

    //folder starting speed
    // -(void)setInitialVelocity:(double)arg1{
    //     %orig;
    // }

    // -(void)setSpeed:(double)arg1{
    //     if(isInstantFolder){
    //         %orig(arg1);        
    //     }else{
    //         if (isFolderAnimationEnabled){
    //             %orig(arg1*FolderSpeedValue);
    //         }else{
    //             %orig;
    //         }
    //     }
    // }

    -(void)setDamping:(double)arg1{
        if(isInstantFolder){
            %orig;
        }else{
            if(isFolderAnimationEnabled && isFolderAnimationBounceEnabled){
                %orig(arg1*reverseFolderSliderValue(FolderDampingValue));
            }else{
                %orig;
            }
        }
    }

    //folder mass
    -(void)setMass:(double)arg1{
        if(isInstantFolder){
            %orig(arg1*0.0001);
        }else{
            if(isFolderAnimationEnabled){
                %orig(arg1*reverseFolderSliderValue(FolderMassValue));
            }else{
                %orig;
            }
        }
    }

    // -(void)setStiffness:(double)arg1{
    //     if(isInstantFolder){
    //         %orig;
    //     }else{
    //         if(isFolderAnimationEnabled){
    //             %orig(arg1*FolderStiffnessValue);
    //         }else{
    //             %orig;
    //         }
    //     }
    // }

%end

//In-App animation
%hook CASpringAnimation

    //start speed
    // -(void)setInitialVelocity:(double)arg1{
    //     %orig;
    // }

    //speed
    // - (void)setVelocity:(double)arg1{
    //     if(inAppAnimationEnabled){
    //         %orig(arg1 * VelocityValue);
    //     }else{
    //         %orig(arg1);
    //     }
    // }

    // -(void)setStiffness:(double)arg1{
    //     if(inAppAnimationEnabled){
    //         %orig(arg1 * StiffnessValue);
    //     }else{
    //         %orig(arg1);
    //     }
    // }

    //mass
    -(void)setMass:(double)arg1{ //in app speed
        if(inAppAnimationEnabled && !isOnSpringBoard){
            %orig(arg1 * reverseAppSpeedSliderValue(MassValue));
        }else{
            %orig(arg1);
        }
    }

    -(void)setDamping:(double)arg1{
        if((inAppAnimationEnabled && inAppAnimationBounceEnabled) && !isOnSpringBoard){
            %orig(arg1 * reverseAppSpeedSliderValue(DampingValue));
        }else{
            %orig(arg1);
        }
    }

    // - (void)setDuration:(double)arg1{
    //     if(inAppAnimationEnabled && !isOnSpringBoard){
    //         %orig(arg1 * 0.5);
    //     }else{
    //         %orig(arg1);
    //     }
    // }

%end

//In-App animation 2: electric boogaloo
%hook CAAnimation

    //duration
   - (void)setDuration:(double)arg1{ //more in app speed but with more side effect 
        if ([self isKindOfClass:[CASpringAnimationClass class]]) { //thanks fakeclockup
            %orig(arg1);
            return;
        }
        if(inAppAnimationEnabled){
            %orig(arg1 * reverseAppSpeedSliderValue(DurationValue));
        }else{
            %orig;
        }
    }
    
%end

//Screen Turn On and Off Speed
%hook SBFWakeAnimationSettings
    -(double)backlightFadeDuration{ //Screen turn off speed
        if(isScreensleepEnable){
            return reverseTurnOffSpeed(Screensleepvalue);
        }else{
            return %orig;
        }
    }
    -(double)speedMultiplierForWake{ //Screen turn on speed (might be glitchy)
        if(isScreenwakeEnable){
            return Screenwakevalue;
        }else{
            return %orig;
        }
    }
    -(double)speedMultiplierForLiftToWake{ //Screen turn on speed but for lift to wake (again might be glitchy)
        if(isScreenwakeEnable){
            return Screenwakevalue;
        }else{
            return %orig;
        }
    }
%end

//Extra extra
%hook SBFluidSwitcherAnimationSettings
    -(void)setWallpaperScaleInSwitcher:(double)arg1{ //Switcher wallpaper zoom out
        if(isNoWallZoominSwitcher){
            %orig(1);
        }else{
            %orig;
        }
    }    

    -(void)setHomeScreenScaleInSwitcher:(double)arg1{ //Switcher homescreen zoom out
        if(isNoiconZoominSwitcher){
            %orig(1);
        }else{
            %orig;
        }
    }

    -(double)emptySwitcherDismissDelay{ //Switcher fix when set speed too high
        if (SwitcherDismiss != -1){
            return SwitcherDismiss;
        }else{
            return %orig;
        }
    }
%end

%hook CSCoverSheetTransitionSettings
    -(BOOL)iconsFlyIn{ //fly in icon when unlock
        if(isNoiconflyEnable){
            return 0;
        }else{
            return 1;
        } 
    }	
%end

%hook SBIconView
    -(void)setAllowsEditingAnimation:(BOOL)arg1{//Icon editting jitter
        if (isNoiconshakingEnable){ 
            %orig(NO);
        }else{
            %orig;
        }
    }
%end

%ctor { //More pref
    // NSLog(@"[Speedster] load test");
    CASpringAnimationClass = NSClassFromString(@"CASpringAnimation");
    // SBFAnimationSettingsClass = NSClassFromString(@"SBFAnimationSettings");
    isOnSpringBoard = [[[NSBundle mainBundle] bundleIdentifier] isEqual:@"com.apple.springboard"];
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesthings, CFSTR("com.hoangdus.speedsterprefs-updated"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	preferencesthings();
}

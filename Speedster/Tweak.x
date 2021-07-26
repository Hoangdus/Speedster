#import "Speedster.h"

void preferencesthings(){ //pref
	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.hoangdus.speedsterprefs"];
	isSpeedEnable = (prefs && [prefs objectForKey:@"isSpeedEnable"] ? [[prefs valueForKey:@"isSpeedEnable"] boolValue] : NO );
	isBounceEnable = (prefs && [prefs objectForKey:@"isBounceEnable"] ? [[prefs valueForKey:@"isBounceEnable"] boolValue] : NO );
	isScreenwakeEnable = (prefs && [prefs objectForKey:@"isScreenwakeEnable"] ? [[prefs valueForKey:@"isScreenwakeEnable"] boolValue] : NO );
    isScreensleepEnable = (prefs && [prefs objectForKey:@"isScreensleepEnable"] ? [[prefs valueForKey:@"isScreensleepEnable"] boolValue] : NO );
    isNoiconflyEnable = (prefs && [prefs objectForKey:@"nofly"] ? [[prefs valueForKey:@"nofly"] boolValue] : NO );
	//isNoiconshakingEnable = (prefs && [prefs objectForKey:@"noshaking"] ? [[prefs valueForKey:@"noshaking"] boolValue] : NO );
	Speedvalue = (prefs && [prefs objectForKey:@"Speedvalue"] ? [[prefs valueForKey:@"Speedvalue"] integerValue] : 1 );
    Bouncevalue = (prefs && [prefs objectForKey:@"Bouncevalue"] ? [[prefs valueForKey:@"Bouncevalue"] integerValue] : 1 );
    Screensleepvalue = (prefs && [prefs objectForKey:@"Screensleepvalue"] ? [[prefs valueForKey:@"Screensleepvalue"] integerValue] : 0.9 );
    Screenwakevalue = (prefs && [prefs objectForKey:@"Screenwakevalue"] ? [[prefs valueForKey:@"Screenwakevalue"] integerValue] : 0.9 );
}

%hook SBFFluidBehaviorSettings
    -(void)setResponse:(double)arg1{ //app open and close speed
        if(isSpeedEnable){
            if(Speedvalue == 1){
                %orig(0.2);
            }if(Speedvalue == 2){
                %orig(0.1);
            }if(Speedvalue == 3){
                %orig(0.09);
            }if(Speedvalue == 4){
                %orig(0.08);
            }if(Speedvalue == 5){
                %orig(0.07);
            }
        }else{
            %orig;
        }
    }
    -(void)setDampingRatio:(double)arg1{ //app open and close bouncing (has a small side effect on iOS 13 and above with stock volume hud) 
        if(isBounceEnable){
           if(Bouncevalue == 5){
                %orig(0.2);
            }if(Bouncevalue == 4){
                %orig(0.3);
            }if(Bouncevalue == 3){
                %orig(0.4);
            }if(Bouncevalue == 2){
                %orig(0.5);
            }if(Bouncevalue == 1){
                %orig(0.6);
            }
        }else{
            %orig;
        }
    }
%end

%hook SBFAnimationSettings
    -(void)setSpeed:(double)arg1{ //springboard speed ig
        if(isSpeedEnable){
            if(Speedvalue == 1){
                %orig(1.25);
            }if(Speedvalue == 2){
                %orig(1.5);
            }if(Speedvalue == 3){
                %orig(2);
            }if(Speedvalue == 4){
                %orig(2.25);
            }if(Speedvalue == 5){
                %orig(2.5);
            }
        }else{
            %orig;
        }
    }
%end

%hook SBFWakeAnimationSettings
    -(double)backlightFadeDuration{ //screen turn off speed
        if(isScreensleepEnable){
            return Screensleepvalue;
        }else{
            return %orig;
        }
    }
    -(double)speedMultiplierForWake{ //screen turn on speed
        if(isScreenwakeEnable){
            return Screenwakevalue;
        }else{
            return %orig;
        }
    }    
    -(double)speedMultiplierForLiftToWake{ //screen turn on speed but for lift to wake
        if(isScreenwakeEnable){
            return Screenwakevalue;
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
    -(void)setAllowsJitter:(BOOL)arg1{ //Icon shaking (iOS 12)
        if (isNoiconshakingEnable){
            %orig(NO);
        }else{
            %orig;
        }
    }        
%end

%ctor {
	//more pref
	preferencesthings();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesthings, CFSTR("com.hoangdus.speedsterprefs-updated"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
#import "MultiscreenPlugin.h"
#import <multiscreen/multiscreen-Swift.h>

@implementation MultiscreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMultiscreenPlugin registerWithRegistrar:registrar];
}
@end

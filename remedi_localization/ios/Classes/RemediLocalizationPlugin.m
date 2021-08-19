#import "RemediLocalizationPlugin.h"
#if __has_include(<remedi_localization/remedi_localization-Swift.h>)
#import <remedi_localization/remedi_localization-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "remedi_localization-Swift.h"
#endif

@implementation RemediLocalizationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRemediLocalizationPlugin registerWithRegistrar:registrar];
}
@end

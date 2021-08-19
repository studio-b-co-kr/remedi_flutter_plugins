#import "RemediVimeoPlayerPlugin.h"
#if __has_include(<remedi_vimeo_player/remedi_vimeo_player-Swift.h>)
#import <remedi_vimeo_player/remedi_vimeo_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "remedi_vimeo_player-Swift.h"
#endif

@implementation RemediVimeoPlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRemediVimeoPlayerPlugin registerWithRegistrar:registrar];
}
@end

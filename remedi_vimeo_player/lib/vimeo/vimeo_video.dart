import 'package:remedi_vimeo_player/vimeo/vimeo_error.dart';

class VimeoVideo {
  final bool liveEvent;
  int? width;
  int? height;
  final List<_VimeoQualityFile?> sources;

  VimeoVideo({
    this.liveEvent = false,
    this.width,
    this.height,
    required this.sources,
  });

  factory VimeoVideo.fromJsonAuth(Map<String, dynamic> json) {
    if (json.keys.contains("error")) {
      throw VimeoError.fromJsonAuth(json);
    }

    if (json['embed']?['badges']['live']['streaming'] ?? false) {
      return VimeoVideo(liveEvent: true, sources: []);
    }

    var jsonFiles = (json['files']) as List<dynamic>;
    List<_VimeoQualityFile?> files = List<_VimeoQualityFile?>.from(
        jsonFiles.map<_VimeoQualityFile?>((element) {
      if (element['quality'] != null &&
          element['quality'] != _VimeoQualityFile.hls) {
        return _VimeoQualityFile(
          quality: element['quality'],
          file: VimeoSource(
            height: element['height'],
            width: element['width'],
            fps: element['fps'] is double
                ? element['fps']
                : (element['fps'] as int).toDouble(),
            url: Uri.tryParse(element['link'] as String)!,
          ),
        );
      }
    })).toList();
    return VimeoVideo(
      liveEvent: json['embed']['badges']['live']['streaming'],
      width: json['width'],
      height: json['height'],
      sources: files,
    );
  }

  factory VimeoVideo.fromJsonNoneAuth(Map<String, dynamic> json) {
    if (json.keys.contains("message")) {
      throw VimeoError.fromJsonNoneAuth(json);
    }

    var files = List<_VimeoQualityFile?>.from(json['request']['files']
            ['progressive']
        .map<_VimeoQualityFile?>((element) {
      return _VimeoQualityFile(
        quality: element['quality'],
        file: VimeoSource(
          width: element['width'],
          height: element['height'],
          fps: element['fps'] is double
              ? element['fps']
              : (element['fps'] as int).toDouble(),
          url: Uri.parse(element['url']),
        ),
      );
    })).toList();

    return VimeoVideo(
        liveEvent: (json['video']['live_event'] as bool?) ?? false,
        width: json['video']['width'],
        height: json['video']['height'],
        sources: files);
  }
}

extension ExtensionVimeoVideo on VimeoVideo {
  Uri? get videoUrl {
    return defaultVideo?.url;
  }

  int get size {
    return width! > height! ? width! : height!;
  }

  double get ratio => width! / height!;

  Map<String, String> get resolutions {
    Map<String, String> ret = {};

    for (var q in sources) {
      if (q == null) {
        continue;
      }
      ret.addAll({q.quality: q.file.url.toString()});
    }

    return ret;
  }

  bool get isLive => liveEvent;

  VimeoSource? get defaultVideo {
    VimeoSource? ret = sources.first?.file;
    for (var file in sources) {
      if (file?.file.size == size) {
        ret = file?.file;
        break;
      }
    }
    return ret;
  }
}

class VimeoSource {
  final int height;
  final int width;
  final double fps;
  final Uri url;

  VimeoSource({
    required this.height,
    required this.width,
    required this.fps,
    required this.url,
  });

  factory VimeoSource.fromJson({required bool isLive, required dynamic json}) {
    return VimeoSource(
      height: json['height'],
      width: json['width'],
      fps: json['fps'],
      url: Uri.parse(json['url']),
    );
  }

  int get size => height > width ? height : width;
}

class _VimeoQualityFile {
  static const String qualityLive = "live";
  static const String hd = "hd";
  static const String sd = "sd";
  static const String hls = "hls";
  static const String quality4k = "4k";
  static const String quality8k = "8k";
  static const String quality1440p = "1440p";
  static const String quality1080p = "1080p";
  static const String quality720p = "720p";
  static const String quality540p = "540p";
  static const String quality360p = "360p";
  static const String quality240p = "240p";

  final String quality;
  final VimeoSource file;

  _VimeoQualityFile({
    required this.quality,
    required this.file,
  });
}

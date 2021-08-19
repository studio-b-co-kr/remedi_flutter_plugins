class VimeoError extends Error {
  final String? error;
  final String? link;
  final String? developerMessage;
  final int? errorCode;

  VimeoError({this.error, this.link, this.developerMessage, this.errorCode});

  String toString() {
    if (error != null) {
      return "getting vimeo information failed: ${Error.safeToString(error)}";
    }
    return "getting vimeo information failed";
  }

  factory VimeoError.fromJsonAuth(Map<String, dynamic> json) {
    return VimeoError(
      error: json['error'],
      link: json['link'],
      developerMessage: json['developer_message'],
      errorCode: json['error_code'],
    );
  }

  factory VimeoError.fromJsonNoneAuth(Map<String, dynamic> json) {
    return VimeoError(
      error: json['message'],
      link: null,
      developerMessage: json['title'],
      errorCode: null,
    );
  }
}

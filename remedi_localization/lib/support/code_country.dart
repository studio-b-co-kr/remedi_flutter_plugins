import 'package:remedi_localization/support/code_countrys.dart';

mixin ToAlias {}

@deprecated
class CElement = CountryCode with ToAlias;

/// Country element. This is the element that contains all the information
class CountryCode {
  /// the name of the country
  String? name;

  /// the flag of the country
  String? flagUri;

  /// the country code (IT,AF..)
  String? code;

  /// the dial code (+39,+93..)
  String? dialCode;

  CountryCode({this.name, this.flagUri, this.code, this.dialCode});

  @override
  String toString() => "$dialCode";

  String toLongString() => "$dialCode $name";

  String toCountryStringOnly() => '$name';
}

extension ExtensionCountryCode on String {
  String get countryName {
    var ret = codes.firstWhere((element) => element['code'] == this,
        orElse: () => {});
    if (ret.isEmpty) {
      return "";
    }

    return ret['name'] ?? "";
  }

  String get countryDialCode {
    var ret = codes.firstWhere((element) => element['code'] == this,
        orElse: () => {});
    if (ret.isEmpty) {
      return "";
    }

    return ret['dial_code'] ?? "";
  }

  String get countryFlag {
    return 'flags/${this.toLowerCase()}.png';
  }
}

class KopoModel {
  String? postcode;
  String? postcode1;
  String? postcode2;
  String? postcodeSeq;
  // 13494	국가기초구역번호. 2015년 8월 1일부터 시행될 새 우편번호.
  String? zonecode;
  // 경기 성남시 분당구 판교역로 235	기본 주소 (검색 결과에서 첫줄에 나오는 주소, 검색어의 타입(지번/도로명)에 따라 달라집니다.)
  String? address;
  // 235 Pangyoyeok-ro, Bundang-gu, Seongnam-si, Gyeonggi-do, korea	기본 영문 주소
  String? addressEnglish;
  String? addressType;
  String? bcode;
  String? bname;
  String? bname1;
  String? bname2;
  String? sido;
  String? sigungu;
  String? sigunguCode;
  String? userLanguageType;
  String? query;
  String? buildingName;
  String? buildingCode;
  String? apartment;
  String? jibunAddress;
  String? jibunAddressEnglish;
  String? roadAddress;
  String? roadAddressEnglish;
  String? autoRoadAddress;
  String? autoRoadAddressEnglish;
  String? autoJibunAddress;
  String? autoJibunAddressEnglish;
  String? userSelectedType;
  String? noSelected;
  String? hname;
  String? roadnameCode;
  String? roadname;

  KopoModel(
      {this.postcode,
      this.postcode1,
      this.postcode2,
      this.postcodeSeq,
      this.zonecode,
      this.address,
      this.addressEnglish,
      this.addressType,
      this.bcode,
      this.bname,
      this.bname1,
      this.bname2,
      this.sido,
      this.sigungu,
      this.sigunguCode,
      this.userLanguageType,
      this.query,
      this.buildingName,
      this.buildingCode,
      this.apartment,
      this.jibunAddress,
      this.jibunAddressEnglish,
      this.roadAddress,
      this.roadAddressEnglish,
      this.autoRoadAddress,
      this.autoRoadAddressEnglish,
      this.autoJibunAddress,
      this.autoJibunAddressEnglish,
      this.userSelectedType,
      this.noSelected,
      this.hname,
      this.roadnameCode,
      this.roadname});

  KopoModel.fromJson(Map<String, dynamic> json) {
    postcode = json['postcode'];
    postcode1 = json['postcode1'];
    postcode2 = json['postcode2'];
    postcodeSeq = json['postcodeSeq'];
    zonecode = json['zonecode'];
    address = json['address'];
    addressEnglish = json['addressEnglish'];
    addressType = json['addressType'];
    bcode = json['bcode'];
    bname = json['bname'];
    bname1 = json['bname1'];
    bname2 = json['bname2'];
    sido = json['sido'];
    sigungu = json['sigungu'];
    sigunguCode = json['sigunguCode'];
    userLanguageType = json['userLanguageType'];
    query = json['query'];
    buildingName = json['buildingName'];
    buildingCode = json['buildingCode'];
    apartment = json['apartment'];
    jibunAddress = json['jibunAddress'];
    jibunAddressEnglish = json['jibunAddressEnglish'];
    roadAddress = json['roadAddress'];
    roadAddressEnglish = json['roadAddressEnglish'];
    autoRoadAddress = json['autoRoadAddress'];
    autoRoadAddressEnglish = json['autoRoadAddressEnglish'];
    autoJibunAddress = json['autoJibunAddress'];
    autoJibunAddressEnglish = json['autoJibunAddressEnglish'];
    userSelectedType = json['userSelectedType'];
    noSelected = json['noSelected'];
    hname = json['hname'];
    roadnameCode = json['roadnameCode'];
    roadname = json['roadname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postcode'] = this.postcode;
    data['postcode1'] = this.postcode1;
    data['postcode2'] = this.postcode2;
    data['postcodeSeq'] = this.postcodeSeq;
    data['zonecode'] = this.zonecode;
    data['address'] = this.address;
    data['addressEnglish'] = this.addressEnglish;
    data['addressType'] = this.addressType;
    data['bcode'] = this.bcode;
    data['bname'] = this.bname;
    data['bname1'] = this.bname1;
    data['bname2'] = this.bname2;
    data['sido'] = this.sido;
    data['sigungu'] = this.sigungu;
    data['sigunguCode'] = this.sigunguCode;
    data['userLanguageType'] = this.userLanguageType;
    data['query'] = this.query;
    data['buildingName'] = this.buildingName;
    data['buildingCode'] = this.buildingCode;
    data['apartment'] = this.apartment;
    data['jibunAddress'] = this.jibunAddress;
    data['jibunAddressEnglish'] = this.jibunAddressEnglish;
    data['roadAddress'] = this.roadAddress;
    data['roadAddressEnglish'] = this.roadAddressEnglish;
    data['autoRoadAddress'] = this.autoRoadAddress;
    data['autoRoadAddressEnglish'] = this.autoRoadAddressEnglish;
    data['autoJibunAddress'] = this.autoJibunAddress;
    data['autoJibunAddressEnglish'] = this.autoJibunAddressEnglish;
    data['userSelectedType'] = this.userSelectedType;
    data['noSelected'] = this.noSelected;
    data['hname'] = this.hname;
    data['roadnameCode'] = this.roadnameCode;
    data['roadname'] = this.roadname;
    return data;
  }
}

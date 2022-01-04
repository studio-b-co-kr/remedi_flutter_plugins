<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Toss Payments Flutter plugin.

플러터 앱에서 토스페이먼츠를 사용해서 앱내 결제기능을 구현하고자 하는 분들에게 도움이 되고자 합니다.    
토스페이먼츠에 대한 자세한 사항은 "https://docs.tosspayments.com/" 를 참고해주세요.

## Features

1. 결제창 연동하기 및 웹뷰를 사용한 외부 앱 연동.

## Getting started
외부 앱 연동을 위해서는 각 OS별로 환경 세팅을 해줘야 합니다.

### 1. IOS
  Info.plist에 외부앱 실행을 위한 Scheme 추가.
  
  ```dart
  <key>LSApplicationQueriesSchemes</key>
  <array>
      <string>supertoss</string> <!-- 토스페이 -->
      <string>mpocket.online.ansimclick</string> <!-- 삼성카드앱카드 -->
      <string>hdcardappcardansimclick</string> <!-- 현대카드앱카드 -->
      <string>smhyundaiansimclick</string> <!-- 현대카드공인인증서 -->
      <string>wooripay</string> <!-- 우리카드앱카드 -->
      <string>shinhan-sr-ansimclick</string> <!-- 신한카드앱카드 -->
      <string>smshinhanansimclick</string> <!-- 신한카드공인인증서 -->
      <string>kb-acp</string> <!-- 국민카드앱카드 -->
      <string>lottesmartpay</string> <!-- 롯데카드모바일결제 -->
      <string>lotteappcard</string> <!-- 롯데카드앱카드 -->
      <string>cloudpay</string> <!-- 하나카드앱카드 -->
      <string>nhappvardansimclick</string> <!-- 농협카드-앱카드 -->
      <string>nonghyupcardansimclick</string> <!-- 농협카드공인인증서 -->
      <string>citispay</string> <!-- 씨티카드앱카드 -->
      <string>citicardappkr</string> <!-- 씨티카드공인인증서 -->
      <string>ispmobile</string> <!-- ISP모바일 -->
  </array>
  ```
  
### 3. Android

  #### a. 안드로이드 Min SDK 를 20 이상으로 설정해주세요.
  
  android/app/build.gradle에 defaultConfig
  ```dart
  defaultConfig {
      ...
      minSdkVersion 20
      ...
  }
  ```
  
  #### b. manifest에 외부앱 실행을 위한 scheme 및 permission을 추가해주세요.
  
  android/app/main/AndroidManifest.xml
  ```dart
  <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
  <queries>
      <!-- 토스 -->
      <package android:name="viva.republica.toss" />
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="supertoss" />
      </intent>
      <!-- 삼성카드 -->
      <package android:name="kr.co.samsungcard.mpocket" />
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="mpocket.online.ansimclick" />
      </intent>
      <!-- 현대카드 -->
      <package android:name="com.hyundaicard.appcard" />
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="hdcardappcardansimclick" />
      </intent>
      <!-- 현대카드공인인증서 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="smhyundaiansimclick" />
      </intent>
      <!-- 우리카드앱카드 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="wooripay" />
      </intent>
      <!-- 신한카드앱카드 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="shinhan-sr-ansimclick" />
      </intent>
      <!-- 신한카드공인인증서 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="smshinhanansimclick" />
      </intent>
      <!-- 국민카드앱카드 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="kb-acp" />
      </intent>
      <!-- 롯데카드모바일결제 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="lottesmartpay" />
      </intent>
      <!-- 롯데카드앱카드 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="lotteappcard" />
      </intent>
      <!-- 하나카드앱카드 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="cloudpay" />
      </intent>
      <!-- 농협카드-앱카드 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="nhappvardansimclick" />
      </intent>
      <!-- 농협카드공인인증서 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="nonghyupcardansimclick" />
      </intent>
      <!-- 씨티카드공인인증서 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="citicardappkr" />
      </intent>
      <!-- ISP모바일 -->
      <intent>
          <action android:name="android.intent.action.VIEW" />
          <data android:scheme="ispmobile" />
      </intent>
  </queries>
  ```

## Usage

"PaymentWebView" 을 통해서 결제창과 연동할 수 있습니다.

```dart
PaymentWebView(title: "결제 페이지 타이틀", paymentRequestUrl: Uri.parse("결제 웹 페이지 주소"))
```

## Additional information

#### !!Notice!!
 * example 앱 내에 Mock Server를 Web Page 구현해 두었습니다. 실제로 사용하실 때는 Web Page를 작성하셔서 사용해야 합니다.

##### Roadmap 
  a. Test Code.
  
  b. Etc.

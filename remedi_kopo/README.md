# remedi_kopo

This package is a fork of [kopo](https://pub.dev/packages/kopo) with our hosting for a Front-End where you can search for Korean Postal Address.

## Installation

Add our dependency to your `pubspec.yaml`

```yaml
dependencies:
  remedi_kopo: ^0.0.1
```

## Usage

```dart
import 'package:remedi_kopo/remedi_kopo.dart';

ElevatedButton(
  child: Text('Find Korean Postal Address'),
  onPressed: () async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
  },
),
```

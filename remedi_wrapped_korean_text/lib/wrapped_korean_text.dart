library wrapped_korean_text;

import 'package:flutter/material.dart';

class WrappedKoreanText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLines;

  WrappedKoreanText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.left,
    this.maxLines = 100,
  });

  @override
  State<StatefulWidget> createState() {
    return _WrappedKoreanTextState();
  }
}

class _WrappedKoreanTextState extends State<WrappedKoreanText> {
  /// Special characters to look for, that break original text into paragraphs
  final List _specialCharacters = [
    r'\u000A',
    r'\u000C',
    r'\u000D',
    r'\u0085',
    r'\u2028',
    r'\u2029',
    // r'\n'
  ];

  /// Indexes of special characters in original text
  List<Map<int, dynamic>> _specialCharacterIndexes = [];

  List<List<Text>> _paragraphsList = [];
  int _startIndex = 0;

  @override
  void initState() {
    parceText();
    addParagraphs();

    super.initState();
  }

  void parceText() {
    _specialCharacterIndexes.clear();

    for (var i = 0; i < widget.text.length; i++) {
      for (var ii = 0; ii < _specialCharacters.length; ii++) {
        if (RegExp(_specialCharacters[ii]).hasMatch(widget.text[i])) {
          _specialCharacterIndexes.add({i: _specialCharacters[ii]});
        }
      }
    }

    _specialCharacterIndexes.add({widget.text.length: ''});
  }

  /// Break text into paragraphs, keep line breaks in origianl places and
  /// remove excessive whitespaces
  void addParagraphs() {
    for (Map index in _specialCharacterIndexes) {
      String tempString =
          widget.text.substring(_startIndex, index.keys.single).trim();

      if (RegExp(r'\S+').hasMatch(tempString)) {
        List<String> tempList =
            tempString.replaceAll(RegExp(r'\s+'), ' ').split(' ');
        _paragraphsList.add(tempList
            .map((e) => Text(
                  '$e ',
                  overflow: TextOverflow.ellipsis,
                  style: widget.style,
                  textScaleFactor: 1.0,
                  textAlign: widget.textAlign,
                  maxLines: widget.maxLines,
                ))
            .toList());

        if (index.values.single.isNotEmpty) {
          _paragraphsList.add([Text('')]);
        }
      }

      _startIndex = index.keys.single;
    }
  }

  Widget paragraph(List<Widget> list) {
    return Wrap(
      alignment: (widget.textAlign == TextAlign.center)
          ? WrapAlignment.center
          : WrapAlignment.start,
      children: list,
    );
  }

  Widget wrappedText() {
    return Column(
      crossAxisAlignment: (widget.textAlign == TextAlign.center)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: _paragraphsList.map((e) => paragraph(e)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return wrappedText();
  }
}

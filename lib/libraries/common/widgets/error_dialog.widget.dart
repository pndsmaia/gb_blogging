import 'package:flutter/material.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class ErrorDialogBoti extends StatelessWidget {
  final String errorText;

  const ErrorDialogBoti({
    Key key,
    @required this.errorText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(
        horizontal: _mediaQuery.width(16),
        vertical: _mediaQuery.height(16),
      ),
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: _mediaQuery.height(10)),
              child: Text(
                IntlHelper.i18n(
                  key: 'ERROR',
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _mediaQuery.textScale * 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: _mediaQuery.height(10)),
              child: Icon(Icons.error, size: 70),
            ),
            Container(
              margin: EdgeInsets.only(bottom: _mediaQuery.height(10)),
              child: Text(
                errorText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

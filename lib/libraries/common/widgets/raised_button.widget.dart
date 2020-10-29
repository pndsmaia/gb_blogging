import 'package:flutter/material.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class RaisedButtonBoti extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double fontSize;
  final Color color;

  const RaisedButtonBoti({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.fontSize,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryTools mediaQuery = MediaQueryTools.of(context);
    return Container(
      width: double.infinity,
      height: mediaQuery.height(48),
      child: RaisedButton(
        color: color ?? primaryAcoColor[1200],
        child: Text(
          label,
          style: TextStyle(
              color: primaryColor[100],
              fontSize: fontSize ?? mediaQuery.textScale * 22),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

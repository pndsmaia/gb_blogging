import 'package:flutter/material.dart';

class FlatButtonBoti extends StatelessWidget {
  final String label;
  final Function onPressed;

  const FlatButtonBoti({
    Key key,
    @required this.label,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

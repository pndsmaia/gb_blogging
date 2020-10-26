import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbblogging/libraries/common/colors.dart';

class TextFormFieldBoti extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final String Function(String) validator;
  final String Function(String) onSaved;
  final void Function() onTap;
  final String Function(String) onChanged;
  final int maxLength;
  final bool readOnly;
  final GlobalKey<FormFieldState> keyField;

  final List<TextInputFormatter> inputFormatters;

  TextFormFieldBoti({
    Key key,
    @required this.controller,
    @required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.inputFormatters,
    this.keyField,
    this.suffixIcon,
    this.maxLength,
  }) : super(key: key);

  @override
  _TextFormFieldBotiState createState() => _TextFormFieldBotiState();
}

class _TextFormFieldBotiState extends State<TextFormFieldBoti> {
  FocusNode _focusNode;
  bool _obscureText;

  void _nodeListener() {
    setState(() {});
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _obscureText = widget.obscureText;
    _focusNode.addListener(_nodeListener);

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_nodeListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.keyField,
      inputFormatters: widget.inputFormatters,
      focusNode: _focusNode,
      controller: widget.controller,
      validator: widget.validator,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      style: TextStyle(
        color: _focusNode.hasFocus ? primaryColor[100] : primaryColor[200],
      ),
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      cursorColor: primaryColor[100],
      decoration: InputDecoration(
        errorStyle: TextStyle(color: secondaryColor[200]),
        prefixStyle: TextStyle(
          color: primaryColor[200],
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _focusNode.hasFocus ? primaryColor[100] : primaryColor[200],
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(
                widget.prefixIcon,
                color:
                    _focusNode.hasFocus ? primaryColor[100] : primaryColor[200],
              ),
        suffixIcon: widget.suffixIcon ??
            (widget.obscureText == false
                ? null
                : GestureDetector(
                    onTap: () => setState(() => _obscureText = !_obscureText),
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: _focusNode.hasFocus
                          ? primaryColor[100]
                          : primaryColor[200],
                    ),
                  )),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor[200],
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor[100]),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

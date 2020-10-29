import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/widgets/raised_button.widget.dart';
import 'package:gbblogging/libraries/common/widgets/text_field_white_bg.widget.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class AddEditNewsModalBoti extends StatefulWidget {
  final String title;
  final GlobalKey<FormState> formKey;
  final TextEditingController newsController;
  final Function onPressed;

  const AddEditNewsModalBoti({
    Key key,
    @required this.title,
    @required this.formKey,
    @required this.newsController,
    @required this.onPressed,
  }) : super(key: key);
  @override
  _AddEditNewsModalBotiState createState() => _AddEditNewsModalBotiState();
}

class _AddEditNewsModalBotiState extends State<AddEditNewsModalBoti> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryTools _mediaQuery = MediaQueryTools.of(context);
    return Container(
      child: Column(
        children: [
          _addNewsTitle(_mediaQuery, widget.title),
          _newsForm(_mediaQuery),
          _saveButton(_mediaQuery),
        ],
      ),
    );
  }

  Widget _addNewsTitle(MediaQueryTools mediaQuery, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: mediaQuery.height(10)),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700, color: primaryColor[400]),
      ),
    );
  }

  Widget _newsForm(MediaQueryTools mediaQuery) {
    return Form(
      key: widget.formKey,
      child: Container(
          child: TextFormFieldWhiteBGBoti(
        maxLines: 3,
        labelText: IntlHelper.i18n(key: 'WRITE_NEWS'),
        controller: widget.newsController,
        maxLength: 280,
        inputFormatters: [
          LengthLimitingTextInputFormatter(280),
        ],
        validator: (text) {
          if (text.length < 3 || text.isEmpty || text.length > 280)
            return IntlHelper.i18n(key: 'WRITE_NEWS_ERROR');
          return null;
        },
      )),
    );
  }

  Widget _saveButton(MediaQueryTools mediaQuery) {
    return Container(
      height: mediaQuery.height(30),
      width: mediaQuery.width(100),
      margin: EdgeInsets.only(top: mediaQuery.height(10)),
      child: RaisedButtonBoti(
        label: IntlHelper.i18n(key: 'SAVE'),
        fontSize: mediaQuery.textScale * 16,
        color: primaryColor[400],
        onPressed: widget.onPressed,
      ),
    );
  }
}

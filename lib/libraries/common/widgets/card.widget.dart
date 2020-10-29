import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/constants.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';
import 'package:intl/intl.dart';

class CardWidgetBoti extends StatefulWidget {
  final String imgUrl;
  final String descriptionText;
  final String userName;
  final DateTime date;
  final bool dropdown;
  final List<DropdownMenuItem<String>> dropdownItems;
  final Function(String value) onChanged;

  const CardWidgetBoti({
    Key key,
    @required this.imgUrl,
    @required this.descriptionText,
    @required this.userName,
    @required this.date,
    this.dropdown = false,
    this.dropdownItems,
    this.onChanged,
  }) : super(key: key);

  @override
  _CardWidgetBotiState createState() => _CardWidgetBotiState();
}

class _CardWidgetBotiState extends State<CardWidgetBoti> {
  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: _mediaQuery.height(20)),
      padding: EdgeInsets.symmetric(
        vertical: _mediaQuery.height(10),
        horizontal: _mediaQuery.width(14),
      ),
      height: _mediaQuery.height(150),
      decoration: BoxDecoration(
        color: primaryColor[400],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 1),
            color: primaryColor[200],
          ),
          BoxShadow(
            blurRadius: 2,
            offset: Offset(1, 0),
            color: primaryColor[200],
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader(_mediaQuery),
          _descriptionText(_mediaQuery, text: widget.descriptionText),
        ],
      ),
    );
  }

  Widget _cardHeader(MediaQueryTools mediaQuery) {
    return Container(
      margin: EdgeInsets.only(bottom: mediaQuery.height(10)),
      child: Row(
        children: [
          _profileImage(mediaQuery),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userName(mediaQuery, name: widget.userName),
              _datePost(mediaQuery, date: widget.date),
            ],
          ),
          Spacer(),
          if (widget.dropdown) _dropdownButton(mediaQuery),
        ],
      ),
    );
  }

  Widget _profileImage(MediaQueryTools mediaQuery) {
    return Container(
      width: mediaQuery.width(50.0),
      height: mediaQuery.height(50.0),
      margin: EdgeInsets.only(right: mediaQuery.width(10)),
      child: CachedNetworkImage(
        imageUrl: widget.imgUrl,
        imageBuilder: (_, imgProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imgProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(backgroundColor: primaryColor[100]),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: primaryColor[200],
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(BOTI_LOGO), scale: 15),
          ),
        ),
      ),
    );
  }

  Widget _userName(MediaQueryTools mediaQuery, {@required String name}) {
    return Container(
      margin: EdgeInsets.only(bottom: mediaQuery.height(3)),
      child: Text(name,
          style: TextStyle(
            color: primaryColor[100],
            fontSize: mediaQuery.textScale * 16,
          )),
    );
  }

  Widget _datePost(MediaQueryTools mediaQuery, {@required DateTime date}) {
    return Text(
      DateFormat('dd/MM/yyyy').format(date),
      style: TextStyle(
        color: secondaryColor[200],
        fontSize: mediaQuery.textScale * 14,
      ),
    );
  }

  Widget _descriptionText(MediaQueryTools mediaQuery, {@required String text}) {
    return Container(
      height: mediaQuery.height(60),
      child: SingleChildScrollView(
          child: Text(
        text,
        style: TextStyle(
          color: primaryColor[100],
          fontSize: mediaQuery.textScale * 14,
        ),
      )),
    );
  }

  Widget _dropdownButton(MediaQueryTools mediaQuery) {
    return DropdownButton(
      icon: Icon(
        Icons.more_vert,
        color: primaryColor[100],
      ),
      underline: Text(''),
      items: widget.dropdownItems,
      onChanged: widget.onChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/login/ui/sign_up/sign_up.viewmodel.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/constants.dart';
import 'package:gbblogging/libraries/common/widgets/raised_button.widget.dart';
import 'package:gbblogging/libraries/common/widgets/text_field.widget.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpViewmodel _viewmodel = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);
    final AppBar appBar = AppBar(
      backgroundColor: primaryColor[400],
      elevation: 0,
      centerTitle: true,
      title: Text(IntlHelper.i18n(key: 'REGISTER')),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor[400],
          width: double.infinity,
          height: _mediaQuery.height(577),
          padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logo(_mediaQuery),
              Spacer(),
              _form(_mediaQuery),
              _registerButton(_mediaQuery),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo(MediaQueryTools mediaQuery) {
    return Container(
      width: mediaQuery.width(100),
      margin: EdgeInsets.only(top: mediaQuery.height(50)),
      child: Image.asset(BOTI_LOGO),
    );
  }

  Widget _form(MediaQueryTools mediaQuery) {
    return Container(
      margin: EdgeInsets.only(top: mediaQuery.height(20)),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: mediaQuery.height(10)),
              child: TextFormFieldBoti(
                controller: _emailController,
                labelText: IntlHelper.i18n(key: 'EMAIL'),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || !text.contains(EMAIL_REGEXP))
                    return IntlHelper.i18n(key: 'EMAIL_ERROR');
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: mediaQuery.height(10)),
              child: TextFormFieldBoti(
                controller: _nameController,
                labelText: IntlHelper.i18n(key: 'NAME'),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || text.length < 2)
                    return IntlHelper.i18n(key: 'FIELD_ERROR');
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: mediaQuery.height(10)),
              child: TextFormFieldBoti(
                controller: _passwordController,
                labelText: IntlHelper.i18n(key: 'PASSWORD'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: (text) {
                  if (text.isEmpty ||
                      text.length < 6 ||
                      text != _passwordController.text)
                    return IntlHelper.i18n(key: 'PASSWORD_ERROR');
                  return null;
                },
              ),
            ),
            TextFormFieldBoti(
              controller: _rePasswordController,
              labelText: IntlHelper.i18n(key: 'RE_PASSWORD'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (text) {
                if (text.isEmpty ||
                    text.length < 6 ||
                    text != _passwordController.text)
                  return IntlHelper.i18n(key: 'PASSWORD_ERROR');
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerButton(MediaQueryTools mediaQuery) {
    return Container(
      margin: EdgeInsets.only(
          top: mediaQuery.height(50), bottom: mediaQuery.height(50)),
      child: RaisedButtonBoti(
        label: IntlHelper.i18n(key: 'REGISTER'),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _viewmodel.setUserModel(
              name: _nameController.text,
              email: _emailController.text,
              pass: _passwordController.text,
            );
            if (await _viewmodel.signUp()) {
              Modular.to.pushReplacementNamed('/login/home');
            } else {
              print('erro cadastro');
            }
          }
        },
      ),
    );
  }
}

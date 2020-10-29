import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/login/ui/login.viewmodel.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/constants.dart';
import 'package:gbblogging/libraries/common/widgets/error_dialog.widget.dart';
import 'package:gbblogging/libraries/common/widgets/flat_button.widget.dart';
import 'package:gbblogging/libraries/common/widgets/raised_button.widget.dart';
import 'package:gbblogging/libraries/common/widgets/text_field.widget.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewmodel _viewmodel = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor[400],
          width: double.infinity,
          height: _mediaQuery.heightPercent(100),
          padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logo(_mediaQuery),
              _form(_mediaQuery),
              _loginButton(_mediaQuery),
              _registerButton(_mediaQuery),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo(MediaQueryTools mediaQuery) {
    return Container(
      width: mediaQuery.width(200),
      child: Image.asset(BOTI_LOGO_NAME),
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
            TextFormFieldBoti(
              controller: _passwordController,
              labelText: IntlHelper.i18n(key: 'PASSWORD'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6)
                  return IntlHelper.i18n(key: 'PASSWORD_ERROR');
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(MediaQueryTools mediaQuery) {
    return Container(
      margin: EdgeInsets.only(top: mediaQuery.height(50)),
      child: RaisedButtonBoti(
        label: IntlHelper.i18n(key: 'SIGN_IN'),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            try {
              if (await _viewmodel.signIn(
                email: _emailController.text,
                password: _passwordController.text,
              )) {
                Modular.to.pushReplacementNamed('/login/home');
              }
            } catch (e) {
              showDialog(
                  context: context,
                  builder: (_) {
                    switch (e.toString()) {
                      case 'password is invalid':
                        return ErrorDialogBoti(
                          errorText: IntlHelper.i18n(key: 'PASSWORD_INVALID'),
                        );
                        break;
                      default:
                      return ErrorDialogBoti(
                          errorText: IntlHelper.i18n(key: 'GENERIC_ERROR'),
                        );
                    }
                  });
            }
          }
        },
      ),
    );
  }

  Widget _registerButton(MediaQueryTools mediaQuery) {
    return FlatButtonBoti(
      label: IntlHelper.i18n(key: 'SIGN_UP'),
      onPressed: () {
        Modular.to.pushNamed('/login/signup');
      },
    );
  }
}

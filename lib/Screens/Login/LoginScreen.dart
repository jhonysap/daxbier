import 'package:daxbier_app/Blocs/LoginBloc.dart';
import 'package:daxbier_app/Models/UserModels.dart';
import 'package:daxbier_app/Screens/Home/HomePage.dart';
import 'package:daxbier_app/Widgets/InputField.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'SignPage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 79, 79),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 200,
                  ),
                  InputField(
                    icon: Icons.person_outline,
                    hint: "E-mail",
                    obscure: false,
                    stream: _loginBloc.outEmail,
                    onChanged: _loginBloc.changeEmail,
                  ),
                  InputField(
                    icon: Icons.lock_outline,
                    hint: "Senha",
                    obscure: true,
                    stream: _loginBloc.outPass,
                    onChanged: _loginBloc.changePass,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
//                        if (_emailController.text.isEmpty)
//                          _scaffoldKey.currentState.showSnackBar(SnackBar(
//                            content: Text("Insira seu email para Recuperação"),
//                            backgroundColor: Colors.redAccent,
//                            duration: Duration(seconds: 2),
//                          ));
//                        else{
//                      model.recoverPass(_emailController.text);
//                      _scaffoldKey.currentState.showSnackBar(
//                          SnackBar(content: Text("Link de restauração da senha enviado para seu email"),
//                            backgroundColor: Theme.of(context).primaryColor,
//                            duration: Duration(seconds: 2),)
//                      );
//                        }
                        },
                        child: Text(
                          "Esqueci Minha Senha",
                          textAlign: TextAlign.right,
                        ),
                        textColor: Colors.white,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  StreamBuilder<bool>(
                      stream: _loginBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text("Entrar", style: TextStyle(fontSize: 30),),
                          textColor: Colors.white,
                          onPressed: snapshot.hasData ? _loginBloc.submit :  null,
                          disabledColor: Color.fromARGB(100, 47,79,79),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

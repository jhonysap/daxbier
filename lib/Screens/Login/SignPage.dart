import 'package:daxbier_app/Models/UserModels.dart';
import 'package:daxbier_app/Screens/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nickController = TextEditingController();
  final _passController = TextEditingController();
  final _pass1Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Criar Conta"),
          centerTitle: true,
          actions: <Widget>[
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              if(model.isLoading)
                return Center(child: CircularProgressIndicator(),);
              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(15.0),
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    SizedBox(
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: ("Nome Completo"),
                        ),
                        validator: (text){
                          if(text.isEmpty) return "Nome inválido";
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: ("E-mail"),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text){
                        if(text.isEmpty || !text.contains("@")) return "E-mail inválido";
                      },
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      child: TextFormField(
                        controller: _nickController,
                        decoration: InputDecoration(
                          hintText: ("Digite um Nick"),
                        ),
                        validator: (text){
                          if(text.isEmpty) return "Nick inválida";
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(
                          hintText: ("Digite uma senha")
                      ),
                      obscureText: true,
                      validator: (text){
                        if(_passController.text.isEmpty) return "Senha Inválida";
                        if(text.length < 6 || text.length > 15) return "Senha precisa ter entre 6 e 15 Caracteres";
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _pass1Controller,
                      decoration: InputDecoration(
                          hintText: ("Confirme a senha")
                      ),
                      obscureText: true,
                      validator: (text){
                        if(text.isEmpty) return "Senha Inválida";
                        if(_passController.text != _pass1Controller.text) return "Senhas não conferem";
                        if(text.length < 6 || text.length > 15) return "Senha precisa ter entre 6 e 15 Caracteres";
                      },
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        child: Text("Criar Conta",
                          style: TextStyle(
                              fontSize: 18.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: (){ //Aqui é onde acontece a ação do cadastrar
                          if(_formKey.currentState.validate()){
                            Map<String, dynamic> userData = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              "nick": _nickController.text
                            };

                            model.signUp(
                                userData: userData,
                                pass: _passController.text,
                                onSucess: _onSuccess,
                                onFail: _onFail
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
        )
    );
  }
  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Usuário criado com Sucesso!!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),)
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar usuário!!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }
}

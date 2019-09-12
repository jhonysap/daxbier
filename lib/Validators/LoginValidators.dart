import 'dart:async';

class LoginValidators {
  final validadeEmail = StreamTransformer<String, String>.fromHandlers(
  handleData: (email, sink){
    if(email.contains("@")){
      sink.add(email);
    }else{
      sink.addError("E-mail inválido");
    }
  }
  );
  final validadePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink){
        if(pass.length > 6){
          sink.add(pass);
        }else{
          sink.addError("Senha deve conter entre 6 e 15 Caracteres!!");
        }
      }
  );
}
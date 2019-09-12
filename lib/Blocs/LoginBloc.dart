import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:daxbier_app/Validators/LoginValidators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

class LoginBloc extends BlocBase with LoginValidators{

  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();

  Stream<String> get outEmail => _emailController.stream.transform(validadeEmail);
  Stream<String> get outPass => _passController.stream.transform(validadePass);
  Stream<LoginState> get outLoginState => _stateController.stream;

  Stream<bool> get outSubmitValid => Observable.combineLatest2(
      outEmail, outPass, (a, b) => true
  );

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;

  LoginBloc(){
    FirebaseAuth.instance.onAuthStateChanged.listen((user){
      if(user != null){
        print("Logouuuuu");
        FirebaseAuth.instance.signOut();
      }else{
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  void submit(){
    final email = _emailController.value;
    final pass = _passController.value;

    _stateController.add(LoginState.LOADING);

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass
    ).catchError((e){
      _stateController.add(LoginState.FAIL);
    });
  }

  @override
  void dispose() {
    _emailController.close();
    _passController.close();
    _stateController.close();
  }

}
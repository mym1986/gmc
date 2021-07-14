import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_gmcwallet/Bloc/auth_bloc/auth_event.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/login_event.dart';
import 'package:flutter_gmcwallet/Bloc/login_bloc/login_state.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  final _userRepository = UserRepository();

  //LoginBloc(LoginState initialState) : super(initialState);

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      // : assert(userRepository != null),
      : assert(authenticationBloc != null),
        super(null);

  
  LoginState get initialState => LoginInitial();
  
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final user = await _userRepository.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: "Someting very weird just happened");
      }
    } 
  }
}

AuthenticationEvent LoggedIn({String user}) {}

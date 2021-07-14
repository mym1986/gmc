import 'package:bloc/bloc.dart';
import 'package:flutter_gmcwallet/Bloc/Signup_bloc/Signup_event.dart';
import 'package:flutter_gmcwallet/Bloc/Signup_bloc/Signup_state.dart';

import 'package:flutter_gmcwallet/Bloc/auth_bloc/auth.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';

// class SignUpBlocd extends Bloc<SignUpEvent,SignUpState>{
//   final UserRepository userRepository;
//   final AuthenticationBloc authenticationBloc;

//   SignUpBlocd(this.userRepository, this.authenticationBloc)
//   : assert(userRepository != null),
//    assert(authenticationBloc != null),
//    super(SignUpInitial());

//   @override
//   Stream<SignUpState> mapEventToState(SignUpEvent event) {
//     throw UnimplementedError();
//   }
// }

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({this.userRepository, this.authenticationBloc})
      // : assert(userRepository != null),
      : assert(authenticationBloc != null),
        super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpEmailChanged) {
      yield* signUpEmailChangedToState(event);
    } else if (event is SignUpPhoneNumberPressed) {
      yield* signUpPhoneNumberPressedToState(event);
    } else if (event is SignUpPasswordChanged) {
      yield* signUpPasswordChangedToState(event);
    } else if (event is SignUpButtonPressed) {
      yield* signUpButtonPressedToState(event);
    }
  }

  Stream<SignUpState> signUpPhoneNumberPressedToState(
      SignUpEvent event) async* {
    if (event is SignUpPhoneNumberPressed) {
      yield SignUpLoading();
      try {
        final user = await userRepository.phoneNumber(event.phoneNumber);
        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }

  Stream<SignUpState> signUpButtonPressedToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();
      try {
        final user = await userRepository.signUp(event.email, event.password,
            event.phoneNumber, event.confirmPassword);
        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }

  Stream<SignUpState> signUpEmailChangedToState(
      SignUpEmailChanged event) async* {
    try {
      yield SignUpLoading();
      // final resp = await this.userRepository.signup();
      // final signUps = resp.map<Todo>(error) => Todo.fromJson(eorro),).toList();
      yield SignUpSuccess();
    } catch (error) {
      yield SignUpFailure(error: error.toString());
    }
  }

  Stream<SignUpState> signUpPasswordChangedToState(
      SignUpPasswordChanged event) async* {
     try {
      yield SignUpLoading();
      // final resp = await this.userRepository.signup();
      // final signUps = resp.map<Todo>(error) => Todo.fromJson(eorro),).toList();
      yield SignUpSuccess();
    } catch (error) {
      yield SignUpFailure(error: error.toString());
    }
  }
}
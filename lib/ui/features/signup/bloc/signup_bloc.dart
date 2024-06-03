import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../model/signup_model.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupInitial(signUpModel: SignUpModel())) {
    on<SignupReset>((event, emit) {
      emit(const SignupInitial(signUpModel: SignUpModel()));
    });

    on<SignupAttempt>((event, emit) {
      emit(const SignupLoadingState(signUpModel: SignUpModel()));
    });
  }

  Future<bool> signUp(
      {required String login,
      required String password,
      required String confirmPassword,
      required String firstName,
      required String secondName,
      required String phoneNumber}) async {
    add(SignupAttempt());

    try {
      SignUpModel signUpModel = SignUpModel(
          login: login,
          password: password,
          confirmPassword: confirmPassword,
          firstName: firstName,
          secondName: secondName,
          phoneNumber: phoneNumber);

      final fireStore = FirebaseFirestore.instance;

      await fireStore.collection('users').count().query.get().then((value) {
        log(signUpModel.login);
        log('users count: ${value.size}');
      });

      return Future.delayed(const Duration(seconds: 2), () {
        add(SignupReset());
        return false;
      });
    } catch (e) {
      add(SignupReset());
      return Future.error(e);
    }
  }
}

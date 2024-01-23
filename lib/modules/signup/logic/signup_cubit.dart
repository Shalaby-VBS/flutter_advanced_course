import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced/modules/signup/data/models/signup_request_body.dart';
import 'package:flutter_advanced/modules/signup/logic/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repos/signup_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          passwordConfirmation: confirmPasswordController.text,
          gender: 0,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (errorHandler) {
        emit(SignupState.error(error: errorHandler.apiErrorModel.message ?? 'Unhandled Error!'));
      },
    );
  }
}

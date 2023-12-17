import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_state.dart';

class ToggleObscureTextCubit extends Cubit<ToggleObscureTextState> {
  ToggleObscureTextCubit() : super(const ToggleObscureTextState(false));

  void toggleObscureText() {
    emit(ToggleObscureTextState(!state.value));
  }
}

class ToggleRememberMeCubit extends Cubit<ToggleRememberMeState> {
  ToggleRememberMeCubit() : super(const ToggleRememberMeState(false));

  void toggleRememberMe() {
    emit(ToggleRememberMeState(!state.value));
  }
}
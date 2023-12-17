import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(const ToggleState(false));

  void toggle() {
    emit(ToggleState(!state.value));
  }
}

class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(const RememberMeState(false));

  void toggle() {
    emit(RememberMeState(!state.value));
  }
}

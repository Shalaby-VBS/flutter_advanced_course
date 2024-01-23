import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/modules/login/logic/toggle_cubit/toggle_cubit.dart';
import 'package:flutter_advanced/modules/signup/ui/screens/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home/ui/screens/home_screen.dart';
import '../../modules/login/logic/login_cubit.dart';
import '../../modules/login/logic/toggle/toggle_cubit.dart';
import '../../modules/login/ui/screens/login_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/signup/logic/signup_cubit.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // MARK: - This arguments variable is used to pass data between routes.
    final arguments = settings.arguments;

    // MARK: - This switch statement is used to navigate between routes.
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>(create: (BuildContext context) => getIt<LoginCubit>()),
              BlocProvider<ToggleRememberMeCubit>(create: (BuildContext context) => getIt<ToggleRememberMeCubit>()),
              BlocProvider<ToggleObscureTextCubit>(create: (BuildContext context) => getIt<ToggleObscureTextCubit>()),
            ],
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SignupCubit>(create: (BuildContext context) => getIt<SignupCubit>()),
              BlocProvider<ToggleObscureTextCubit>(create: (BuildContext context) => getIt<ToggleObscureTextCubit>()),
            ],
            child: const SignupScreen()));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

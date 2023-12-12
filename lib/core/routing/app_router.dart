import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/modules/login/logic/toggle_cubit/toggle_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/login/ui/screens/login_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // This arguments variable is used to pass data between routes
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<ToggleCubit>(
                      create: (BuildContext context) => ToggleCubit()),
                  BlocProvider<RememberMeCubit>(
                      create: (BuildContext context) => RememberMeCubit()),
                ], child: const LoginScreen()));
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

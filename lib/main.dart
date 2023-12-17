import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';

import 'doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
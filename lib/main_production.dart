import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doc_app.dart';

void main() async{
  setupGetIt();
  // MARK: - Fixing 'flutter_screenutil' bug of hidden texts in release mode.
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green,
    statusBarColor: Colors.green,
  ));
  runApp(DocApp(appRouter: AppRouter()));
}
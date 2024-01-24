import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doc_app.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.blue,
  ));
  runApp(DocApp(appRouter: AppRouter()));
}
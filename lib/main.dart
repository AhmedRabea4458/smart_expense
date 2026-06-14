import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

return MaterialApp.router(
  title: 'Smart Expense',
  theme: AppTheme.dark,
  routerConfig: appRouter,
  debugShowCheckedModeBanner: false,

  useInheritedMediaQuery: true,

  locale: const Locale('ar'),

  supportedLocales: const [
    Locale('ar'),
  ],

  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],

  builder: DevicePreview.appBuilder,
);
  }
}
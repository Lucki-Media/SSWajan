import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s_s_wajan/screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import '../provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_s_wajan/utils/app_strings.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/background_decoration.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import 'l10n/l10n.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Locale _locale = ref.watch(localProvider);
    return MaterialApp(
      supportedLocales: L10N.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ], // AppLocalizations.delegates will also work
      locale: _locale,
      debugShowCheckedModeBanner: false,
      title: AppStrings.kAppName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SplashView(
          backgroundImageDecoration: BackgroundImageDecoration(image: AssetImage('assets/images/splash.png'),fit: BoxFit.cover),
          showStatusBar: true,
          logo: Image.asset('assets/images/full_logo.png',height: 250,),
          done: Done(
            curve : Curves.easeOutCirc,
              HomePage() ,
          ),
        ),
      ),
    );
  }
}

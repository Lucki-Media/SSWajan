import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s_s_wajan/screens/error_screen.dart';
import 'package:s_s_wajan/screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:s_s_wajan/screens/new_home_page.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import 'package:s_s_wajan/utils/app_font_styles.dart';
import '../provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_s_wajan/utils/app_strings.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/background_decoration.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import 'l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(ProviderScope(
      child: const MyApp()));
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
    /*  home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SplashView(
          backgroundImageDecoration: BackgroundImageDecoration(image: AssetImage('assets/images/image 2.png'),fit: BoxFit.cover),
          showStatusBar: true,
          // logo: Image.asset('assets/images/full_logo.png',height: 250,),
          // done: Done(
          //   curve : Curves.easeOutCirc,
          //   HomePage() ,
          // ),
        ),
      ),*/
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigateToNext();
    // TODO: implement initState
    super.initState();

  }

  navigateToNext(){
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NewHomePage(),));
      print('One second has passed.'); // Prints after 1 second.
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          Image.asset('assets/images/image 2.png',height: double.infinity,
            width: double.infinity,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/splashLogo.png',scale: 4.0,)),
              SizedBox(height: 20,),
              Text('Steel Weight',style: AppFontStyles.splashText(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 1,width: 30,decoration: BoxDecoration(color: AppColors.kWhite),),
                  SizedBox(width: 4,),
                  Text('Calculator',style: AppFontStyles.splashSubText(),),
                  SizedBox(width: 4,),
                  Container(height: 1,width: 30,decoration: BoxDecoration(color: AppColors.kWhite),),
                ],
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Powered by ',
                      style: AppFontStyles.splashSubText(fontSize: 10, color: AppColors.kMidGrey,fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: 'Lucki media',
                      style: AppFontStyles.splashSubText(fontSize: 10, color: AppColors.kMidGrey,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}


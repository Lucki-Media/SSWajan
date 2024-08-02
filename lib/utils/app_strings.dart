import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AppStrings {


 // static const String kAppName = 'S.S. WAJAN';
  static const String kAppName = 'Steel Weight Calculator';
  static const String kPoweredBy  = 'Powered By ';
  static const String kPrithviSteel = 'Prithvi Steel';
  static const String kAhmedabad = '(Ahmedabad)';

  static List<String> getSteelList(BuildContext context) {
    return [
      AppLocalizations.of(context)!.kTitle1,
      AppLocalizations.of(context)!.kTitle2,
      AppLocalizations.of(context)!.kTitle3,
      AppLocalizations.of(context)!.kTitle4,
      AppLocalizations.of(context)!.kTitle5,
      AppLocalizations.of(context)!.kTitle6,
      AppLocalizations.of(context)!.kTitle7,
      AppLocalizations.of(context)!.kTitle8,
      AppLocalizations.of(context)!.kTitle9,
      AppLocalizations.of(context)!.kTitle10,
      AppLocalizations.of(context)!.kTitle11,
    ];
  }

  static const List<String> imageList = [
    'assets/images/1.svg',
    'assets/images/2.svg',
    'assets/images/3.svg',
    'assets/images/4.svg',
    'assets/images/5.svg',
    'assets/images/6.svg',
    'assets/images/7.svg',
    'assets/images/8.svg',
    'assets/images/9.svg',
    'assets/images/10.svg',
    'assets/images/11.svg',
  ];
  static List<String> getSteelList1(BuildContext context) {
    return [
      AppLocalizations.of(context)!.kTitle1,
      AppLocalizations.of(context)!.kTitle7,
      AppLocalizations.of(context)!.kTitle2,
      AppLocalizations.of(context)!.kTitle4,
      AppLocalizations.of(context)!.kTitle8,
      AppLocalizations.of(context)!.kTitle3,
      AppLocalizations.of(context)!.kTitle6,
      AppLocalizations.of(context)!.kTitle5,
      AppLocalizations.of(context)!.kTitle9,
      AppLocalizations.of(context)!.kTitle10,
      AppLocalizations.of(context)!.kTitle11,
    ];
  }
}
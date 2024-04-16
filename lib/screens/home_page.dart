import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import 'package:s_s_wajan/utils/app_font_styles.dart';
import 'package:s_s_wajan/utils/common_textformfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/locale_provider.dart';
import '../utils/App_commom_widget.dart';
import '../utils/app_strings.dart';
import '../utils/arrow_container.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final provider = ref.watch(localProvider);
      return Scaffold(
        backgroundColor: AppColors.kLightGrey,
        appBar: AppBar(
          backgroundColor: AppColors.kBlack.withOpacity(.60),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              'assets/images/app_logo.png',
            ),
          ),
          centerTitle: true,
          title: Text(
            AppStrings.kAppName,
            style: AppFontStyles.headlineLarge(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                  onTap: () {
                    ref.read(localProvider.notifier).toggleLocale();
                    print(provider);
                  },
                  child: provider.languageCode == 'en'
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/mode_comment.png',
                              scale: 3.2,
                            ),
                            Text(
                              'हिं',
                              style: AppFontStyles.bodyMedium(
                                  color: AppColors.kWhite),
                            )
                          ],
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/mode_comment.png',
                              scale: 3.2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'En',
                                style: AppFontStyles.bodyMedium(
                                    color: AppColors.kWhite),
                              ),
                            )
                          ],
                        )),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                calc1(context),
                AppCommonWidget.appDivider(),
                calc2(context),
              ],
            ),
          ),
        ),
      );
    });
  }


  Widget calc1 (BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle1,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kOD,
                )),
            SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kThickness,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kPerFeet,
                )),
            SizedBox(width: 8,),
            Icon(Icons.close),
            SizedBox(width: 8,),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kNumber,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        SizedBox(
          height: 5,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswer,
        ),
      ],
    );
  }
  Widget calc2 (BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle2,
        ),
        SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kDia,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kPerFeet,
                )),
            SizedBox(width: 8,),
            Icon(Icons.close),
            SizedBox(width: 8,),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kNumber,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        SizedBox(
          height: 5,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswer,
        ),
      ],
    );
  }
}

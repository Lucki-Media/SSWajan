import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import 'package:s_s_wajan/utils/app_font_styles.dart';
import 'package:s_s_wajan/utils/common_textformfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/aluminium_pipe_calc.dart';
import '../provider/brass_copper_pipe_calc.dart';
import '../provider/flatbar_weight_calc.dart';
import '../provider/hexagonal_bar_weight_calc.dart';
import '../provider/locale_provider.dart';
import '../provider/pip_weight_calc.dart';
import '../provider/roundbar_weight_calc.dart';
import '../provider/sheetbar_weight_calc.dart';
import '../provider/squarebar_weight_calc.dart';
import '../provider/ss_circle_calc.dart';
import '../provider/ss_patti_calc.dart';
import '../provider/ss_square_feet_converter.dart';
import '../provider/ss_square_rect_calc.dart';
import '../utils/App_commom_widget.dart';
import '../utils/app_strings.dart';
import '../utils/arrow_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController pipeODController = TextEditingController();
  final TextEditingController pipeThicknessController = TextEditingController();
  final TextEditingController pipeNumberController = TextEditingController();

  final TextEditingController ssSquareRectSize1Controller = TextEditingController();
  final TextEditingController ssSquareRectSize2Controller = TextEditingController();
  final TextEditingController ssSquareRectThicknessController = TextEditingController();
  final TextEditingController ssSquareRectNumberController = TextEditingController();

  final TextEditingController roundBarDiameterController = TextEditingController();
  final TextEditingController roundBarNumberController = TextEditingController();

  final TextEditingController squareBarDiameterController = TextEditingController();
  final TextEditingController squareBarNumberController = TextEditingController();

  final TextEditingController hexagonalBarDiameterController = TextEditingController();
  final TextEditingController hexagonalBarNumberController = TextEditingController();

  final TextEditingController sheetBarLengthController = TextEditingController();
  final TextEditingController sheetBarWidthController = TextEditingController();
  final TextEditingController sheetBarThicknessController = TextEditingController();

  final TextEditingController ssPattiWidthController = TextEditingController();
  final TextEditingController ssPattiThicknessController = TextEditingController();
  final TextEditingController ssPattiNumberController = TextEditingController();

  final TextEditingController ssCircleDiaController = TextEditingController();
  final TextEditingController ssCircleThicknessController = TextEditingController();

  final TextEditingController alumPipeOdController = TextEditingController();
  final TextEditingController alumPipeThicknessController = TextEditingController();

  final TextEditingController ssSquareFeetConvertLengthController = TextEditingController();
  final TextEditingController ssSquareFeetConvertWidthController = TextEditingController();

  final TextEditingController brassCopperPipeOdController = TextEditingController();
  final TextEditingController brassCopperPipeThicknessController = TextEditingController();

  String activeCalc = 'calc1'; // Initially set to calc1

  void switchToCalc(String calcName,WidgetRef ref) {
    setState(() {
      activeCalc = calcName;
    });
    // Call reset function for the previously active calculation (explained below)
    resetPreviousCalc(activeCalc,ref);
  }

  void resetPreviousCalc(String currentCalc,WidgetRef ref) {
    // Reset providers based on the previously active calculation (activeCalc)
    if (currentCalc != 'calc1') {
      // Reset calc1 providers
      pipeODController.clear();
      pipeThicknessController.clear();
      pipeNumberController.clear();
      ref.read(pipeODProvider.notifier).state = 0;
      ref.read(pipeThicknessProvider.notifier).state = 0;
      ref.read(pipeNumberProvider.notifier).state = 0;
    }
    if (currentCalc != 'calc2') {
      ssSquareRectSize1Controller.clear();
      ssSquareRectSize2Controller.clear();
      ssSquareRectThicknessController.clear();
      ssSquareRectNumberController.clear();
      ref.read(ssSquareRectSize1Provider.notifier).state = 0;
      ref.read(ssSquareRectSize2Provider.notifier).state = 0;
      ref.read(ssSquareRectThicknessProvider.notifier).state = 0;
      ref.read(ssSquareRectNumberProvider.notifier).state = 0;
    }
    if (currentCalc != 'calc3') {
      roundBarDiameterController.clear();
      roundBarNumberController.clear();
      ref.read(roundBarDiameterProvider.notifier).state = 0;
      ref.read(roundBarNumberProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc4') {
      squareBarDiameterController.clear();
      squareBarNumberController.clear();
      ref.read(squareBarDiameterProvider.notifier).state = 0;
      ref.read(squareBarNumberProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc5') {
      hexagonalBarDiameterController.clear();
      hexagonalBarNumberController.clear();
      ref.read(hexagonalBarDiameterProvider.notifier).state = 0;
      ref.read(hexagonalBarNumberProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc6') {
      sheetBarLengthController.clear();
      sheetBarWidthController.clear();
      sheetBarThicknessController.clear();
      ref.read(sheetBarLengthProvider.notifier).state = 0;
      ref.read(sheetBarWidthProvider.notifier).state = 0;
      ref.read(sheetBarThicknessProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc7') {
      ssPattiWidthController.clear();
      ssPattiThicknessController.clear();
      ssPattiNumberController.clear();
      ref.read(ssPattiWidthProvider.notifier).state = 0;
      ref.read(ssPattiThicknessProvider.notifier).state = 0;
      ref.read(ssPattiNumberProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc8') {
      ssCircleDiaController.clear();
      ssCircleThicknessController.clear();
      ref.read(ssCircleDiaProvider.notifier).state = 0;
      ref.read(ssCircleThicknessProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc9') {
      alumPipeOdController.clear();
      alumPipeThicknessController.clear();
      ref.read(alumPipeOdProvider.notifier).state = 0;
      ref.read(alumPipeThicknessProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc10') {
      ssSquareFeetConvertLengthController.clear();
      ssSquareFeetConvertWidthController.clear();
      ref.read(ssSquareFeetConvertLengthProvider.notifier).state = 0;
      ref.read(ssSquareFeetConvertWidthProvider.notifier).state = 0;
    }

    if (currentCalc != 'calc11') {
      brassCopperPipeOdController.clear();
      brassCopperPipeThicknessController.clear();
      ref.read(brassCopperPipeOdProvider.notifier).state = 0;
      ref.read(brassCopperPipeThicknessProvider.notifier).state = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final provider = ref.watch(localProvider);
      return Scaffold(
        backgroundColor: AppColors.kLightGrey,
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: AppColors.kBlack.withOpacity(.80),
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 12),
            child: Image.asset(
              'assets/images/rounded_logo.png',
            ),
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                AppStrings.kAppName,
                style: AppFontStyles.headlineLarge(),
              ),
              SizedBox(
                height: 5,
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => Gradiant().createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: RichText(
                  text: TextSpan(
                    style: AppFontStyles.bodyMedium(),
                    children: [
                      TextSpan(
                        text: AppStrings.kPoweredBy,
                      ),
                      TextSpan(
                        text: AppStrings.kPrithviSteel,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => Gradiant().createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  AppStrings.kAhmedabad,
                  style: AppFontStyles.bodyMedium(),
                ),
              ),
            ],
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   calc1(context, ref),
                  AppCommonWidget.appDivider(),
                  calc2(context,ref),
                  AppCommonWidget.appDivider(),
                  calc3(context,ref),
                  AppCommonWidget.appDivider(),
                  calc4(context,ref),
                  AppCommonWidget.appDivider(),
                  calc5(context,ref),
                  AppCommonWidget.appDivider(),
                   calc6(context,ref),
                  AppCommonWidget.appDivider(),
                  calc7(context,ref),
                  AppCommonWidget.appDivider(),
                  calc8(context,ref),
                  AppCommonWidget.appDivider(),
                  calc9(context,ref),
                  AppCommonWidget.appDivider(),
                  calc10(context,ref),
                  AppCommonWidget.appDivider(),
                  calc11(context,ref),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget calc1(BuildContext context, WidgetRef ref) {
    final pipeWeightPerFeet = ref.watch(pipeWeightProvider);
    final pipeWeightTotal = ref.watch(pipeWeightFinalAnsProvider);
    return                   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle1,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kOD,
                    controller: pipeODController,
                    onTap: (){
                      switchToCalc("calc1",ref);
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        ref.read(pipeODProvider.notifier).state =
                        0.0;
                      } else {
                        ref.read(pipeODProvider.notifier).state =
                            double.parse(value);
                      }
                    })),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: pipeThicknessController,
                  onTap: (){
                    switchToCalc("calc1",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(pipeThicknessProvider.notifier)
                          .state = 0.0; // Set to 0 if empty
                    } else {
                      ref
                          .read(pipeThicknessProvider.notifier)
                          .state = double.parse(value);
                    }
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CommonTextFormField(
                labelText: AppLocalizations.of(context)!.kPerFeet,
                enabled: false,
                controller: TextEditingController(
                    text: pipeWeightPerFeet.toStringAsFixed(3)),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.close),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: CommonTextFormField(
                labelText:
                AppLocalizations.of(context)!.kNumberOfFeet,
                controller: pipeNumberController,
                onTap: (){
                  switchToCalc("calc1",ref);
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    ref.read(pipeNumberProvider.notifier).state =
                    0.0;
                  } else {
                    ref.read(pipeNumberProvider.notifier).state =
                        double.parse(value);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerKg,
          enabled: false,
          controller: TextEditingController(
              text: pipeWeightTotal.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc2(BuildContext context, WidgetRef ref) {
    final ssSquareRectAnsPerFeet = ref.watch(ssSquareRectAnsProvider);
    final ssSquareRectFinalAns = ref.watch(ssSquareRectFinalAnsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle7,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                    labelText:
                    AppLocalizations.of(context)!.kSize,
                    controller: ssSquareRectSize1Controller,
                    onTap: (){
                      switchToCalc("calc2",ref);
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        ref
                            .read(ssSquareRectSize1Provider
                            .notifier)
                            .state = 0.0;
                      } else {
                        ref
                            .read(ssSquareRectSize1Provider
                            .notifier)
                            .state = double.parse(value);
                      }
                    })),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kSize,
                  controller: ssSquareRectSize2Controller,
                  onTap: (){
                    switchToCalc("calc2",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(
                          ssSquareRectSize2Provider.notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(
                          ssSquareRectSize2Provider.notifier)
                          .state = double.parse(value);
                    }
                  },
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: ssSquareRectThicknessController,
                  onTap: (){
                    switchToCalc("calc2",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssSquareRectThicknessProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssSquareRectThicknessProvider
                          .notifier)
                          .state = double.parse(value);
                    }
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kPerFeet,
                  enabled: false,
                  controller: TextEditingController(
                      text: ssSquareRectAnsPerFeet
                          .toStringAsFixed(3)),
                )),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.close),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kNumberOfFeet,
                  controller: ssSquareRectNumberController,
                  onTap: (){
                    switchToCalc("calc2",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssSquareRectNumberProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssSquareRectNumberProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerKg,
          enabled: false,
          controller: TextEditingController(
              text: ssSquareRectFinalAns.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc3(BuildContext context, WidgetRef ref){
    final roundBarWeightPerFeet = ref.watch(roundBarWeightProvider);
    final roundBarWeightTotal = ref.watch(roundBarWeightFinalAnsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle2,
        ),
        const SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kDia,
          controller: roundBarDiameterController,
          onTap: (){
            switchToCalc("calc3",ref);
          },
          onChanged: (value) {
            if (value.isEmpty) {
              ref
                  .read(roundBarDiameterProvider
                  .notifier)
                  .state = 0.0;
            } else {
              ref
                  .read(roundBarDiameterProvider.notifier)
                  .state = double.parse(value);}
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kPerFeet,
                  enabled: false,
                  controller: TextEditingController(
                      text: roundBarWeightPerFeet
                          .toStringAsFixed(3)),
                )),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.close),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kNumberOfFeet,
                  controller: roundBarNumberController,
                  onTap: (){
                    switchToCalc("calc3",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(roundBarNumberProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(roundBarNumberProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerKg,
          enabled: false,
          controller: TextEditingController(
              text: roundBarWeightTotal.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc4(BuildContext context, WidgetRef ref){
    final squareBarWeightPerFeet = ref.watch(squareBarWeightProvider);
    final squareBarWeightTotal = ref.watch(squareBarWeightFinalAnsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle4,
        ),
        const SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kDia,
          controller: squareBarDiameterController,
          onTap: (){
            switchToCalc("calc4",ref);
          },
          onChanged: (value) {
            if (value.isEmpty) {
              ref
                  .read(squareBarDiameterProvider
                  .notifier)
                  .state = 0.0;
            } else {
              ref
                  .read(squareBarDiameterProvider.notifier)
                  .state = double.parse(value);}
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kPerFeet,
                  enabled: false,
                  controller: TextEditingController(
                      text: squareBarWeightPerFeet
                          .toStringAsFixed(3)),
                )),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.close),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kNumberOfFeet,
                  controller: squareBarNumberController,
                  onTap: (){
                    switchToCalc("calc4",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(squareBarNumberProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(squareBarNumberProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerKg,
          enabled: false,
          controller: TextEditingController(
              text: squareBarWeightTotal.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc5(BuildContext context, WidgetRef ref){
    final hexagonalBarWeightPerFeet = ref.watch(hexagonalBarWeightProvider);
    final hexagonalBarWeightTotal =
    ref.watch(hexagonalBarWeightFinalAnsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle8,
        ),
        const SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kDia,
          controller: hexagonalBarDiameterController,
          onTap: (){
            switchToCalc("calc5",ref);
          },
          onChanged: (value) {
            if (value.isEmpty) {
              ref
                  .read(hexagonalBarDiameterProvider
                  .notifier)
                  .state = 0.0;
            } else {
              ref
                  .read(hexagonalBarDiameterProvider.notifier)
                  .state = double.parse(value);}
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kPerFeet,
                  enabled: false,
                  controller: TextEditingController(
                      text: hexagonalBarWeightPerFeet
                          .toStringAsFixed(3)),
                )),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.close),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kNumberOfFeet,
                  controller: hexagonalBarNumberController,
                  onTap: (){
                    switchToCalc("calc5",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(hexagonalBarNumberProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(hexagonalBarNumberProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerKg,
          enabled: false,
          controller: TextEditingController(
              text: hexagonalBarWeightTotal.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc6(BuildContext context, WidgetRef ref){
    final sheetBarWeight = ref.watch(sheetBarWeightProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle3,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kLengthFeet,
                  controller: sheetBarLengthController,
                  onTap: (){
                    switchToCalc("calc6",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(sheetBarLengthProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(sheetBarLengthProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kWidthFeet,
                  controller: sheetBarWidthController,
                  onTap: (){
                    switchToCalc("calc6",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(sheetBarWidthProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(sheetBarWidthProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: sheetBarThicknessController,
                  onTap: (){
                    switchToCalc("calc6",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(sheetBarThicknessProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(sheetBarThicknessProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerPerPC,
          enabled: false,
          controller: TextEditingController(
              text: sheetBarWeight.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc7(BuildContext context, WidgetRef ref){
    final ssPattiAnsPerFeet = ref.watch(ssPattiAnsProvider);
    final ssPattiFinalAns = ref.watch(ssPattiFinalAnsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle6,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kWidthmm,
                  controller: ssPattiWidthController,
                  onTap: (){
                    switchToCalc("calc7",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssPattiWidthProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssPattiWidthProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: ssPattiThicknessController,
                  onTap: (){
                    switchToCalc("calc7",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssPattiThicknessProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssPattiThicknessProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kPerFeet,
                  enabled: false,
                  controller: TextEditingController(
                      text: ssPattiAnsPerFeet.toStringAsFixed(3)),
                )),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.close),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kNumberOfFeet,
                  controller: ssPattiNumberController,
                  onTap: (){
                    switchToCalc("calc7",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssPattiNumberProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssPattiNumberProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kFinalAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerKg,
          enabled: false,
          controller: TextEditingController(
              text: ssPattiFinalAns.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc8(BuildContext context, WidgetRef ref){
    final ssCircleAns = ref.watch(ssCircleAnsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle5,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kDiaMM,
                  controller: ssCircleDiaController,
                  onTap: (){
                    switchToCalc("calc8",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssCircleDiaProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssCircleDiaProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: ssCircleThicknessController,
                  onTap: (){
                    switchToCalc("calc8",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssCircleThicknessProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssCircleThicknessProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerPerPC,
          enabled: false,
          controller: TextEditingController(
              text: ssCircleAns.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc9(BuildContext context, WidgetRef ref){
    final alumPipeWeight = ref.watch(alumPipeWeightProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle9,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kOD,
                  controller: alumPipeOdController,
                  onTap: (){
                    switchToCalc("calc9",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(alumPipeOdProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(alumPipeOdProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: alumPipeThicknessController,
                  onTap: (){
                    switchToCalc("calc9",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(alumPipeThicknessProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(alumPipeThicknessProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerPerMtr,
          enabled: false,
          controller: TextEditingController(
              text: alumPipeWeight.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc10(BuildContext context, WidgetRef ref){
    final brassCopperPipeWeight = ref.watch(brassCopperPipeWeightProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle11,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: AppLocalizations.of(context)!.kOD,
                  controller: brassCopperPipeOdController,
                  onTap: (){
                    switchToCalc("calc11",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(brassCopperPipeOdProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(brassCopperPipeOdProvider.notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kThickness,
                  controller: brassCopperPipeThicknessController,
                  onTap: (){
                    switchToCalc("calc11",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(brassCopperPipeThicknessProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(brassCopperPipeThicknessProvider
                          .notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText: AppLocalizations.of(context)!.kAnswerPerMtr,
          enabled: false,
          controller: TextEditingController(
              text: brassCopperPipeWeight.toStringAsFixed(3)),
        ),
      ],
    );
  }

  Widget calc11(BuildContext context, WidgetRef ref){
    final ssSquareFeetConvertAns = ref.watch(ssSquareFeetConvertProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowContainer(
          height: 40,
          text: AppLocalizations.of(context)!.kTitle10,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kLengthInch,
                  controller: ssSquareFeetConvertLengthController,
                  onTap: (){
                    switchToCalc("calc10",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssSquareFeetConvertLengthProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssSquareFeetConvertLengthProvider
                          .notifier)
                          .state = double.parse(value);}
                  },
                )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText:
                  AppLocalizations.of(context)!.kWidthInch,
                  controller: ssSquareFeetConvertWidthController,
                  onTap: (){
                    switchToCalc("calc10",ref);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref
                          .read(ssSquareFeetConvertWidthProvider
                          .notifier)
                          .state = 0.0;
                    } else {
                      ref
                          .read(ssSquareFeetConvertWidthProvider
                          .notifier)
                          .state = double.parse(value);}
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.kAnswer,
          style: AppFontStyles.bodyLarge(),
        ),
        const SizedBox(
          height: 8,
        ),
        CommonTextFormField(
          labelText:
          AppLocalizations.of(context)!.kAnswerSquarePerFeet,
          enabled: false,
          controller: TextEditingController(
              text: ssSquareFeetConvertAns.toStringAsFixed(3)),
        ),
      ],
    );
  }



  LinearGradient Gradiant(){
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Colors.white.withOpacity(.5),
          Colors.white,
        ]);
}
}

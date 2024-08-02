import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_s_wajan/provider/locale_provider.dart';
import 'package:s_s_wajan/provider/pip_weight_calc.dart';
import 'package:s_s_wajan/provider/roundbar_weight_calc.dart';
import 'package:s_s_wajan/provider/sheetbar_weight_calc.dart';
import 'package:s_s_wajan/provider/squarebar_weight_calc.dart';
import 'package:s_s_wajan/provider/ss_circle_calc.dart';
import 'package:s_s_wajan/provider/ss_patti_calc.dart';
import 'package:s_s_wajan/provider/ss_square_feet_converter.dart';
import 'package:s_s_wajan/provider/ss_square_rect_calc.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import 'package:s_s_wajan/utils/arrow_container.dart';

import '../provider/aluminium_pipe_calc.dart';
import '../provider/brass_copper_pipe_calc.dart';
import '../provider/hexagonal_bar_weight_calc.dart';
import '../utils/app_font_styles.dart';
import '../utils/common_textformfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalculatorScreen extends StatefulWidget {
  int? selIndex;
  String? appBarName;
   CalculatorScreen({this.selIndex,this.appBarName,Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

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

  void resetAppBarCalc(WidgetRef ref) {
    // Reset providers based on the previously active calculation (activeCalc)

      // Reset calc1 providers
      pipeODController.clear();
      pipeThicknessController.clear();
      pipeNumberController.clear();
      ref.read(pipeODProvider.notifier).state = 0;
      ref.read(pipeThicknessProvider.notifier).state = 0;
      ref.read(pipeNumberProvider.notifier).state = 0;


      ssSquareRectSize1Controller.clear();
      ssSquareRectSize2Controller.clear();
      ssSquareRectThicknessController.clear();
      ssSquareRectNumberController.clear();
      ref.read(ssSquareRectSize1Provider.notifier).state = 0;
      ref.read(ssSquareRectSize2Provider.notifier).state = 0;
      ref.read(ssSquareRectThicknessProvider.notifier).state = 0;
      ref.read(ssSquareRectNumberProvider.notifier).state = 0;



      roundBarDiameterController.clear();
      roundBarNumberController.clear();
      ref.read(roundBarDiameterProvider.notifier).state = 0;
      ref.read(roundBarNumberProvider.notifier).state = 0;



      squareBarDiameterController.clear();
      squareBarNumberController.clear();
      ref.read(squareBarDiameterProvider.notifier).state = 0;
      ref.read(squareBarNumberProvider.notifier).state = 0;



      hexagonalBarDiameterController.clear();
      hexagonalBarNumberController.clear();
      ref.read(hexagonalBarDiameterProvider.notifier).state = 0;
      ref.read(hexagonalBarNumberProvider.notifier).state = 0;



      sheetBarLengthController.clear();
      sheetBarWidthController.clear();
      sheetBarThicknessController.clear();
      ref.read(sheetBarLengthProvider.notifier).state = 0;
      ref.read(sheetBarWidthProvider.notifier).state = 0;
      ref.read(sheetBarThicknessProvider.notifier).state = 0;



      ssPattiWidthController.clear();
      ssPattiThicknessController.clear();
      ssPattiNumberController.clear();
      ref.read(ssPattiWidthProvider.notifier).state = 0;
      ref.read(ssPattiThicknessProvider.notifier).state = 0;
      ref.read(ssPattiNumberProvider.notifier).state = 0;



      ssCircleDiaController.clear();
      ssCircleThicknessController.clear();
      ref.read(ssCircleDiaProvider.notifier).state = 0;
      ref.read(ssCircleThicknessProvider.notifier).state = 0;



      alumPipeOdController.clear();
      alumPipeThicknessController.clear();
      ref.read(alumPipeOdProvider.notifier).state = 0;
      ref.read(alumPipeThicknessProvider.notifier).state = 0;



      ssSquareFeetConvertLengthController.clear();
      ssSquareFeetConvertWidthController.clear();
      ref.read(ssSquareFeetConvertLengthProvider.notifier).state = 0;
      ref.read(ssSquareFeetConvertWidthProvider.notifier).state = 0;



      brassCopperPipeOdController.clear();
      brassCopperPipeThicknessController.clear();
      ref.read(brassCopperPipeOdProvider.notifier).state = 0;
      ref.read(brassCopperPipeThicknessProvider.notifier).state = 0;

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final provider = ref.watch(localProvider);
      return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: AppColors.kWhite,
              height: 2.0,
              width: double.infinity,
            )),
        toolbarHeight: 50,
        backgroundColor: AppColors.kBlack,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: AppColors.kWhite,),),
        centerTitle: true,
        title: Text(
          '${widget.appBarName.toString()} Calculation',
          style: AppFontStyles.splashSubText(fontWeight: FontWeight.bold),
        ),
        actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                  onTap: () {
                    resetAppBarCalc(ref);
                  },
                  child: SvgPicture.asset(
                    'assets/images/reset.svg',
                  )),
            ),
          ],

      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black
            ),
          ),
          Image.asset('assets/images/mainHome.png',fit: BoxFit.cover,height: double.infinity,
            width: double.infinity,),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [


                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(20)),color: Color.fromRGBO(51, 51, 51, 1)),
                      child: getCalcWidget(widget.selIndex!, context, ref),
                    ),
                  ),
                  SizedBox(height: 30,),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromRGBO(51, 51, 51, 1)),
                      child: getCalcImageWidget(widget.selIndex!, context,),
                    ),
                  ],
              ),
            ),
          ),
        ],
      ),
    ); });
  }
  String formatValue(double value) {
    return value == 0 ? '' : value.toStringAsFixed(0);
  }

  Widget calc1(BuildContext context, WidgetRef ref) {
    final pipeWeightPerFeet = ref.watch(pipeWeightProvider);
    final pipeWeightTotal = ref.watch(pipeWeightFinalAnsProvider);
    return   Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                      labelText: 'OD(mm)',
                      hintText: AppLocalizations.of(context)!.kOD,

                      // hintStyle: TextStyle(color: Colors.grey),
                     // labelText: AppLocalizations.of(context)!.kOD,
                     //  hintText: AppLocalizations.of(context)!.kOD,

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
                      })
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: 'Thickness',
                   // labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CommonTextFormField(

                //  labelText: AppLocalizations.of(context)!.kPerFeet,
                  hintText: AppLocalizations.of(context)!.kPerFeet,
                  enabled: false,
                 // controller: TextEditingController(text: formatValue(pipeWeightPerFeet)),
               controller: TextEditingController(text: pipeWeightPerFeet.toStringAsFixed(3)),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.close,color: AppColors.kWhite,),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: CommonTextFormField(
                  labelText: 'Number of Feet',
                  //labelText: AppLocalizations.of(context)!.kNumberOfFeet,
                  hintText: AppLocalizations.of(context)!.kNumberOfFeet,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),

          CommonTextFormField(
           // labelText: AppLocalizations.of(context)!.kAnswerKg,
            hintText: AppLocalizations.of(context)!.kAnswerKg,
            enabled: false,
            //controller: TextEditingController(text: formatValue(pipeWeightTotal)),
            controller: TextEditingController(
                text: pipeWeightTotal.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }


  Widget calc2(BuildContext context, WidgetRef ref){
    final roundBarWeightPerFeet = ref.watch(roundBarWeightProvider);
    final roundBarWeightTotal = ref.watch(roundBarWeightFinalAnsProvider);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kDia,
            hintText: AppLocalizations.of(context)!.kDia,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
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
            const Icon(Icons.close,color: AppColors.kWhite,),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kNumberOfFeet,
                    hintText: AppLocalizations.of(context)!.kNumberOfFeet,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerKg,
            enabled: false,
            controller: TextEditingController(
                text: roundBarWeightTotal.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc3(BuildContext context, WidgetRef ref) {
    final ssSquareRectAnsPerFeet = ref.watch(ssSquareRectAnsProvider);
    final ssSquareRectFinalAns = ref.watch(ssSquareRectFinalAnsProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                      labelText: AppLocalizations.of(context)!.kSize,
                      hintText: AppLocalizations.of(context)!.kSize,
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
                    hintText: AppLocalizations.of(context)!.kSize,
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
                    labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
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
            const Icon(Icons.close,color: AppColors.kWhite,),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kNumberOfFeet,
                    hintText: AppLocalizations.of(context)!.kNumberOfFeet,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerKg,
            enabled: false,
            controller: TextEditingController(
                text: ssSquareRectFinalAns.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc4(BuildContext context, WidgetRef ref){
    final squareBarWeightPerFeet = ref.watch(squareBarWeightProvider);
    final squareBarWeightTotal = ref.watch(squareBarWeightFinalAnsProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kDia,
            hintText: AppLocalizations.of(context)!.kDia,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
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
            const Icon(Icons.close,color: AppColors.kWhite,),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kNumberOfFeet,
                    hintText: AppLocalizations.of(context)!.kNumberOfFeet,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerKg,
            enabled: false,
            controller: TextEditingController(
                text: squareBarWeightTotal.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc5(BuildContext context, WidgetRef ref){
    final hexagonalBarWeightPerFeet = ref.watch(hexagonalBarWeightProvider);
    final hexagonalBarWeightTotal =
    ref.watch(hexagonalBarWeightFinalAnsProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kDia,
            hintText: AppLocalizations.of(context)!.kDia,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
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
            const Icon(Icons.close,color: AppColors.kWhite,),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kNumberOfFeet,
                    hintText: AppLocalizations.of(context)!.kNumberOfFeet,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerKg,
            enabled: false,
            controller: TextEditingController(
                text: hexagonalBarWeightTotal.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc6(BuildContext context, WidgetRef ref){
    final sheetBarWeight = ref.watch(sheetBarWeightProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kLengthFeet,
                    hintText: AppLocalizations.of(context)!.kLengthFeet,
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
                    labelText: AppLocalizations.of(context)!.kWidthFeet,
                    hintText: AppLocalizations.of(context)!.kWidthFeet,
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
                    labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerPerPC,
            enabled: false,
            controller: TextEditingController(
                text: sheetBarWeight.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc7(BuildContext context, WidgetRef ref){
    final ssPattiAnsPerFeet = ref.watch(ssPattiAnsProvider);
    final ssPattiFinalAns = ref.watch(ssPattiFinalAnsProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kWidthmm,
                    hintText: AppLocalizations.of(context)!.kWidthmm,
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
                    labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kPerFeet,
                    enabled: false,
                    controller: TextEditingController(
                        text: ssPattiAnsPerFeet.toStringAsFixed(3)),
                  )),
              const SizedBox(
                width: 8,
              ),
            const Icon(Icons.close,color: AppColors.kWhite,),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kNumberOfFeet,
                    hintText: AppLocalizations.of(context)!.kNumberOfFeet,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerKg,
            enabled: false,
            controller: TextEditingController(
                text: ssPattiFinalAns.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc8(BuildContext context, WidgetRef ref){
    final ssCircleAns = ref.watch(ssCircleAnsProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kDiaMM,
                    hintText: AppLocalizations.of(context)!.kDiaMM,
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
                    labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerPerPC,
            enabled: false,
            controller: TextEditingController(
                text: ssCircleAns.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc9(BuildContext context, WidgetRef ref){
    final alumPipeWeight = ref.watch(alumPipeWeightProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kOD,
                    hintText: AppLocalizations.of(context)!.kOD,
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
                    labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerPerMtr,
            enabled: false,
            controller: TextEditingController(
                text: alumPipeWeight.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc10(BuildContext context, WidgetRef ref){
    final brassCopperPipeWeight = ref.watch(brassCopperPipeWeightProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kOD,
                    hintText: AppLocalizations.of(context)!.kOD,
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
                    labelText: AppLocalizations.of(context)!.kThickness,
                    hintText: AppLocalizations.of(context)!.kThickness,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText: AppLocalizations.of(context)!.kAnswerPerMtr,
            enabled: false,
            controller: TextEditingController(
                text: brassCopperPipeWeight.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }

  Widget calc11(BuildContext context, WidgetRef ref){
    final ssSquareFeetConvertAns = ref.watch(ssSquareFeetConvertProvider);
    return Padding(
     padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonTextFormField(
                    labelText: AppLocalizations.of(context)!.kLengthInch,
                    hintText: AppLocalizations.of(context)!.kLengthInch,
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
                    labelText: AppLocalizations.of(context)!.kWidthInch,
                    hintText: AppLocalizations.of(context)!.kWidthInch,
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
            height: 15,
          ),
          Divider(color: AppColors.kYellow,),
          const SizedBox(
            height: 15,
          ),
          CommonTextFormField(
            labelText:
            AppLocalizations.of(context)!.kAnswerSquarePerFeet,
            enabled: false,
            controller: TextEditingController(
                text: ssSquareFeetConvertAns.toStringAsFixed(3)),
          ),
        ],
      ),
    );
  }


  Widget imageContainerCalc1(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       SvgPicture.asset('assets/images/sspipe1.svg',width: 100,height: 100,),
       SizedBox(height: 50,),
       SvgPicture.asset('assets/images/sspipe2.svg',width: 100,height: 100,),
     ],
    );
  }

  Widget imageContainerCalc2(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/sssquarerec1.svg',width: 100,height: 100,),
        SizedBox(height: 50,),
        SvgPicture.asset('assets/images/sssquarerec.svg',width: 100,height: 100,),
      ],
    );
  }
  Widget imageContainerCalc3(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/ssroundbar.svg',width: 100,height: 100,),
        SizedBox(height: 50,),
        SvgPicture.asset('assets/images/ssroundbar1.svg',width: 100,height: 100,),
      ],
    );
  }
  Widget imageContainerCalc4(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/sssquarebar.svg',width: 100,height: 100,),
        SizedBox(height: 50,),
        SvgPicture.asset('assets/images/sssquarebar1.svg',width: 100,height: 100,),
      ],
    );
  }
  Widget imageContainerCalc5(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/hexagone1.svg'),
        SizedBox(height: 50,),
        SvgPicture.asset('assets/images/hexagone.svg'),
      ],
    );
  }
  Widget imageContainerCalc6(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/sssheetweight.svg',width: 100,height: 100,),
        SizedBox(width: 50,),
        SvgPicture.asset('assets/images/sssheetweight1.svg',width: 100,height: 100,),
      ],
    );
  }
  Widget imageContainerCalc7(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/sspatti1.svg',width: 100,height: 100,),
        SizedBox(width: 50,),
        SvgPicture.asset('assets/images/sspatti.svg',width: 100,height: 100,),
      ],
    );
  }
  Widget imageContainerCalc8(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/sscircle1.svg',width: 100,height: 100,),
        SizedBox(width: 50,),
        SvgPicture.asset('assets/images/sscircle.svg',width: 100,height: 100,),


      ],
    );
  }
  Widget imageContainerCalc9(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/aluminiun.svg',width: 100,height: 100,),
        SizedBox(width: 50,),
        SvgPicture.asset('assets/images/aluminium1.svg',width: 100,height: 100,),
      ],
    );
  }
  Widget imageContainerCalc10(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/squarefeet.svg',width: 100,height: 100,),
        SizedBox(width: 50,),
        SvgPicture.asset('assets/images/squarefeet1.svg',width: 100,height: 100,),

      ],
    );
  }
  Widget imageContainerCalc11(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/brass.svg',width: 100,height: 100,),
        SizedBox(width: 50,),
        SvgPicture.asset('assets/images/brass1.svg',width: 100,height: 100,),
      ],
    );
  }

  Widget getCalcImageWidget(int selIndex, BuildContext context, ) {
    switch (selIndex) {
      case 0:
        return imageContainerCalc1(context);
      case 1:
        return imageContainerCalc2(context);
      case 2:
        return imageContainerCalc3(context);
      case 3:
        return imageContainerCalc4(context);
      case 4:
        return imageContainerCalc5(context);
      case 5:
        return imageContainerCalc6(context);
      case 6:
        return imageContainerCalc7(context);
      case 7:
        return imageContainerCalc8(context);
      case 8:
        return imageContainerCalc9(context);
      case 9:
        return imageContainerCalc10(context);
      case 10:
        return imageContainerCalc11(context);
      default:
        return Container(); // Return an empty container or an error message
    }
  }



  Widget getCalcWidget(int selIndex, BuildContext context, WidgetRef ref) {
    switch (selIndex) {
      case 0:
        return calc1(context, ref);
      case 1:
        return calc2(context, ref);
      case 2:
        return calc3(context, ref);
      case 3:
        return calc4(context, ref);
      case 4:
        return calc5(context, ref);
      case 5:
        return calc6(context, ref);
      case 6:
        return calc7(context, ref);
      case 7:
        return calc8(context, ref);
      case 8:
        return calc9(context, ref);
      case 9:
        return calc11(context, ref);
      case 10:
        return calc10(context, ref);
      default:
        return Container(); // Return an empty container or an error message
    }
  }


}

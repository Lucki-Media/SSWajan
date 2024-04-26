
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ssPattiWidthProvider = StateProvider<double>((ref) => 0);
final ssPattiThicknessProvider = StateProvider<double>((ref) => 0);
final ssPattiNumberProvider = StateProvider<double>((ref) => 0);
final ssPattiAnsProvider =
Provider<double>((ref) => calculateSSPatti(ref.watch(ssPattiWidthProvider), ref.watch(ssPattiThicknessProvider)));
final ssPattiFinalAnsProvider =
Provider<double>((ref) => calculateSSPattiTotal(ref.watch(ssPattiAnsProvider), ref.watch(ssPattiNumberProvider)));

double calculateSSPatti(double width, double thickness) {
  if (width == 0 || thickness == 0) {
    return 0.0; // Return 0 if either value is 0
  } else {
    return width * thickness * 0.00243;
  }
}
double calculateSSPattiTotal(double perFeetWeight,double totalNumber) {
  return  perFeetWeight * totalNumber;
}

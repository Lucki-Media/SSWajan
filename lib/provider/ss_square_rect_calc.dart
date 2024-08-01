
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ssSquareRectSize1Provider = StateProvider<double>((ref) => 0);
final ssSquareRectSize2Provider = StateProvider<double>((ref) => 0);
final ssSquareRectThicknessProvider = StateProvider<double>((ref) => 0);
final ssSquareRectNumberProvider = StateProvider<double>((ref) => 0);
final ssSquareRectAnsProvider = Provider<double>((ref) => calculateSSSquareRect(ref.watch(ssSquareRectSize1Provider), ref.watch(ssSquareRectSize2Provider), ref.watch(ssSquareRectThicknessProvider)));
final ssSquareRectFinalAnsProvider = Provider<double>((ref) => calculateSSSquareRectTotal(ref.watch(ssSquareRectAnsProvider), ref.watch(ssSquareRectNumberProvider)));

double calculateSSSquareRect(double size1,double size2, double thickness) {
  if (size1 == 0 || size2 == 0 || thickness == 0) {
    return 0.0; // Return 0 if either value is 0
  } else {
    return ((((size1 + size2) * 2 / 3.14) - thickness) * thickness) * 0.00756;
  }
}
double calculateSSSquareRectTotal(double perFeetWeight,double totalNumber) {
  return  perFeetWeight * totalNumber;
}

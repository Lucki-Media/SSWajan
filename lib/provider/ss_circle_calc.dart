

import 'package:flutter_riverpod/flutter_riverpod.dart';

final ssCircleDiaProvider = StateProvider<double>((ref) => 0);
final ssCircleThicknessProvider = StateProvider<double>((ref) => 0);
final ssCircleAnsProvider = Provider<double>((ref) => calculateSSCircle(
    ref.watch(ssCircleDiaProvider),  ref.watch(ssCircleThicknessProvider)));




double calculateSSCircle(double dia, double thickness) {
  if (dia == 0 || thickness == 0) {
    return 0.0; // Return 0 if either value is 0
  } else {
    // Formula: Weight = width * length * thickness * density
    return dia * dia * thickness * 0.0000063;
  }
}

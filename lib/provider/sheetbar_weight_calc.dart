

import 'package:flutter_riverpod/flutter_riverpod.dart';

final sheetBarWidthProvider = StateProvider<double>((ref) => 0);
final sheetBarLengthProvider = StateProvider<double>((ref) => 0);
final sheetBarThicknessProvider = StateProvider<double>((ref) => 0);
final sheetBarWeightProvider = Provider<double>((ref) => calculateSheetBarWeight(
    ref.watch(sheetBarWidthProvider), ref.watch(sheetBarLengthProvider), ref.watch(sheetBarThicknessProvider)));




double calculateSheetBarWeight(double width, double length, double thickness) {
  if (width == 0 || length == 0 || thickness == 0) {
    return 0.0; // Return 0 if either value is 0
  } else {
    // Formula: Weight = width * length * thickness * density
    return width * length * thickness * 3 / 4;
  }
}

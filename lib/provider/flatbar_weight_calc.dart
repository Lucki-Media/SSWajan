//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final flatBarWidthProvider = StateProvider<double>((ref) => 0);
// final flatBarThicknessProvider = StateProvider<double>((ref) => 0);
// final flatBarWeightProvider =
// Provider<double>((ref) => calculateFlatBarWeight(ref.watch(flatBarWidthProvider),ref.watch(flatBarThicknessProvider)));
//
//
// double calculateFlatBarWeight(double width, double thickness) {
//   // Formula: Weight = (pi * diameter^2 / 4) * density
//   //const density = 7.9;  // Density of stainless steel in g/cm³
//   return (width * thickness) * 0.00798;
// }

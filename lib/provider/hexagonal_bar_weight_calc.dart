
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hexagonalBarDiameterProvider = StateProvider<double>((ref) => 0);
final hexagonalBarNumberProvider = StateProvider<double>((ref) => 0);
final hexagonalBarWeightProvider =
Provider<double>((ref) => calculateHexagonalBarWeight(ref.watch(hexagonalBarDiameterProvider)));
final hexagonalBarWeightFinalAnsProvider =
Provider<double>((ref) => calculateHexagonalBarWeightTotal(ref.watch(hexagonalBarWeightProvider),ref.watch(hexagonalBarNumberProvider)));

double calculateHexagonalBarWeight(double diameter) {
  // Formula: Weight = (pi * diameter^2 / 4) * density
  //const density = 7.9;  // Density of stainless steel in g/cm³
  return (diameter * diameter) * 0.002072;
}

double calculateHexagonalBarWeightTotal(double hexagonalBarPerFeetWeight,double totalNumber) {
  // Formula: Weight = (pi * diameter^2 / 4) * density
  //const density = 7.9;  // Density of stainless steel in g/cm³
  return hexagonalBarPerFeetWeight * totalNumber;
}

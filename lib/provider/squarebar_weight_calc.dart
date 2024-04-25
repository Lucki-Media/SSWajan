
import 'package:flutter_riverpod/flutter_riverpod.dart';

final squareBarDiameterProvider = StateProvider<double>((ref) => 0);
final squareBarNumberProvider = StateProvider<double>((ref) => 0);
final squareBarWeightProvider =
Provider<double>((ref) => calculateSquareBarWeight(ref.watch(squareBarDiameterProvider)));
final squareBarWeightFinalAnsProvider =
Provider<double>((ref) => calculateSquareBarWeightTotal(ref.watch(squareBarWeightProvider),ref.watch(squareBarNumberProvider)));

double calculateSquareBarWeight(double diameter) {
  // Formula: Weight = (pi * diameter^2 / 4) * density
  //const density = 7.9;  // Density of stainless steel in g/cm³
  return (diameter * diameter) * 0.0024;
}

double calculateSquareBarWeightTotal(double squareBarPerFeetWeight,double totalNumber) {
  // Formula: Weight = (pi * diameter^2 / 4) * density
  //const density = 7.9;  // Density of stainless steel in g/cm³
  return squareBarPerFeetWeight * totalNumber;
}


import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundBarDiameterProvider = StateProvider<double>((ref) => 0);
final roundBarNumberProvider = StateProvider<double>((ref) => 0);
final roundBarWeightProvider =
Provider<double>((ref) => calculateRoundBarWeight(ref.watch(roundBarDiameterProvider)));
final roundBarWeightFinalAnsProvider =
Provider<double>((ref) => calculateRoundBarWeightTotal(ref.watch(roundBarWeightProvider),ref.watch(roundBarNumberProvider)));

double calculateRoundBarWeight(double diameter) {
  // Formula: Weight = (pi * diameter^2 / 4) * density
  //const density = 7.9;  // Density of stainless steel in g/cm³
  return (diameter * diameter) * 0.0019;
}

double calculateRoundBarWeightTotal(double RoundBarPerFeetWeight,double totalNumber) {
  // Formula: Weight = (pi * diameter^2 / 4) * density
  //const density = 7.9;  // Density of stainless steel in g/cm³
  return RoundBarPerFeetWeight * totalNumber;
}

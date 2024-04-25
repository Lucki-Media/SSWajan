
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pipeODProvider = StateProvider<double>((ref) => 0);
final pipeThicknessProvider = StateProvider<double>((ref) => 0);
final pipeNumberProvider = StateProvider<double>((ref) => 0);
final pipeWeightProvider =
Provider<double>((ref) => calculatePipeWeight(ref.watch(pipeODProvider), ref.watch(pipeThicknessProvider)));
final pipeWeightFinalAnsProvider =
Provider<double>((ref) => calculatePipeWeightTotal(ref.watch(pipeWeightProvider), ref.watch(pipeNumberProvider)));

double calculatePipeWeight(double od, double thickness) {
  // Formula: Weight = (pi * (od - 2 * thickness) * thickness) * density
  // const density = 7.9;  // Density of stainless steel in g/cm³
  return (od - thickness) * thickness * 0.00756;
}
double calculatePipeWeightTotal(double perFeetWeight,double totalNumber) {
  return  perFeetWeight * totalNumber;
}





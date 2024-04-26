
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pipeODProvider = StateProvider<double>((ref) => 0);
final pipeThicknessProvider = StateProvider<double>((ref) => 0);
final pipeNumberProvider = StateProvider<double>((ref) => 0);
final pipeWeightProvider =
Provider<double>((ref) => calculatePipeWeight(ref.watch(pipeODProvider), ref.watch(pipeThicknessProvider)));
final pipeWeightFinalAnsProvider =
Provider<double>((ref) => calculatePipeWeightTotal(ref.watch(pipeWeightProvider), ref.watch(pipeNumberProvider)));

double calculatePipeWeight(double od, double thickness) {
  if (od == 0 || thickness == 0) {
    return 0.0; // Return 0 if either value is 0
  } else {
    return (od - thickness) * thickness * 0.00756;
  }
}
double calculatePipeWeightTotal(double perFeetWeight,double totalNumber) {
  return  perFeetWeight * totalNumber;
}





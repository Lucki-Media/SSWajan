
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alumPipeOdProvider = StateProvider<double>((ref) => 0);
final alumPipeThicknessProvider = StateProvider<double>((ref) => 0);
final alumPipeWeightProvider =
Provider<double>((ref) => calculateAlumPipeWeight(ref.watch(alumPipeOdProvider),ref.watch(alumPipeThicknessProvider)));


double calculateAlumPipeWeight(double od, double thickness) {
  return (od - thickness) * thickness * 0.0083;
}

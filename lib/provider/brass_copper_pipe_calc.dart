
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brassCopperPipeOdProvider = StateProvider<double>((ref) => 0);
final brassCopperPipeThicknessProvider = StateProvider<double>((ref) => 0);
final brassCopperPipeWeightProvider =
Provider<double>((ref) => calculatebrassCopperPipeWeight(ref.watch(brassCopperPipeOdProvider),ref.watch(brassCopperPipeThicknessProvider)));


double calculatebrassCopperPipeWeight(double od, double thickness) {
  return (od - thickness) * thickness * 0.0260;
}

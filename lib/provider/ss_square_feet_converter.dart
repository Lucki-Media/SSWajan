
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ssSquareFeetConvertLengthProvider = StateProvider<double>((ref) => 0);
final ssSquareFeetConvertWidthProvider = StateProvider<double>((ref) => 0);
final ssSquareFeetConvertProvider =
Provider<double>((ref) => calculateSquareFeetConvert(ref.watch(ssSquareFeetConvertLengthProvider),ref.watch(ssSquareFeetConvertWidthProvider)));


double calculateSquareFeetConvert(double length, double width) {
  if (width == 0 || length == 0) {
    return 0.0; // Return 0 if either value is 0
  } else {
    return length * width / 144;
  }
}

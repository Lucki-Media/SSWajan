import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';

class LocalProvider extends StateNotifier<Locale> {
  LocalProvider() : super(L10N.all[0]);

  void toggleLocale() {
    state = state == L10N.all[0] ? L10N.all[1] : L10N.all[0];
  }
}

final localProvider = StateNotifierProvider<LocalProvider, Locale>(
      (ref) => LocalProvider(),
);
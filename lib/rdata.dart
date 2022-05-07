import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Rdata {
  static final counterprovider = StateProvider((ref) => 0);
  static void increment(WidgetRef ref) {
    ref.read(counterprovider.notifier).state++;
  }

  static void reset(WidgetRef ref) {
    ref.read(counterprovider.notifier).state = 0;
  }
}

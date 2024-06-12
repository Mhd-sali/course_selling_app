import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_notifier.g.dart';

@riverpod
class Indexdot extends _$Indexdot {
  @override
  int build() {
    return 0;
  }

  void changeeindex(int value) {
    state = value;
  }
}

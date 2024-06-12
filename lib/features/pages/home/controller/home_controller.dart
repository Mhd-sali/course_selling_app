import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomescreenBannerDots extends _$HomescreenBannerDots {
  @override
  int build() {
    return 0;
  }

  void setindex({required int index}) {
    state = index;
  }
}

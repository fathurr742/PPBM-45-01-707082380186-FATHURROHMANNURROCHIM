import 'package:get/get.dart';

import '../modules/detail_item/bindings/detail_item_binding.dart';
import '../modules/detail_item/views/detail_item_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTRODUCTION;

  static final routes = [
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ITEM,
      page: () => DetailItemView(),
      binding: DetailItemBinding(),
    ),
  ];
}

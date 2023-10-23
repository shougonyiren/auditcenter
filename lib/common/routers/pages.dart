import 'package:auditcenter/pages/home/bindings.dart';
import 'package:auditcenter/pages/home/view.dart';
import 'package:flutter/material.dart';
import 'package:auditcenter/common/middlewares/middlewares.dart';
import 'package:auditcenter/pages/application/index.dart';
import 'package:auditcenter/pages/category/index.dart';
import 'package:auditcenter/pages/frame/sign_in/index.dart';
import 'package:auditcenter/pages/frame/sign_up/index.dart';
import 'package:auditcenter/pages/frame/welcome/index.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Home = AppRoutes.Home;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 首页
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding:HomeBinding(),
      middlewares: [
        //RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    // 需要登录
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),


    // 分类列表
    GetPage(
      name: AppRoutes.Category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );

}

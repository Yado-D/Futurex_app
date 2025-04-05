import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/features/pages/home/bloc/home_bloc.dart';
import 'package:futurex/features/pages/home/home_page.dart';
import 'package:futurex/features/pages/index.dart';
import 'package:futurex/features/pages/quiz/quiz_bloc/quiz_bloc.dart';
import 'package:futurex/features/pages/quiz/quiz_page.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_page.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_page_2_bloc/welcome_page_2_bloc.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_prfile_setup_page_3.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_profile_setup_page_1.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_profile_setup_page_2.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_profile_setup_page_5.dart';
import 'package:futurex/route_handler/name.dart';
import 'package:futurex/services/global.dart';

import '../features/pages/welcome page/welcome_page_1_bloc/welcome_profile_setup_bloc.dart';
import '../features/pages/welcome page/welcome_profile_setup_page_4.dart';

class NamedRouteSettings {
  NamedRouteSettings({required BuildContext context});

  static List<pageEntity> allPages() {
    return [
      pageEntity(
        route: NamedRoutes.WELCOMEPAGE,
        page: const Welcome_Page(),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_1,
        page: Welcome_Profile_Setup_Page_1(),
        bloc: BlocProvider(
          create: (_) => WelcomeProfileSetupBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_2,
        page:  Welcome_Profile_Setup_Page_2(),
        bloc: BlocProvider(
          create: (_) => WelcomePage2Bloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.HOMEPAGE,
        page:  Home_Page(),
        bloc: BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.INDEXPAGE,
        page:  Index_Page(),
        // bloc: BlocProvider(
        //   create: (_) => WelcomePage2Bloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.HOMEPAGE,
        page:  Quiz_Page(),
        bloc: BlocProvider(
          create: (_) => QuizBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_3,
        page:  Welcome_Page_3(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_4,
        page:  Welcome_Page_4(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_5,
        page:  Welcome_Page_5(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in allPages()) {
      if (bloc.bloc != null) blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var route = allPages().where((element) => element.route == settings.name);
      if (route.isNotEmpty) {
        //check whether or not user is login or not
        bool alreadyMember = Global.storageServices.GetDeviceFirstOpen();
        // final userData =  Global.storageServices.getUserData(AppConstants.USER_DATA);
        if (route.first.route == NamedRoutes.WELCOMEPAGE && alreadyMember) {
          print('the user already pass the welcome page 4');
          return MaterialPageRoute(builder: (_) => Home_Page());
        }

        print('valid routes');
        return MaterialPageRoute(
            builder: (_) => route.first.page, settings: settings);
        //check if the user is already logged in to dont exaust user
        // by asking loggin again and again
        //   bool firstStartApp = Global.storageServices.GetDeviceFirstOpen();
        //   if (route.first.route == NamedRoutes.WELCOCME_PAGE1 && firstStartApp) {
        //     print('the user already pass the welcome page 4');
        //     return MaterialPageRoute(
        //         builder: (_) => const SignInPage(), settings: settings);
        //   }
        //   if (route.first.route == NamedRoutes.HOME_PAGE &&
        //       settings.arguments != null) {
        //     final arg = settings.arguments;
        //     if (arg is Map<String, dynamic>?) {
        //       print('user is  on free type');
        //       return MaterialPageRoute(
        //           builder: (_) => home_page(alpha: arg), settings: settings);
        //     }
        //   }
        //   if (route.first.route == NamedRoutes.ACCOUNT_PAGE &&
        //       settings.arguments != null) {
        //     final arg = settings.arguments;
        //     if (arg is Map<String, dynamic>?) {
        //       print('user is  on free type');
        //       return MaterialPageRoute(
        //           builder: (_) => account_page(alpha: arg), settings: settings);
        //     }
        //   } else {
        //     return MaterialPageRoute(
        //         builder: (_) => route.first.page, settings: settings);
        //   }
      }
      print('invalid routes');
    }
    return MaterialPageRoute(
        builder: (_) => const Welcome_Page(), settings: settings);
  }
}

class pageEntity {
  String route;
  Widget page;
  dynamic bloc;
  pageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}

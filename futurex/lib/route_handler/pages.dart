import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/Authentication/chatgpt_chatbot.dart';
import 'package:futurex/features/pages/AI_page/ai_page.dart';
import 'package:futurex/features/pages/AI_page/ai_page_bloc/aipage_bloc.dart';
import 'package:futurex/features/pages/AI_page/ai_service.dart';
import 'package:futurex/features/pages/home/bloc/home_bloc.dart';
import 'package:futurex/features/pages/home/home_page.dart';
import 'package:futurex/features/pages/home/specific_study_plan.dart';
import 'package:futurex/features/pages/home/specific_study_plan_bloc/specific_study_plan_bloc.dart';
import 'package:futurex/features/pages/home/study_plan_setup.dart';
import 'package:futurex/features/pages/index.dart';
import 'package:futurex/features/pages/onboarding%20pages/academic_information.dart';
import 'package:futurex/features/pages/onboarding%20pages/course_difficulty_and_prefrence.dart';
import 'package:futurex/features/pages/onboarding%20pages/goal_setup.dart';
import 'package:futurex/features/pages/onboarding%20pages/goal_setup_bloc/goal_setup_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/hobbie_bloc/new_hobbies_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/hobbie_page.dart';
import 'package:futurex/features/pages/onboarding%20pages/motivation_factor.dart';
import 'package:futurex/features/pages/onboarding%20pages/motivation_factor_bloc/motivation_factor_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/roll_model.dart';
import 'package:futurex/features/pages/onboarding%20pages/study_with_friend.dart';
import 'package:futurex/features/pages/quiz/quiz_bloc/quiz_bloc.dart';
import 'package:futurex/features/pages/quiz/quiz_page.dart';
import 'package:futurex/features/pages/setting/academic_prefrence.dart';
import 'package:futurex/features/pages/setting/find_and_activity.dart';
import 'package:futurex/features/pages/setting/goals_page.dart';
import 'package:futurex/features/pages/setting/language_page.dart';
import 'package:futurex/features/pages/setting/personal_info.dart';
import 'package:futurex/features/pages/setting/social_connection_page.dart';
import 'package:futurex/features/pages/setting/study_habbits.dart';
import 'package:futurex/features/pages/study/study_page.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_page.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_page_2_bloc/welcome_page_2_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/learning_style.dart';
import 'package:futurex/features/pages/onboarding%20pages/personal_information.dart';
import 'package:futurex/features/pages/onboarding%20pages/study_schedule_page.dart';
import 'package:futurex/features/pages/onboarding%20pages/final_date_picker.dart';
import 'package:futurex/route_handler/name.dart';
import 'package:futurex/services/global.dart';

import '../features/pages/onboarding pages/acadamic_information_bloc/academic_info_bloc.dart';
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
        route: NamedRoutes.ONBOARDINGPERSONALINFORMATION,
        page: OnboardingPersonalInformation(),
        bloc: BlocProvider(
          create: (_) => WelcomeProfileSetupBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.STUDYSCHEDULEPAGE,
        page: OnboardingStudySchedule(),
        bloc: BlocProvider(
          create: (_) => WelcomePage2Bloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.STUDYPAGE,
        page: PomodoroTimerPage(),
        bloc: BlocProvider(
          create: (_) => WelcomePage2Bloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.HOMEPAGE,
        page: Home_Page(),
        bloc: BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.INDEXPAGE,
        page: Index_Page(),
        // bloc: BlocProvider(
        //   create: (_) => WelcomePage2Bloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.QUIZPAGE,
        page: Quiz_Page(),
        bloc: BlocProvider(
          create: (_) => QuizBloc()..add(LoadQuestions()),
        ),
      ),
      pageEntity(
        route: NamedRoutes.LEARNINGSTYLE,
        page: OnboardingLearningStyle(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_4,
        page: Welcome_Page_4(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOMEPROFILESETUPPAGE_5,
        page: OnboardingFinalDatePicker(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ONBOARDINGACADEMICINFORMATRION,
        page: OnboardingAcademicInformation(),
        // bloc: BlocProvider(
        //   create: (_) => QuizBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ONBOARDINGCOURSEDIFFICULTY,
        page: OnboardingCourseDifficultyAndPrefrence(),
        bloc: BlocProvider(
          create: (_) => AcademicInfoBloc(),
        ),
      ),
      // pageEntity(
      //   route: NamedRoutes.ONBOARDINGFINALDATEPICKER,
      //   page: OnboardingFinalDatePicker(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => AcademicInfoBloc(),
      //   // ),
      // ),
      pageEntity(
        route: NamedRoutes.ONBOARDINGGOALSETUP,
        page: OnboardingGoalSetup(),
        bloc: BlocProvider(
          create: (_) => GoalSetupBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.ONBOARDINGMOTIVATIONFACTOR,
        page: OnBoardingMotivationFactor(),
        bloc: BlocProvider(
          create: (_) => MotivationFactorBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.STUDYWITHFRIEND,
        page: StudyWithFriend(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ROLEMODELPAGE,
        page: RollModel(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.HOBBIESPAGE,
        page: OnboardingHobbiesPage(),
        bloc: BlocProvider(
          create: (_) => NewHobbiesBloc()..add(LoadHobbies()),
        ),
      ),
      pageEntity(
        route: NamedRoutes.LANGUAGEPAGE,
        page: LanguagePage(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.PERSONALINFOPAGE,
        page: PersonalInfo(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.STUDYHABITPAGE,
        page: StudyHabbitPage(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ACADEMICPREFRENCE,
        page: AcademicPrefrence(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.GOALSPAGE,
        page: GoalsPage(),
        bloc: BlocProvider(
          create: (_) => GoalSetupBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.SOCIALCONNECTION,
        page: SocialConnection(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.FUNANDACTIVITY,
        page: FindAndActivity(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.AIPAGE,
        page: AIPage(),
        bloc: BlocProvider(
          create: (context) => AipageBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.STUDYPLANSETUPPAGE,
        page: StudyPlanSetup(),
        // bloc: BlocProvider(
        //   create: (_) => GoalSetupBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SPECIFICSTUDYPLANSETUPPAGE,
        page: SpecificStudyPlan(),
        bloc: BlocProvider(
          create: (_) => SpecificStudyPlanBloc(),
        ),
      ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGACADEMICPREFERENCE,
      //   page: SettingAcademicPreference(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGMOTIVATION,
      //   page: SettingMotivation(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGSOCIALCONNECTION,
      //   page: SettingSocialConnection(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGHOBBIES,
      //   page: SettingHobbies(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
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

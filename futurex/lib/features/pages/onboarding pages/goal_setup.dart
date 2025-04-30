import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/onboarding%20pages/goal_setup_bloc/goal_setup_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/goal_setup_bloc/goal_setup_bloc.dart';
import 'package:futurex/utils/color_collections.dart';

class OnboardingGoalSetup extends StatefulWidget {
  const OnboardingGoalSetup({super.key});

  @override
  State<OnboardingGoalSetup> createState() => _GoalSetupState();
}

class _GoalSetupState extends State<OnboardingGoalSetup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              buildStepProgressBar(7, 11),
              ReusableText(
                FromTop: 50,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Your Dream Goal After High School",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
              ),
              ReusableText(
                FromTop: 10,
                TextColor: ColorCollections.TeritiaryColor,
                TextString:
                    "Your future looks bright! We're here to support your dream.",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              ReusableText(
                FromTop: 25,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "What's your dream goal after high school?",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              BlocBuilder<GoalSetupBloc, GoalSetupState>(
                builder: (context, state) {
                  if (state.goalsTobe.isEmpty) {
                    context.read<GoalSetupBloc>().add(GoalsSetupLoadingEvent());
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.goalsTobe.length,
                    itemBuilder: (BuildContext context, index) {
                      return reusableContainer(
                          context,
                          state.goalsTobe[index],
                          state.index == index
                              ? ColorCollections.QuaterneryColor
                              : ColorCollections.PrimaryColor,
                          state.index == index
                              ? ColorCollections.PrimaryColor
                              : ColorCollections.TeritiaryColor,index);
                    },
                  );
                },
              ),
              reusableButtonContainer(context, "Continue",
                  ColorCollections.QuaterneryColor, Colors.white),
              reusableButtonContainer(context, "Back",
                  ColorCollections.PrimaryColor, ColorCollections.TeritiaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Back") {
          Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/onboarding_motivation_factor', (predicate) => true);
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 0, right: 13, left: 20),
        margin: EdgeInsets.only(top: 10, right: 3, left: 3),
        height: 55,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: contColor,
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
              TextColor: txtColor,
              // FromLeft: 15,
              FromRight: 10,
              // FromTop: 50,
              TextString: content,
              FontSize: 18,
              // TextFontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  Widget reusableContainer(
      BuildContext context, String content, Color contColor, Color txtColor,int index) {
    return InkWell(
      onTap: () {
         context.read<GoalSetupBloc>().add(GoalsSetupClickedEvent(index:index ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 0, right: 13, left: 20),
        margin: EdgeInsets.only(top: 10, right: 3, left: 3),
        height: 70,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: contColor,
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              TextColor: txtColor,
              // FromLeft: 15,
              FromRight: 10,
              // FromTop: 50,
              TextString: content,
              FontSize: 18,
              // TextFontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

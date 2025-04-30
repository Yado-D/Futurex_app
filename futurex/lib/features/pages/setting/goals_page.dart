import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/onboarding%20pages/goal_setup_bloc/goal_setup_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/motivation_factor_bloc/motivation_factor_bloc.dart';
import 'package:futurex/utils/color_collections.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: themeData.background,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorCollections.QuaterneryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: ColorCollections.PrimaryColor,
                        size: 30,
                      ),
                    ),
                    ReusableText(
                      TextColor: ColorCollections.PrimaryColor,
                      TextString: "Goals & Motivation",
                      FontSize: 18,
                      FromBottom: 0,
                      FromTop: 0,
                      TextFontWeight: FontWeight.w400,
                      // TextFontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 20, right: 15, left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ColorCollections.SecondaryColor),
                // color: themeData.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 30,
                  TextColor: themeData.primary,
                  TextString: "Your Dream Goal After High School",
                  FontSize: 20,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor: themeData.primary,
                  TextString:
                      "Your future looks bright! We're here to support your dream.",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                ReusableText(
                  FromTop: 25,
                  TextColor: themeData.primary,
                  TextString: "What's your dream goal after high school?",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                BlocBuilder<GoalSetupBloc, GoalSetupState>(
                  builder: (context, state) {
                    if (state.goalsTobe.isEmpty) {
                      context
                          .read<GoalSetupBloc>()
                          .add(GoalsSetupLoadingEvent());
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
                                : themeData.primaryContainer,
                            state.index == index
                                ? ColorCollections.PrimaryColor
                                : themeData.primary,
                            index);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 20, right: 15, left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ColorCollections.SecondaryColor),
                // color: themeData.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 30,
                  TextColor: themeData.primary,
                  TextString: "What Motivates You?",
                  FontSize: 20,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor: themeData.primary,
                  TextString:
                  "Knowing what motivates you helps us keep you inspired. Keep going!",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                ReusableText(
                  FromTop: 25,
                  FromBottom: 20,
                  TextColor: themeData.primary,
                  TextString:
                  "What motivates you to keep going? Select all that apply.",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                BlocBuilder<MotivationFactorBloc, MotivationFactorState>(
                  builder: (context, state) {
                    if (state.motives == null || state.selectedMotives == null) {
                      context
                          .read<MotivationFactorBloc>()
                          .add(MotivationFactorLoadingEvent());
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.motives?.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return CommonCheckBoxes(state.selectedMotives![index],
                            state.motives![index], index);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          reusableButtonContainer(context, "Save Changes",
              ColorCollections.QuaterneryColor, Colors.white),
        ],
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
              context, '/index_page', (predicate) => true);
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 0, right: 13, left: 20),
        margin: EdgeInsets.only(top: 10, right: 15, left: 15,bottom: 15),
        height: 55,
        width: double.infinity,
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

  Widget CommonCheckBoxes(bool isChecked, String content, int index) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              context.read<MotivationFactorBloc>().add(
                  MotivationFactorClickedEvent(
                    isChecked: value!,
                    index: index,
                  ));
            },
            activeColor: Colors.blue, // Checked color
            checkColor: Colors.white, // Checkmark color
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return ColorCollections.QuaterneryColor; // Custom checked color
              }
              return ColorCollections.PrimaryColor; // Unchecked color
            }),
          ),
          Expanded(
            child: ReusableText(
              TextColor: Theme.of(context).colorScheme.primary,
              TextString: content,
              FontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget reusableContainer(BuildContext context, String content,
      Color contColor, Color txtColor, int index) {
    return InkWell(
      onTap: () {
        context.read<GoalSetupBloc>().add(GoalsSetupClickedEvent(index: index));
      },
      child: Container(
        padding: EdgeInsets.only(top: 0, right: 13, left: 20),
        margin: EdgeInsets.only(top: 10, right: 3, left: 3),
        height: 70,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: contColor,
            // border: Border.all(color: Colors.grey.shade300),
        ),
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

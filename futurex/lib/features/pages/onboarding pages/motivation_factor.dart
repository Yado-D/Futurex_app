import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/onboarding%20pages/motivation_factor_bloc/motivation_factor_bloc.dart';
import 'package:futurex/features/pages/onboarding%20pages/motivation_factor_bloc/motivation_factor_bloc.dart';
import 'package:futurex/utils/color_collections.dart';

class OnBoardingMotivationFactor extends StatefulWidget {
  const OnBoardingMotivationFactor({super.key});

  @override
  State<OnBoardingMotivationFactor> createState() =>
      _OnBoardingMotivationFactorState();
}

class _OnBoardingMotivationFactorState
    extends State<OnBoardingMotivationFactor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              buildStepProgressBar(8, 11),
              ReusableText(
                FromTop: 50,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "What Motivates You?",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
              ),
              ReusableText(
                FromTop: 10,
                TextColor: ColorCollections.TeritiaryColor,
                TextString:
                    "Knowing what motivates you helps us keep you inspired. Keep going!",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              ReusableText(
                FromTop: 25,
                FromBottom: 20,
                TextColor: ColorCollections.TeritiaryColor,
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
              SizedBox(height: 20,),
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
              TextColor: ColorCollections.TeritiaryColor,
              TextString: content,
              FontSize: 18,
            ),
          ),
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
              context, '/study_with_friend', (predicate) => true);
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
}

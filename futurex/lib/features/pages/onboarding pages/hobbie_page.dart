import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/onboarding%20pages/hobbie_bloc/new_hobbies_bloc.dart';
import 'package:futurex/services/app_constants.dart';
import 'package:futurex/services/global.dart';
import 'package:futurex/utils/color_collections.dart';

class OnboardingHobbiesPage extends StatefulWidget {
  const OnboardingHobbiesPage({super.key});

  @override
  State<OnboardingHobbiesPage> createState() => _OnboardingHobbiesPageState();
}

class _OnboardingHobbiesPageState extends State<OnboardingHobbiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              buildStepProgressBar(11,11),
              ReusableText(
                FromTop: 50,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Hobbies & Interests",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
              ),
              ReusableText(
                FromTop: 10,
                TextColor: ColorCollections.TeritiaryColor,
                TextString:
                    "Learning more about your interests helps us create a perfect balance for you.",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              ReusableText(
                FromTop: 10,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "What do you like to do for fun?",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              ReusableText(
                FromTop: 15,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Choose a category",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),

              BlocBuilder<NewHobbiesBloc, NewHobbiesState>(
                builder: (context, state) {
                  if (state is HobbieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is HobbieError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is HobbieLoaded) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          // Main Hobbies List
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.hobbies.length,
                            itemBuilder: (context, index) {
                              final hobby = state.hobbies[index];
                              return CommonCheckBoxes(
                                isSelected: hobby.isSelected,
                                label: hobby.name,
                                index: index,
                                type: "hobbie",
                                onChanged: (value) {
                                  context
                                      .read<NewHobbiesBloc>()
                                      .add(ToggleHobbieSelection(index));
                                },
                              );
                            },
                          ),

                          // Sub-Hobbies List
                          ...state.hobbies.map((hobby) {
                            if (!hobby.isSelected) return const SizedBox();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  FromTop: 15,
                                  TextColor: ColorCollections.TeritiaryColor,
                                  TextString: hobby.question,
                                  FontSize: 18,
                                  TextFontWeight: FontWeight.w400,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: hobby.subHobbies.length,
                                  itemBuilder: (context, subIndex) {
                                    return CommonCheckBoxes(
                                      isSelected:
                                          hobby.subHobbiesSelection[subIndex],
                                      label: hobby.subHobbies[subIndex],
                                      index: subIndex,
                                      type: "subHobbie",
                                      onChanged: (value) {
                                        context.read<NewHobbiesBloc>().add(
                                            ToggleSubHobbieSelection(
                                                state.hobbies.indexOf(hobby),
                                                subIndex));
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
              SizedBox(height: 20,),
              reusableButtonContainer(
                  context, "Continue", ColorCollections.QuaterneryColor, Colors.white),
              reusableButtonContainer(
                  context, "Back", ColorCollections.PrimaryColor, ColorCollections.TeritiaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget CommonCheckBoxes(
      {required bool isSelected,
      required String label,
      required int index,
      required String type,
      required ValueChanged<bool?> onChanged}) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onChanged,
            activeColor: Colors.blue,
            // Checked color
            checkColor: Colors.white,
            // Checkmark color
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return ColorCollections.QuaterneryColor; // Custom checked color
              }
              return ColorCollections.PrimaryColor; // Unchecked color
            }),
          ),
          Expanded(
            child: ReusableText(
              TextColor: ColorCollections.TeritiaryColor,
              TextString: label,
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
              context, '/index_page', (predicate) => false);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 3, left: 3),
        height: 55,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: contColor,
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: ReusableText(
            TextColor: txtColor,
            // FromLeft: 15,
            FromRight: 10,
            // FromTop: 50,
            TextString: content,
            FontSize: 18,
            // TextFontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

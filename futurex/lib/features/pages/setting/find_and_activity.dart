import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/onboarding%20pages/hobbie_bloc/new_hobbies_bloc.dart';
import 'package:futurex/utils/color_collections.dart';

class FindAndActivity extends StatefulWidget {
  const FindAndActivity({super.key});

  @override
  State<FindAndActivity> createState() => _FindAndActivityState();
}

class _FindAndActivityState extends State<FindAndActivity> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: themeData.background,
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
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
                      TextString: "Fun & Activity",
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
            margin: EdgeInsets.only(top: 10,left: 15,right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ColorCollections.SecondaryColor),
                // color: ColorCollections.PrimaryColor
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 30,
                  TextColor: themeData.primary,
                  TextString: "Hobbies & Interests",
                  FontSize: 20,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor: themeData.primary,
                  TextString:
                      "Learning more about your interests helps us create a perfect balance for you.",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor: themeData.primary,
                  TextString: "What do you like to do for fun?",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                ReusableText(
                  FromTop: 15,
                  TextColor: themeData.primary,
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
                                    TextColor: themeData.primary,
                                    TextString: hobby.question,
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w400,
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
          reusableButtonContainer(
              context, "Save the changes", Colors.blue, Colors.white),
        ],
      )),
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
              context, '/index_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 15, left: 15,bottom: 20),
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

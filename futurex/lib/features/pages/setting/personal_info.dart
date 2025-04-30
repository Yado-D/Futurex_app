import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
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
                      TextString: "Personal Info",
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  TextColor: themeData.primary,
                  TextString: "Your Name",
                  FontSize: 20,
                  FromBottom: 0,
                  FromTop: 0,
                  TextFontWeight: FontWeight.w700,
                  // TextFontWeight: FontWeight.bold,
                ),
                reusableTextField(
                  context: context,
                  FromLeft: 0,
                  FromRight: 25,
                  hintText: "Your name",
                  textType: "",
                  onchange: (onchange) {},
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor:  themeData.primary,
                  TextString: "Your Grade",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w700,
                ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 15, left: 0, bottom: 20),
              child: DropdownMenu(
                  width: double.infinity,
                  onSelected: (value) {
                    setState(() {});
                  },
                  initialSelection: "Grade 9",
                  inputDecorationTheme:  InputDecorationTheme(
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent), // Border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      // borderSide:
                      // BorderSide(color: Colors.white), // Unfocused border
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderSide:
                      // BorderSide(color: Colors.white), // Focused border
                    ),
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                      value: "Grade 9",
                      label: "Grade 9",
                    ),
                    DropdownMenuEntry(
                      value: "Grade 10",
                      label: "Grade 10",
                    ),
                    DropdownMenuEntry(
                      value: "Grade 11",
                      label: "Grade 11",
                    ),DropdownMenuEntry(
                      value: "Grade 12",
                      label: "Grade 12",
                    ),

                  ]),
                 ),
                ReusableText(
                  TextColor: themeData.primary,
                  TextString: "Your School",
                  FontSize: 20,
                  FromBottom: 0,
                  FromTop: 0,
                  TextFontWeight: FontWeight.w700,
                  // TextFontWeight: FontWeight.bold,
                ),
                reusableTextField(
                  context: context,
                  FromLeft: 0,
                  FromRight: 25,
                  hintText: "Harvard",
                  textType: "",
                  onchange: (onchange) {},
                ),
              ],
            ),
          ),
          reusableButtonContainer(context, "Save Changes",
              ColorCollections.QuaterneryColor, Colors.white)
        ],
      )),
    );
  }
  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/index_page', (predicate) => true);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 15, left: 15),
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

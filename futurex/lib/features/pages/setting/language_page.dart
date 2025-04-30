import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
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
                      TextString: "Language & App Intro",
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
          ReusableText(
            TextColor: themeData.primary,
            TextString: "Choose Your Language",
            FontSize: 20,
            FromBottom: 0,
            FromTop: 70,
            FromLeft: 20,
            TextFontWeight: FontWeight.w800,
            // TextFontWeight: FontWeight.bold,
          ),
          Container(
            margin: EdgeInsets.only(top: 40, right: 15, left: 15, bottom: 40),
            child: DropdownMenu(
                width: double.infinity,
                onSelected: (value) {
                  setState(() {});
                },
                initialSelection: "English",
                inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), // Unfocused border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), // Focused border
                  ),
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: "English",
                    label: "English",
                  ),
                  DropdownMenuEntry(
                    value: "Amharic",
                    label: "Amharic",
                  ),
                ]),
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

//this is for the page that need the shaped container

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurex/features/pages/home/home_page.dart';
import 'package:futurex/services/app_constants.dart';
import 'package:futurex/services/global.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class FullPageContainer extends StatelessWidget {
  const FullPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/logos/bg.jpg'),
        ),
      ),
    );
  }
}

//this is for reusable text

// ignore: must_be_immutable
class ReusableText extends StatelessWidget {
  String TextString;
  Color TextColor;
  double FontSize;
  FontWeight TextFontWeight;
  double FromTop;
  double FromLeft;
  double FromRight;
  double FromBottom;

  ReusableText({
    super.key,
    required this.TextString,
    this.TextColor = ColorCollections.PrimaryColor,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w500,
    this.FromTop = 5,
    this.FromLeft = 5,
    this.FromRight = 5,
    this.FromBottom = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: FromTop,
        left: FromLeft,
        right: FromRight,
        bottom: FromBottom,
      ),
      child: Text(
        TextString,
        overflow: TextOverflow.fade,
        style: GoogleFonts.lato(
          color: TextColor,
          fontSize: FontSize,
          fontWeight: TextFontWeight,
        ),
      ),
    );
  }
}

//this is for button that we use in the app

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String ButtonText;
  double ButtonHeight;
  double ButtonWidth;
  FontWeight ButtonFontWeight;
  double FontSize;
  Color ButtonColor;
  Color ContainerColor;
  AppButton({
    super.key,
    required this.ContainerColor,
    required this.ButtonText,
    this.ButtonColor = ColorCollections.PrimaryColor,
    this.ButtonFontWeight = FontWeight.bold,
    this.ButtonHeight = 30,
    this.ButtonWidth = 70,
    this.FontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonHeight,
      width: ButtonWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorCollections.SecondaryColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: ContainerColor.withOpacity(1),
      ),
      child: Center(
        child: Text(
          ButtonText,
          style: TextStyle(
            fontWeight: ButtonFontWeight,
            fontSize: FontSize,
            color: ButtonColor,
          ),
        ),
      ),
    );
  }
}

//reusable text field

Widget reusableTextField({
  required BuildContext context,
  String? icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 300,
  double widthOfTextField = 150,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 45.h,
    // width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
      // border: Border.all(color: Colors.grey.shade100),
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        icon_name != null
            ? Container(
                height: 16.w,
                width: 16.w,
                margin: const EdgeInsets.only(left: 17),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/flat_icons/$icon_name.png"),
                  ),
                ),
              )
            : SizedBox(),
        Expanded(
          child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              isDense: true,
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        if (!(suffix_icon_name == ''))
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}

Widget reusableChatBotTextField({
  required BuildContext context,
  String? icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  // required void Function(String values)? onchange,
  required VoidCallback onTap,
  double WidthOfContainer = 300,
  double widthOfTextField = 150,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
  required TextEditingController controller,
}) {
  return Container(
    height: 45.h,
    // width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade100),
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        icon_name != null
            ? Container(
                height: 16.w,
                width: 16.w,
                margin: const EdgeInsets.only(left: 17),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/flat_icons/$icon_name.png"),
                  ),
                ),
              )
            : SizedBox(),
        Expanded(
          child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            controller: controller,
            // onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              isDense: true,
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 35.w,
            width: 35.w,
            margin: const EdgeInsets.only(left: 17, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade400)),
            child: Image.asset(
              "assets/icons/normals/send.png",
              color: controller.text.isNotEmpty
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface,
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget reusableTextFieldForCountryCode({
  String? icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 300,
  double widthOfTextField = 150,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 45.h,
    width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: ColorCollections.PrimaryColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      border: Border.all(color: const Color.fromARGB(255, 192, 190, 190)),
    ),
    child: Row(
      children: [
        icon_name != null
            ? Container(
                height: 16.w,
                width: 16.w,
                margin: const EdgeInsets.only(left: 17),
                child: Image.asset("assets/icons/flat_icons/$icon_name.png"),
              )
            : SizedBox(),
        SizedBox(
          height: 45.h,
          width: widthOfTextField.h,
          child: TextField(
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        if (!(suffix_icon_name == ''))
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}

AppBar SimpleAppBars(BuildContext context, String title,
    {bool? isDescription = false}) {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.only(left: 8, bottom: 15),
      child: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pushNamed('/home_page');
          }
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 26,
          color: Color(0xFF003540),
        ),
      ),
    ),
    backgroundColor: ColorCollections.PrimaryColor,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 203, 203, 203),
            width: 1.0,
          ),
        ),
      ),
      height: 120,
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: ReusableText(
                FromLeft: 40,
                TextString: title,
                FontSize: 26,
                TextColor: Color(0xFF003540),
                TextFontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      isDescription == true
          ? InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => Home_Page(),
                    ),
                    (predicate) => false);
              },
              child: Container(
                margin: EdgeInsets.only(right: 15, bottom: 10),
                child: Icon(
                  Icons.cancel,
                  size: 26,
                  color: ColorCollections.QuaterneryColor,
                ),
              ),
            )
          : SizedBox(),
    ],
  );
}

AppBar ReusableAppBar(VoidCallback ontap, BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(
                255, 203, 203, 203), // Change to your desired color
            width: 1.0, // Change to your desired width
          ),
        ),
      ),
    ),
    automaticallyImplyLeading: false,
    backgroundColor: ColorCollections.PrimaryColor,
    title: Container(
      margin: const EdgeInsets.only(left: 0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 35.h,
              width: 35.w,
              child: Image.asset(
                'assets/icons/flat_icons/menu-bar.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 80, right: 10),
              height: 120.h,
              width: 130.w,
              child: Image.asset(
                'assets/logos/tlefli_logo.png',
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => NotificationPage()));
        },
        child: Stack(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.red.shade600,
                  size: 30,
                )),
            Container(
              margin:
                  const EdgeInsets.only(top: 0, left: 16, right: 10, bottom: 0),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade900,
              ),
              child: Center(
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "${2}",
                  FontSize: 10,
                  TextColor: ColorCollections.PrimaryColor,
                  TextFontWeight: FontWeight.w900,
                ),
              ),
            )
            // BlocBuilder<NotificationCubit, NotificationState>(
            //   builder: (context, state) {
            //
            //     if(state is NotificationErrorState || state is NotificationLoadingState){
            //       return Container(
            //         margin: const EdgeInsets.only(top: 0,left: 16, right: 10,bottom: 0),
            //         height: 25,
            //         width: 25,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Colors.red.shade900,
            //         ),
            //         child: Center(
            //           child: ReusableText(
            //             FromTop: 0,
            //             FromBottom: 0,
            //             TextString: "${0}",
            //             FontSize: 10,
            //             TextColor: ColorCollections.PrimaryColor,
            //             TextFontWeight: FontWeight.w900,
            //           ),
            //         ),
            //       );
            //     }
            //     final val = state as NotificationLoadedState;
            //     int count = 0;
            //     for(int i=0;i<val.notifications.length;i++){
            //       if(state.notifications[i].isSent!){
            //         count++;
            //       }
            //     }
            //
            //     return Container(
            //       margin: const EdgeInsets.only(top: 0,left: 16, right: 10,bottom: 0),
            //       height: 25,
            //       width: 25,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.red.shade900,
            //       ),
            //       child: Center(
            //         child: ReusableText(
            //           FromTop: 0,
            //           FromBottom: 0,
            //           TextString: "${count}",
            //           FontSize: 10,
            //           TextColor: ColorCollections.PrimaryColor,
            //           TextFontWeight: FontWeight.w900,
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    ],
  );
}

CustomShowDialoge(BuildContext context) {
  // String item_photo = item_model. ?? '';
  // String item_cat = item_model.main_catagory ?? '';
  // String item_cat = item_model.main_catagory ?? '';
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      // String item_cat = item_model.main_catagory ?? '';
      // String item_name = item_model.nested_item ?? '';
      // String item_description = item_model.item_description ?? '';
      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: ColorCollections.PrimaryColor,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.fromViewConstraints(
              ViewConstraints(maxHeight: 500, maxWidth: 350),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ReusableText(
                    TextString:
                        " AppLocalizations.of(context)!.youHaveSuccessfully",
                    FontSize: 20,
                  ),
                ),
                Center(
                  child: ReusableText(
                    TextString: ",",
                    FontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: " AppLocalizations.of(context)!.category",
                      FontSize: 15,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: ReusableText(TextString: "item_cat", FontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: "AppLocalizations.of(context)!.itemName",
                      FontSize: 15,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child:
                          ReusableText(TextString: "item_name", FontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: "AppLocalizations.of(context)!.description",
                      FontSize: 15,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.fromViewConstraints(
                          ViewConstraints(maxWidth: 198)),
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ReusableText(
                            TextString: "item_description", FontSize: 16),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                "item_model.pickedImage" != null
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            FromLeft: 15,
                            TextString: "AppLocalizations.of(context)!.photo",
                            FontSize: 15,
                            TextColor: ColorCollections.TeritiaryColor,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 57),
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                color: ColorCollections.SecondaryColor,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage("assets/inspire.jpg"),
                                )),
                          )
                        ],
                      )
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home_page', (route) => false);
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            color: ColorCollections.TeritiaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString:
                                  "AppLocalizations.of(context)!.goToHome",
                              TextColor: ColorCollections.PrimaryColor,
                              FontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}

Drawer CustomDrowerElement(
    VoidCallback ontap, BuildContext context, Animation<Offset> animation) {
  return Drawer(
    child: Container(
      color: ColorCollections.SecondaryColor,
      padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 100),
            child: SlideTransition(
              position: animation,
              child: IconButton(
                onPressed: ontap,
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                DrowerWidget(
                    Icons.settings, "AppLocalizations.of(context)!.settings",
                    () {
                  Navigator.of(context).pushNamed('/welcome_page');
                }),
                DrowerWidget(Icons.language_outlined,
                    "AppLocalizations.of(context)!.language", () {
                  Navigator.of(context).pushNamed('/language_page');
                }),
                DrowerWidget(
                    Icons.info, "AppLocalizations.of(context)!.aboutUs", () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/about_us_page', (route) => false);
                }),
                DrowerWidget(Icons.logout_outlined,
                    "AppLocalizations.of(context)!.logOut", () {
                  Global.storageServices.setDeviceOpenedFirst(
                      AppConstants.STORAGE_DEVICE_OPENED_FIRST, false);
                  LogoutShowDialogue(context);
                }),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  height: 1,
                  width: 230,
                  color: ColorCollections.TeritiaryColor,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 25,
                      FromBottom: 0,
                      TextString: 'TEFLI company',
                      FontSize: 14,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                    InkWell(
                      onTap: () {},
                      child: ReusableText(
                        FromTop: 5,
                        TextString: 'Privacy Policy',
                        FontSize: 14,
                        TextColor: const Color.fromARGB(255, 23, 120, 222),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget DrowerWidget(IconData icons, String text, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              icons,
              size: 35,
              color: Color(0xFF003540),
            ),
          ),
          ReusableText(
            FromLeft: 15,
            TextString: text,
            FontSize: 20,
            TextColor: ColorCollections.TeritiaryColor,
          ),
        ],
      ),
    ),
  );
}

LogoutShowDialogue(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        ReusableText(
                          TextColor: Colors.red.shade900,
                          TextString: "AppLocalizations.of(context)!.logOut",
                          FontSize: 20,
                          TextFontWeight: FontWeight.w700,
                        ),
                        ReusableText(
                          TextColor: ColorCollections.TeritiaryColor,
                          TextString:
                              " AppLocalizations.of(context)!.areYouSureLogout",
                          FontSize: 19,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/sign_in_page');
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: ColorCollections.SecondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString:
                                    " AppLocalizations.of(context)!.confirm",
                                FontSize: 18,
                                TextColor: Colors.red.shade900,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: ColorCollections.TeritiaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString:
                                    "AppLocalizations.of(context)!.cancel",
                                FontSize: 18,
                                TextColor: ColorCollections.PrimaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
}

Widget buildStepProgressBar(int currentStep, int totalSteps) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(totalSteps, (index) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          height: 6,
          decoration: BoxDecoration(
            color: index < currentStep ? Colors.blue : Colors.blue[100],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    }),
  );
}

Widget CommonSliderWidget({
  required BuildContext context,
  required double maxValue,
  required double minValue,
  required double valuePicked,
  required int division,
  required bool selectedPoint,
  required String labelText,
  required ValueChanged<double> onChanged,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(2),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12,
              disabledThumbRadius: 12,
              elevation: 4,
            ),
            activeTrackColor: Colors.grey.shade200,
            inactiveTrackColor: Colors.grey.shade200,
            thumbColor: ColorCollections.QuaterneryColor,
            overlayColor: ColorCollections.QuaterneryColor.withOpacity(0.2),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: ColorCollections.QuaterneryColor,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Slider(
            value: valuePicked.clamp(
                minValue, maxValue), // Ensures value stays in bounds
            min: minValue,
            max: maxValue,
            divisions: division,
            label: labelText,
            onChanged: onChanged, // Directly use the callback
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              TextString: minValue.toStringAsFixed(0), // Dynamic min value
              FontSize: 18,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ReusableText(
              TextString: maxValue.toStringAsFixed(0), // Dynamic max value
              FontSize: 18,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget ReusableSchedulingInformation({
  required BuildContext context,
  required double studyTimeOfDayInHour,
  required double studyTimeOfDayInMinute,
  required String studyTimeOfDayTimeFormat,
  required double studyDurationPerWeekend,
  required double studyWeekendHour,
  required double studyWeekendMinute,
  required String restDay,
  required double wakeupTimeOfDayInHour,
  required double wakeupTimeOfDayInMinute,
  required String wakeupTimeOfDayTimeFormat,
  required ValueChanged<int> studyTimeOfDayInHourFunction,
  required ValueChanged<int> studyTimeOfDayInMinuteFunction,
  required VoidCallback studyTimeOfDayTimeFormatFunction,
  required ValueChanged<double> studyDurationPerWeekendFunction,
  required ValueChanged<double> studyWeekendHourFunction,
  required ValueChanged<String?>? restDayFunction,
  required ValueChanged<int> wakeupTimeOfDayInHourFunction,
  required ValueChanged<int> wakeupTimeOfDayInMinuteFunction,
  required VoidCallback wakeupTimeOfDayTimeFormatFunction,
}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 10,
              TextColor: Theme.of(context).colorScheme.primary,
              TextString: "On what time of the day do you usually study?",
              FontSize: 20,
              TextFontWeight: FontWeight.w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: studyTimeOfDayInHour.toInt(),
                  minValue: 0,
                  maxValue: 100,
                  onChanged: studyTimeOfDayInHourFunction,
                  textStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  selectedTextStyle: TextStyle(
                      color: ColorCollections.QuaterneryColor, fontSize: 20),
                  decoration: BoxDecoration(
                      // border: Border(
                      //   top: BorderSide(color: ColorCollections.ThemeColor),
                      //   bottom: BorderSide(color: ColorCollections.ThemeColor),
                      // ),
                      ),
                ),
                SizedBox(
                  width: 10,
                ),
                NumberPicker(
                  value: studyTimeOfDayInMinute.toInt(),
                  minValue: 0,
                  maxValue: 100,
                  onChanged: studyTimeOfDayInMinuteFunction,
                  textStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  selectedTextStyle: TextStyle(
                      color: ColorCollections.QuaterneryColor, fontSize: 20),
                  decoration: BoxDecoration(
                      // border: Border(
                      //     top: BorderSide(color: ColorCollections.ThemeColor),
                      //     bottom: BorderSide(color: ColorCollections.ThemeColor),
                      // ),
                      ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: studyTimeOfDayTimeFormatFunction,
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: studyTimeOfDayTimeFormat == "AM"
                                  ? ColorCollections.QuaterneryColor
                                  : Colors.blue.shade100,
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString: "AM",
                                FontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: studyTimeOfDayTimeFormatFunction,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: studyTimeOfDayTimeFormat == "PM"
                                  ? ColorCollections.QuaterneryColor
                                  : Colors.blue.shade100,
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString: "PM",
                                FontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 10,
              FromBottom: 10,
              TextColor:Theme.of(context).colorScheme.primary,
              TextString: "Study Duration(Weekday)",
              FontSize: 20,
              TextFontWeight: FontWeight.w500,
            ),
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                        disabledThumbRadius: 12,
                        elevation: 4,
                      ),
                      activeTrackColor: Colors.grey.shade200,
                      inactiveTrackColor: Colors.grey.shade200,
                      thumbColor: ColorCollections.QuaterneryColor,
                      overlayColor:
                          ColorCollections.QuaterneryColor.withOpacity(0.2),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: ColorCollections.QuaterneryColor,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Slider(
                      value: studyDurationPerWeekend,
                      min: 0,
                      max: 6,
                      divisions: 7,
                      label: '${studyDurationPerWeekend.round()} Hour',
                      onChanged: studyDurationPerWeekendFunction,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      7,
                      (index) => ReusableText(
                        TextString: '$index',
                        FontSize: 14,
                        TextColor: studyDurationPerWeekend.round() == index
                            ? ColorCollections.QuaterneryColor
                            : Colors.grey,
                        TextFontWeight: studyDurationPerWeekend.round() == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 10,
              FromBottom: 10,
              TextColor: Theme.of(context).colorScheme.primary,
              TextString: "Weekend study hour(hours)",
              FontSize: 20,
              TextFontWeight: FontWeight.w500,
            ),
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                        disabledThumbRadius: 12,
                        elevation: 4,
                      ),
                      activeTrackColor: Colors.grey.shade200,
                      inactiveTrackColor: Colors.grey.shade200,
                      thumbColor: ColorCollections.QuaterneryColor,
                      overlayColor:
                          ColorCollections.QuaterneryColor.withOpacity(0.2),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: ColorCollections.QuaterneryColor,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Slider(
                      value: studyWeekendHour,
                      min: 0,
                      max: 6,
                      divisions: 7,
                      label: '${studyWeekendHour.round()} Hour',
                      onChanged: studyWeekendHourFunction,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        7,
                        (index) => ReusableText(
                              TextString: '$index',
                              FontSize: 14,
                              TextColor: studyWeekendHour.round() == index
                                  ? ColorCollections.QuaterneryColor
                                  : Colors.grey,
                              TextFontWeight: studyWeekendHour.round() == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        padding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 30, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 20,
              FromBottom: 30,
              TextColor: Theme.of(context).colorScheme.primary,
              TextString: "Rest Day",
              FontSize: 18,
              TextFontWeight: FontWeight.w500,
            ),
            DropdownMenu(
                width: double.infinity,
                onSelected: restDayFunction,
                initialSelection: "None",
                inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.white), // Border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderSide:
                    //     BorderSide(color: Colors.white), // Unfocused border
                  ),
                  focusedBorder: OutlineInputBorder(
                    // borderSide:
                    //     BorderSide(color: Colors.white), // Focused border
                  ),
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: "Monday",
                    label: "Monday",
                  ),
                  DropdownMenuEntry(
                    value: "Tuesday",
                    label: "Tuesday",
                  ),
                  DropdownMenuEntry(
                    value: "Wendsday",
                    label: "Wendsday",
                  ),
                  DropdownMenuEntry(
                    value: "Thursday",
                    label: "Thursday",
                  ),
                  DropdownMenuEntry(
                    value: "Friday",
                    label: "Friday",
                  ),
                  DropdownMenuEntry(
                    value: "Saturday",
                    label: "Saturday",
                  ),
                  DropdownMenuEntry(
                    value: "Sunday",
                    label: "Sunday",
                  ),
                  DropdownMenuEntry(
                    value: "None",
                    label: "None",
                  ),
                ]),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 10,
              TextColor: Theme.of(context).colorScheme.primary,
              TextString: "What time do you usually wake up?",
              FontSize: 20,
              TextFontWeight: FontWeight.w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: wakeupTimeOfDayInHour.toInt(),
                  minValue: 0,
                  maxValue: 100,
                  onChanged: wakeupTimeOfDayInHourFunction,
                  textStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  selectedTextStyle: TextStyle(
                      color: ColorCollections.QuaterneryColor, fontSize: 20),
                  decoration: BoxDecoration(),
                ),
                const SizedBox(
                  width: 10,
                ),
                NumberPicker(
                  value: wakeupTimeOfDayInMinute.toInt(),
                  minValue: 0,
                  maxValue: 100,
                  onChanged: wakeupTimeOfDayInMinuteFunction,
                  textStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  selectedTextStyle: TextStyle(
                      color: ColorCollections.QuaterneryColor, fontSize: 20),
                  decoration: BoxDecoration(
                      // border: Border(
                      //     top: BorderSide(color: ColorCollections.ThemeColor),
                      //     bottom: BorderSide(color: ColorCollections.ThemeColor),
                      // ),
                      ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: wakeupTimeOfDayTimeFormatFunction,
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: wakeupTimeOfDayTimeFormat == "AM"
                                  ? ColorCollections.QuaterneryColor
                                  : Colors.blue.shade100,
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString: "AM",
                                FontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: wakeupTimeOfDayTimeFormatFunction,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: wakeupTimeOfDayTimeFormat == "PM"
                                  ? ColorCollections.QuaterneryColor
                                  : Colors.blue.shade100,
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString: "PM",
                                FontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Welcome_Page_5 extends StatefulWidget {
  const Welcome_Page_5({super.key});

  @override
  State<Welcome_Page_5> createState() => _Welcome_Page_5State();
}

class _Welcome_Page_5State extends State<Welcome_Page_5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           margin: EdgeInsets.all(15),
           child: ListView(
             children: [
               LinearProgressBar(
                 maxSteps: 5,
                 progressType:
                 LinearProgressBar.progressTypeLinear, // Use Linear progress
                 currentStep: 5,
                 progressColor: Colors.blue,
                 backgroundColor: Colors.blue.shade50,
                 borderRadius: BorderRadius.circular(10), //  NEW
               ),
               Center(
                 child: ReusableText(
                   FromTop: 50,
                   TextColor: ColorCollections.Black,
                   TextString: "Course Difficulty Ranking",
                   FontSize: 23,
                   TextFontWeight: FontWeight.bold,
                 ),
               ),
               Center(
                 child: ReusableText(
                   FromTop: 10,
                   FromBottom: 0,
                   TextColor: ColorCollections.Black,
                   TextString: "Select the date of your Final Exam this can",
                   FontSize: 17,
                   TextFontWeight: FontWeight.w400,
                 ),
               ),
               Center(
                 child: ReusableText(
                   // FromTop: 50,
                   TextColor: ColorCollections.Black,
                   TextString: " be modified later in settings",
                   FontSize: 17,
                   TextFontWeight: FontWeight.w400,
                 ),
               ),
               InkWell(
                 onTap: ()=>_selectDate(),
                 child: Container(
                   margin: EdgeInsets.only(top: 50),
                   height: 60,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.grey.shade300),
                   ),
                   child:Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       ReusableText(
                         // FromTop: 50,
                         TextColor: ColorCollections.Black,
                         TextString: "Select the final date",
                         FontSize: 17,
                         TextFontWeight: FontWeight.w400,
                       ),
                       Icon(Icons.calendar_month),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: 100,),
               reusableButtonContainer(context,"Continue",Colors.blue,Colors.white),
               reusableButtonContainer(context,"Back",Colors.white,Colors.black54),
             ],
           ),
         ),
    );
  }
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      // setState(() {
      //   widget.item_model.date_picked = _picked.toString().split(" ")[0];
      // });
    }
  }

  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Back") {
          // Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/index_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 3, left: 3),
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
  // Future<void> _selecteTime() async {
  //   TimeOfDay? pickTime = await showTimePicker(
  //     // barrierColor: ColorCollections.TeritiaryColor,
  //     context: context,
  //     initialTime: _timeOfDay,
  //   );
  //   if (pickTime != null) {
  //     setState(() {
  //       widget.item_model.time_picked = pickTime.hour.toString() +
  //           " : " +
  //           pickTime.minute.toString().padLeft(2, '0');
  //     });
  //   }
  // }
}

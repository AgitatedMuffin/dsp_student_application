import 'package:dsp_student_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_student_application/Presentation/Global_components/NavBar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/side_menu.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/create_text_field.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      drawer: SideMenu(
        size: size,
      ),
      body: ScreenBody(),
      bottomNavigationBar: DiffNavBar(),
    );
  }
}

class ScreenBody extends StatefulWidget {
  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        //Screen Backgroud
        ArabicImage(
          size: size.height / 1.5,
          top: -size.height / 3,
          right: -size.height / 3,
          blendMode: BlendMode.srcATop,
          opacity: 0.05,
        ),

        //Screen content
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(bottom: 72),
              height: size.height - 56,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu bar
                  Padding(
                    padding: const EdgeInsets.only(top: 72),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 32,
                            color: AppColors.cDarkGrey,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Tashkeel ',
                            style: AppFonts.heading2.copyWith(
                              color: AppColors.cDarkGrey,
                            )),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      ///Creation of search text field
                      TextFieldCreation(
                        size: size,
                        text: 'Search',
                        icon: Icon(Icons.search,
                            size: 32, color: AppColors.cDarkGrey),
                      ),

                      SizedBox(height: 32),

                      ///Creation of New Quary text field
                      GradientOutline(
                        size: size,
                        radius: 32,
                        chld: Column(
                          children: [
                            TextFieldCreation(
                                size: size,
                                text: 'Write a new Query',
                                maximumLines: 8,
                                border: false),
                            UrgantBar(),
                          ],
                        ),
                      ),

                      SizedBox(height: 32),

                      Column(
                        children: [
                          ///Creation of File upload textfield
                          TextFieldCreation(
                              size: size,
                              text: 'Upload Text file',
                              icon: Icon(
                                Icons.add_circle_outline,
                                size: 32,
                                color: AppColors.cGreen,
                              )),

                          SizedBox(height: 8),

                          /// The Disclaimer
                          Center(
                            child: AutoSizeText(
                              '*Disclaimer: The file size should not exceed 10 Mbs',
                              style: AppFonts.versionControl,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

//4.2.2 New quary urgent bar consists of Text widget "Urgent" , swich , Image -> check
class UrgantBar extends StatefulWidget {
  @override
  _UrgantBarState createState() => _UrgantBarState();
}

class _UrgantBarState extends State<UrgantBar> {
  bool isUrgent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(
              "Urgent ",
              style: AppFonts.appText,
            ),
            Container(
              child: Switch(
                  value: isUrgent,
                  activeColor: AppColors.cGreen,
                  onChanged: (value) {}),
            )
          ]),
          SvgPicture.asset(
            "lib/Presentation/Images/check.svg",
            height: 32,
            color: AppColors.cGreen,
          ),
        ],
      ),
    );
  }
}

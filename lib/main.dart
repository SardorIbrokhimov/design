import 'package:analog_clock/analog_clock.dart';
import 'package:design/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Payment App',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFinished = false;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnalogClock(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3.0, color: Colors.white),
                                color: Colors.white,
                                shape: BoxShape.rectangle),
                            // decoration
                            width: 200,
                            height: 200,
                            isLive: true,
                            hourHandColor: Colors.black,
                            minuteHandColor: Colors.grey,
                            showSecondHand: true,
                            numberColor: Colors.black,
                            showNumbers: true,
                            textScaleFactor: 2,
                            showTicks: true,
                            showDigitalClock: true,
                            digitalClockColor: Colors.black,
                            datetime: DateTime(2020, 8, 4, 9, 11, 0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SwipeableButtonView(
                  buttonColor: Colors.black12,
                  buttonText: 'SLIDE TO UNLOCK',
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Colors.grey,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    await Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: HomePage()));

                    //TODO: For reverse ripple effect animation
                    setState(() {
                      isFinished = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

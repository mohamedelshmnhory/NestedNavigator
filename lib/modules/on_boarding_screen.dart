import 'package:flutter/material.dart';
import 'package:shormehh/layout/home.dart';
import 'package:shormehh/shared/components.dart';
import 'package:shormehh/shared/constants.dart';
import 'package:shormehh/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  var depController = TextEditingController();
  var type;
  bool isLast = false;
  List<BoardingModel> boarding = [];

  // void submit() {
  //   CacheHelper.saveData(
  //     key: 'onBoarding',
  //     value: true,
  //   ).then((value) {
  //     if (value) {
  //       navigateAndFinish(
  //         context,
  //         RegisterOptionsScreen(),
  //       );
  //     }
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boarding.addAll([
      BoardingModel(
        image: 'assets/images/delivery.png',
        title: 'model.data.splashTitle1',
        body: 'model.data.splashText1',
      ),
      BoardingModel(
        image: 'assets/images/delivery.png',
        title: 'model.data.splashTitle2',
        body: 'model.data.splashText2',
      ),
      BoardingModel(
        image: 'assets/images/delivery.png',
        title: 'model.data.splashTitle3',
        body: 'model.data.splashText3',
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    boardController.dispose();
    depController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    if (mounted)
                      setState(() {
                        isLast = true;
                      });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SmoothPageIndicator(
              controller: boardController,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: defaultColor,
                expansionFactor: 2,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 5.0,
              ),
              count: boarding.length,
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Text(
                'Find Food You Love',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                // alignment: Alignment.centerLeft,
                children: [
                  defaultFormField(
                    controller: depController,
                    type: TextInputType.name,
                    validate: (String value) {},
                    label: 'Select Language',
                    prefix: null,
                    prefixWidth: 0,
                    isClickable: false,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      onChanged: (selectedValue) {
                        depController.text = selectedValue == 0 ? 'AR' : 'EN';
                        type = selectedValue;
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('AR')),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('EN')),
                          value: 1,
                        ),
                      ].toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      // alignment: Alignment.centerLeft,
                      children: [
                        defaultFormField(
                          controller: depController,
                          type: TextInputType.name,
                          validate: (String value) {},
                          label: 'Branches',
                          prefix: null,
                          prefixWidth: 0,
                          isClickable: false,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            onChanged: (selectedValue) {
                              depController.text =
                                  selectedValue == 0 ? 'AR' : 'EN';
                              type = selectedValue;
                            },
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('AR')),
                                value: 0,
                              ),
                              DropdownMenuItem(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('EN')),
                                value: 1,
                              ),
                            ].toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    backgroundColor: defaultColor2,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeLayout(title: 'title')));
                      // if (isLast) {
                      //   // submit();
                      // } else {
                      //   boardController.nextPage(
                      //     duration: Duration(
                      //       milliseconds: 750,
                      //     ),
                      //     curve: Curves.easeIn,
                      //   );
                      // }
                    },
                    child: Icon(
                      Icons.location_on_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Container(
        margin: const EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Image.asset(
                model.image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      );
}

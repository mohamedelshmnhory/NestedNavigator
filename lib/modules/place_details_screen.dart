import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shormehh/shared/constants.dart';
import 'package:shormehh/shared/styles/colors.dart';
import 'package:shormehh/shared/styles/styles.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Container(
            color: defaultColor2,
            height: 141,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: primary,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Shormeh Alhafof',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  CarouselSlider(
                    items: bannerImages
                        .map(
                          (e) => Container(
                            height: 160,
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              shape: BoxShape.rectangle,
                            ),
                            child: Image.asset(e, fit: BoxFit.cover),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        initialPage: 0,
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (i, _) {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                      children: List.generate(
                        gridImages.length,
                        (index) => GestureDetector(
                          onTap: () async {
                             Navigator.of(context).pushNamed('/three');
                          },
                          child: buildGridItem(gridImages[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(String image) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          footer: Container(
            height: 50,
            padding: const EdgeInsetsDirectional.only(start: 15),
            decoration: boxDecoration1,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'data',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      );
}

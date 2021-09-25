import 'package:flutter/material.dart';
import 'package:shormehh/modules/order_details.dart';
import 'package:shormehh/shared/components.dart';
import 'package:shormehh/shared/constants.dart';
import 'package:shormehh/shared/styles/styles.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({Key? key}) : super(key: key);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 1,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2,
                    children: List.generate(
                      gridImages.length,
                      (index) => GestureDetector(
                        onTap: () async {
                          var next = await showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black12
                                .withOpacity(0.6), // Background color
                            barrierDismissible: false,
                            barrierLabel: 'Dialog',
                            transitionDuration: Duration(
                                milliseconds:
                                    400), // How long it takes to popup dialog after button click
                            pageBuilder: (_, __, ___) {
                              // Makes widget fullscreen
                              return SizedBox.expand(
                                child: OrderScreen(image: gridImages[index]),
                              );
                            },
                          );
                          if(next== true){
                            Navigator.of(context).pushNamed('/four');
                          }
                        },
                        child: buildGridItem(gridImages[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              buildClipAppBar(context, 'Shormeh Alhafof'),
              const SizedBox(height: 15),
              Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Expanded(
                          child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            hintText: 'SEARCH',
                            hintStyle: TextStyle(
                              color: Color(0xFFC9C9C9),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            )),
                      )),
                    ],
                  ),
                ),
              ),
            ],
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

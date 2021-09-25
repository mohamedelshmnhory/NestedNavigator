import 'package:flutter/material.dart';
import 'package:shormehh/shared/components.dart';
import 'package:shormehh/shared/styles/colors.dart';

class OrderScreen extends StatefulWidget {
  final String? image;
  const OrderScreen({Key? key, this.image}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int potionNumber = 1;

  @override
  void dispose() {
    _searchController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 210),
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(widget.image!),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'fLAFEL MESHAKEL',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Fits normal size. Designed for loose fit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '60 RS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    buildRow(Colors.red, 'one choice'),
                    const SizedBox(height: 15),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    const SizedBox(height: 15),
                    buildRow(Colors.orange, 'multiple choice'),
                    const SizedBox(height: 15),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Notes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultFormField(
                        controller: descriptionController,
                        type: TextInputType.name,
                        validate: (String value) {},
                        label: 'Add notes',
                        prefixWidth: 0,
                        prefix: null,
                        min: 3),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Number of Portions',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          child: Row(
                            children: [
                              defaultButton(
                                  function: () {setState(() {
                                    if(potionNumber>1)
                                    potionNumber--;
                                  });},
                                  text: '-',
                                  textSize: 16,
                                  height: 30,
                                  width: 52),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: defaultColor2,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Text(potionNumber.toString()),
                                ),
                              ),
                              defaultButton(
                                  function: () {
                                    setState(() {
                                      potionNumber++;
                                    });
                                  },
                                  text: '+',
                                  textSize: 16,
                                  height: 30,
                                  width: 52),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    defaultButton(
                        function: () {
                          Navigator.of(context).pop(true);
                        },
                        text: 'Next',
                        textSize: 16,
                        height: 55,
                        width: 300),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                buildClipAppBar(context, 'FLAFEL MESHAKEL'),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: defaultColor2,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(color, text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Customize your Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Card buildCard() {
    return Card(
      elevation: 0,
      color: accent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('- Select the size of portion -'),
            Icon(Icons.check_circle_outline, size: 20, color: defaultColor2),
          ],
        ),
      ),
    );
  }
}

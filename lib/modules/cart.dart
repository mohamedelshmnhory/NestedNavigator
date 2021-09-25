import 'package:flutter/material.dart';
import 'package:shormehh/shared/components.dart';
import 'package:shormehh/shared/constants.dart';
import 'package:shormehh/shared/styles/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    const SizedBox(height: 15),
                    buildRow(Colors.orange, 'multiple choice'),
                    buildRow(Colors.orange, 'multiple choice'),
                    buildRow(Colors.orange, 'multiple choice'),
                    const SizedBox(height: 30),
                    defaultButton(
                        function: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        text: 'Checkout',
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
                buildClipAppBar(context, 'my cart'),
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

  Widget buildCard() {
    return GestureDetector(
      onTap: () {
        print('hi');
        w = !w;
        setState(() {
          _widget = w ? BuildButtons(key: Key('2')) : Details(key: Key('1'));
        });
      },
      child: Card(
        elevation: 0,
        color: accent,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(gridImages[1]), fit: BoxFit.cover)),
              ),
              Text('fLAFEL MESHAKEL'),
              Spacer(),
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: _widget,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widget = Details(key: Key('1'));
  bool w = true;
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsetsDirectional.only(end: 15, top: 10),
      child: Column(
        children: [
          Text('50 RS'),
          Text('2 : Piece'),
        ],
      ),
    );
  }
}

class BuildButtons extends StatelessWidget {
  const BuildButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: double.infinity,
          color: primary,
          child: Icon(Icons.edit, color: Colors.white),
        ),
        Container(
          width: 60,
          height: double.infinity,
          color: Colors.redAccent,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ],
    );
  }
}

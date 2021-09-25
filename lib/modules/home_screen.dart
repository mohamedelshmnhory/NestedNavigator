import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shormehh/shared/components.dart';
import 'package:shormehh/shared/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Marker> markers = [];
  BitmapDescriptor? markerIcon;
  LatLng initialLocation = LatLng(29.234234234, 29.324324324);
  Completer<GoogleMapController> _mapController = Completer();
  bool placeDetails = false;

  @override
  void initState() {
    super.initState();
    // setMarkers();
  }

  createMarkerIcon(context) {
    if (markerIcon == null) {
      ImageConfiguration con = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(con, 'assets/images/marker.png')
          .then((icon) => setState(() => markerIcon = icon))
          .then((value) => setMarkers());
    }
  }

  setMarkers() {
    if (markerIcon != null)
      setState(() {
        markers.add(
          Marker(
            markerId: MarkerId('0'),
            icon: markerIcon!,
            position: initialLocation,
            draggable: true,
            anchor: Offset(0.6, 0.5),
            zIndex: 2,
            onTap: () {
              setState(() => placeDetails = true);
            },
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    createMarkerIcon(context);
    return Stack(
      children: [
        GoogleMap(
          onTap: (_) {
            setState(() => placeDetails = false);
          },
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 16,
          ),
          markers: markers.toSet(),
          onMapCreated: (GoogleMapController controller) {
            _mapController.complete(controller);
          },
        ),
        Container(
          margin: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white10,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/marker.png',
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('اهلا بك'),
                        Text('WORLD DESIGNDS .CO'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: defaultColor2),
                      const SizedBox(width: 15),
                      Text('الرياض , حي السالمية'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (placeDetails)
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 40,
            right: 10,
            left: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 136,
                      width: 131,
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/1.png',
                            ),
                          )),
                    ),
                    const SizedBox(width: 15),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Shormeh Alhafof',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          const SizedBox(height: 5),
                          Text(
                            'From - Kamieńskiego 11, Cracow',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Text('Bonarka City Center',style: TextStyle(color: primary, fontSize: 14),),
                          Text(
                            'Open 10:00 :  5:15 pm',
                            style: TextStyle(color: defaultColor2, fontSize: 10),
                          ),
                          RatingBar(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 17,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 5),
                            ratingWidget: RatingWidget(
                              full: Image.asset('assets/images/star.png'),
                              half: Image.asset('assets/images/star.png'),
                              empty:
                                  Image.asset('assets/images/star_empty.png'),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(height: 4),
                          defaultButton(
                            function: () {
                              Navigator.of(context).pushNamed('/two');
                            },
                            text: 'Order Now',
                            textSize: 8,
                            width: 110,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

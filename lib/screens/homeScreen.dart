import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/screens/menuScreen.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/components/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled/components/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_place/google_place.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  HomeScreen({required this.name});
  final String name;
  @override
  State<HomeScreen> createState() => _HomeScreenState(name: name);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({required this.name});
  final String name;
  double? lat;
  double? long;
  String? currentLocation = "not found retry";
  @override
  void initState() {
    super.initState();
    getLocation();
    PlaceRepository result = PlaceRepository();
    print(result.getAutocomplete('agar'));
    getDetails();
  }

  void getDetails() async {
    var googlePlace = GooglePlace("AIzaSyCU85_Xt-DGTl_5JOlKhDiQ7ExnRqQOIW0");
    var result = await googlePlace.autocomplete.get("1600 Amphitheatre");
    print(result);
  }

  Future<dynamic> getLocation() async {
    MyLocation location = MyLocation();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;

    setState(() {});
  }

  Future<void> getAddress(double lat, double long) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, long);
    Placemark place = placeMark[0];
    currentLocation = place.locality;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            Container(
                alignment: AlignmentDirectional.bottomStart,
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: long == null
                    ? SpinKitFadingFour(
                        color: Colors.white,
                        size: 100.0,
                      )
                    : GoogleMap(
                        trafficEnabled: true,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(lat!, long!), zoom: 10.0),
                      )),
            LocationSearchBox(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kButtonColor1,
          onPressed: () async {
            await getAddress(lat!, long!);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('address',currentLocation!);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MenuScreen(
                address: currentLocation!,
                name: name,
              );
            }));
          },
          label: Text(
            'SAVE',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}

class LocationSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: TextField(
            decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          hintText: 'Enter Your Location',
          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
        )));
  }
}

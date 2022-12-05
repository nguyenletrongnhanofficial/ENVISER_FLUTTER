import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uit_hackathon/utils/app_colors.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});
  static const String routeName = '/current_location_screen';
  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  double lon = 0;
  double lat = 0;
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(10.762622, 106.660172),
    zoom: 14,
  );

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Chọn vị trí của bạn"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop([lat, lon]);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));
          print('111');
          setState(() {
            lon = position.longitude;
            lat = position.latitude;
          });
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}

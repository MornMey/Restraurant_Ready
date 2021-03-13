import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  int _currentIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
      bearing: 192.833,
      target: LatLng(45.521563, -122.677433),
      tilt: 59.440,
      zoom: 11.0);
  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId(_lastMapPosition.toString()),
            position: _lastMapPosition,
            infoWindow: InfoWindow(
                title: 'This is a Title', snippet: 'This is a Snippet'),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      },
    );
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.orange,
      child: Icon(icon, size: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      toolbarHeight: 130,
      backgroundColor: Colors.white,
      title: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Material(
                elevation: 0.2,
                borderRadius: BorderRadius.circular(10.0),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 20),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      hintText: "Search Location",
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Fast Food",
                    style: TextStyle(fontSize: 15,color: Colors.orange),
                  ),
                  Text(
                    "Desserts",
                    style: TextStyle(fontSize: 15,color: Colors.orange),
                  ),
                  Text(
                    "Breakfast",
                    style: TextStyle(fontSize: 15,color: Colors.orange),
                  ),
                ],
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _buildBody {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: _onCameraMove,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                button(_onMapTypeButtonPressed, Icons.map),
                SizedBox(
                  height: 16,
                ),
                button(_onAddMarkerButtonPressed, Icons.add_location),
                SizedBox(
                  height: 16,
                ),
                button(_goToPosition1, Icons.location_searching)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

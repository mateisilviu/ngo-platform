import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/models/category_model copy.dart';
import '../../core/models/category_model.dart';
import '../../core/models/ngo.dart';
import '../../core/models/subcategory_model.dart';

class MatchScreen extends StatefulWidget {
  final CategoryModel2 selectedCategory;
  final int selectedSubCategory;

  MatchScreen(
      {required this.selectedCategory, required this.selectedSubCategory});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  late GoogleMapController mapController;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  LatLng? markerPosition;

  final LatLng _center = const LatLng(44.4431463, 26.0961748);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _add();
  }

  List<NGO> ngoList = [
    NGO(
        name: "Centrul de batrani X",
        address: "Bucharest",
        latitude: 44.5431463,
        longitude: 26.0961748),
    NGO(
        name: "Centrul de copii Y",
        address: "Bucharest",
        latitude: 44.5431463,
        longitude: 26.1961748),
    NGO(
        name: "Centrul de reciclare haine Z",
        address: "Bucharest",
        latitude: 44.4431463,
        longitude: 26.0761748),
  ];

  void _add() {
    int i = 1;
    ngoList.forEach((element) {
      final MarkerId markerId = MarkerId("marker$i");
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(element.latitude, element.longitude),
        infoWindow: InfoWindow(title: element.name, snippet: '*'),
        onTap: () => _onMarkerTapped(markerId),
      );

      setState(() {
        markers[markerId] = marker;
      });
      i++;
    });
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = selectedMarker;
        if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
          final Marker resetOld = markers[previousMarkerId]!
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;

        markerPosition = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.selectedCategory.name} > ${widget.selectedCategory.subcategory![widget.selectedSubCategory].name}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: Text("Poti dona la urmatoarele ong-uri:"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListView.builder(
                // the number of items in the list
                itemCount: ngoList.length,

                // display each item of the product list
                itemBuilder: (context, index) {
                  return Card(
                    // In many cases, the key isn't mandatory
                    key: ValueKey(ngoList[index]),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(ngoList[index].name)),
                  );
                }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: Set<Marker>.of(markers.values)),
          ),
        ],
      ),
    );
  }
}

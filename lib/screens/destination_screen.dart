import 'package:flutter/material.dart';
import 'package:flutter_state/models/destination_model.dart';
import 'package:flutter_state/widgets/destinations/image_section.dart';
import 'package:flutter_state/widgets/destinations/tour.dart';

class DestinationScreen extends StatelessWidget {
  final Destination destination;
  const DestinationScreen({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          //Image Section
          ImageSection(destination: destination),
          //Hotels List
          TourActivities(destination: destination),
        ],
      ),
    );
  }
}

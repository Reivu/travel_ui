import 'package:flutter/material.dart';
import 'package:flutter_state/models/destination_model.dart';

class ImageSection extends StatelessWidget {
  final Destination destination;
  const ImageSection({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //Image
        Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10.0,
                offset: const Offset(0.0, 5.0),
                spreadRadius: 2.0,
              )
            ],
          ),
          child: Hero(
            tag: destination.imageUrl,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              child: Image.asset(
                destination.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //Upper Icon
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                iconSize: 35.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                children: const [
                  Icon(
                    Icons.search_rounded,
                    size: 35.0,
                  ),
                  Icon(
                    Icons.menu_open_rounded,
                    size: 35.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        //City
        Positioned(
          left: 20.0,
          bottom: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                destination.city,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    destination.country,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //Bottom Right Icon
        Positioned(
          right: 20.0,
          bottom: 20.0,
          child: Icon(
            Icons.map_rounded,
            size: 40.0,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}

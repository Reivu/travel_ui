import 'package:flutter/material.dart';
import 'package:flutter_state/models/destination_model.dart';

class TopDestinations extends StatelessWidget {
  const TopDestinations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Destinations',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        //Card
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return _buildTopDestinations(context, destination);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTopDestinations(BuildContext context, Destination destination) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/destinations',
          arguments: destination,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        width: 210.0,
        // color: Colors.red,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 10.0,
              child: Container(
                height: 120.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${destination.city} City',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        destination.description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: destination.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 180.0,
                        width: 180.0,
                        image: AssetImage(destination.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            Text(
                              destination.country,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

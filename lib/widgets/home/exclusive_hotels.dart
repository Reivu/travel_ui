import 'package:flutter/material.dart';
import 'package:flutter_state/models/hotel_model.dart';

class ExclusiveHotels extends StatelessWidget {
  const ExclusiveHotels({Key? key}) : super(key: key);

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
                'Exclusive Hotels',
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
        //Hotel List
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return _buildHotelList(hotel);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHotelList(Hotel hotel) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
      ),
      width: 240.0,
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 120.0,
              width: 240.0,
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
                      hotel.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      hotel.address,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      '\$${hotel.price} / Day',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                height: 190.0,
                width: 220.0,
                image: AssetImage(hotel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

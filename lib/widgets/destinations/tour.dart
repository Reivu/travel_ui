import 'package:flutter/material.dart';
import 'package:flutter_state/models/activity_model.dart';
import 'package:flutter_state/models/destination_model.dart';

class TourActivities extends StatelessWidget {
  final Destination destination;
  const TourActivities({Key? key, required this.destination}) : super(key: key);

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: const TextStyle(
        fontSize: 10.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
        physics: const BouncingScrollPhysics(),
        itemCount: destination.activities.length,
        itemBuilder: (BuildContext context, int index) {
          Activity activity = destination.activities[index];
          return _buildTour(activity);
        },
      ),
    );
  }

  Widget _buildTour(Activity activity) {
    return Stack(
      children: [
        //Card
        Container(
          margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120.0,
                      child: Text(
                        activity.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '\$${activity.price}',
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'per pax',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  activity.type,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5.0),
                _buildRatingStars(activity.rating),
                const SizedBox(height: 10.0),
                //Time
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        activity.startTimes[0],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        activity.startTimes[1],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //Image
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 110.0,
              image: AssetImage(
                activity.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class FeaturedMentors extends StatelessWidget {
  const FeaturedMentors({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Featured Mentors',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(28, 45, 86, 1)),
          ),
          Row(
            children: [
              Text(
                'Explore',
                style: TextStyle(
                    color: Color.fromRGBO(144, 144, 144, 1), fontSize: 12),
              ),
              Icon(
                Icons.arrow_forward,
                size: 12,
                color: Color.fromRGBO(144, 144, 144, 1),
              )
            ],
          ),
        ],
      ),
    );
  }
}

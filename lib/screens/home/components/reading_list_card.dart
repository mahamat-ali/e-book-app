import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'book_rating.dart';
import 'two_side_rounded_button.dart';

class ReadingListCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final double rating;
  final VoidCallback pressDetails;
  final VoidCallback pressRead;

  const ReadingListCard({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.pressDetails,
    required this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 33,
                    color: kShadowColor,
                  ),
                  BoxShadow(
                    offset: const Offset(-10, 10),
                    blurRadius: 30,
                    color: const Color(0xff666666).withOpacity(0.4),
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            width: 150,
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                BookRating(
                  score: rating,
                )
              ],
            ),
          ),
          Positioned(
            top: 160,
            child: SizedBox(
              width: 202,
              height: 85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      style: const TextStyle(color: kBlackColor),
                      children: [
                        TextSpan(
                          text: "$title\n",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: author,
                          style: const TextStyle(
                            color: kLightBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: pressDetails,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 101,
                          child: const Text("Details"),
                        ),
                      ),
                      Expanded(
                        child: TwoSidedRoundedButton(
                          text: "Reads",
                          press: pressRead,
                          radius: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

library build_card_curve_line;
import 'dart:math';
import 'package:custom_design/card_design/paint/custom_paint_curved_card.dart';
import 'package:custom_design/card_design/utils.dart';
import 'package:flutter/material.dart';

class CurvedCard extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String phone;
  final String email;
  final String gender;
  final String id;
  final String birthDate;
  final int status;
  final String statusDetails;
  final String imageUrl;

  const CurvedCard({
    Key key,
    @required this.name,
    @required this.bloodGroup,
    @required this.phone,
    @required this.email,
    @required this.gender,
    @required this.id,
    @required this.birthDate,
    this.status = 0,
    @required this.statusDetails,
    @required this.imageUrl,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 10, left: 5.0, right: 5.0),
      height: 230,
      child: Stack(
        children: [
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                // color: cSky,
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    // Colors.primaries[Random().nextInt(Colors.primaries.length)]
                    //     .withOpacity(0.1),
                    Colors.white38,
                    Colors.white
                  ],
                ),
              ),
              child: CustomPaint(
                size: Size(
                    500,
                    (500 * 0.4)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          Positioned(
            left: width * 0.32,
            child: Container(
              width: width * 0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 22),
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            birthDate,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 20,
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: VerticalDivider(
                                color: Colors.grey, thickness: 1.2),
                          ),
                          Text(
                            gender,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 20,
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: VerticalDivider(
                                color: Colors.grey, thickness: 1.2),
                          ),
                          Text(
                            bloodGroup.toUpperCase(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.phone,
                            color: UiColor.cViolet,
                          ),
                          SizedBox(width: 4),
                          Text(
                            phone,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 8),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.email,
                            color: UiColor.cViolet,
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: 200,
                            child: Text(
                              email.toLowerCase(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  status == 0
                      ? Center(
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              'Requested',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.38,
            top: 131,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10.0, bottom: 5.0, left: 20, right: 5),
              child: Container(
                // padding: EdgeInsets.only(left: 5, right: 5),
                width: width * 0.6,
                decoration: new BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 2,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  statusDetails,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: status == 0 ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

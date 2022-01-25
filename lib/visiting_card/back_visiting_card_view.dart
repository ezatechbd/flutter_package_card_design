import 'package:flutter/material.dart';
import 'block_tile_back.dart';

class BackVisitingCardView extends StatelessWidget {
  final Color blockColor;
  final String name;
  final String designation;
  final String institutionLogoUrl;
  final String backgroundImageUrl;
  final String institutionShortName;
  final String slogan;
  final String phoneNo;
  final String email;
  final String address;
  const BackVisitingCardView({
    Key key,
    @required this.blockColor,
    @required this.name,
    @required this.designation,
    @required this.institutionLogoUrl,
    @required this.backgroundImageUrl,
    @required this.institutionShortName,
    @required this.slogan,
    @required this.phoneNo,
    @required this.email,
    @required this.address,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var topPadding = MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    Color blockColor1;
    Color blockColor2;
    Color blockColor3;
    if (blockColor == Colors.red) {
      blockColor1 = Colors.red;
      blockColor2 = Colors.red[600];
      blockColor3 = Colors.red[700];
    } else if (blockColor == Colors.orange) {
      blockColor1 = Colors.orange;
      blockColor2 = Colors.orange[600];
      blockColor3 = Colors.orange[700];
    } else if (blockColor == Colors.blue) {
      blockColor1 = Colors.blue;
      blockColor2 = Colors.blue[600];
      blockColor3 = Colors.blue[700];
    }
    return Container(
      height: 300,
      width: size.width,
      padding: EdgeInsets.only(top: 32, left: 8, right: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Container(
                    height: 150,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            backgroundImageUrl),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.black38,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              designation,
                              style: TextStyle(
                                // fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              institutionLogoUrl,
                              height: 60,
                              width: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    institutionShortName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    slogan,
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 110,
              width: size.width,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlockTileBack(
                    // color: blockColor,
                    color: blockColor1,
                    bottomLeftRadius: 15,
                    iconData: Icons.phone_android,
                    text: phoneNo,
                  ),
                  BlockTileBack(
                    // color: blockColor.withRed(240).withGreen(30).withBlue(20),
                    color: blockColor2,
                    iconData: Icons.email_outlined,
                    text: email,
                  ),
                  BlockTileBack(
                    // color: blockColor.withRed(200).withGreen(30).withBlue(20),
                    color: blockColor3,
                    bottomRightRadius: 15,
                    iconData: Icons.location_on_outlined,
                    text: address,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

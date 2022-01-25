library visiting_card;
import 'package:flutter/material.dart';
import 'back_visiting_card_view.dart';
import 'front_visiting_card_view.dart';

class FlipVisitingCard extends StatefulWidget {
  //front
  final Color visitingCardColor;
  final String institutionLogoUrl;
  final String institutionName;
  final String slogan;
  final String assetIcon1;
  final String assetIcon2;
  final String assetIcon3;
  //back
  final String name;
  final String designation;
  final String backgroundImageUrl;
  final String institutionShortName;
  final String phoneNo;
  final String email;
  final String address;
  const FlipVisitingCard({
    Key key,
    @required this.visitingCardColor,
    this.institutionLogoUrl = 'https://upload.wikimedia.org/wikipedia/en/a/a1/Dhaka_Medical_College_and_Hospital_logo.png',
    this.institutionName = 'Dhaka Medical College',
    this.slogan = 'YOUR SLOGAN',
    @required this.assetIcon1,
    @required this.assetIcon2,
    @required this.assetIcon3,
    this.backgroundImageUrl = 'https://media.istockphoto.com/photos/medical-stethoscope-isolated-on-white-background-picture-id1159847028?k=20&m=1159847028&s=612x612&w=0&h=cvXAgMmEv_L65fw7jBG6Kqs3GpYXCp8hjoYBBHL4KK8=',
    @required this.name,
    @required this.designation,
    @required this.address,
    @required this.email,
    @required this.phoneNo,
    @required this.institutionShortName,
  }) : super(key: key);
  
  FlipVisitingCardState createState() => new FlipVisitingCardState();
}

class FlipVisitingCardState extends State<FlipVisitingCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_controller.isCompleted || _controller.velocity > 0)
              _controller.reverse();
            else
              _controller.forward();
          });
        },
        child: new Stack(
          children: <Widget>[
            new AnimatedBuilder(
              child: FrontVisitingCardView(
                blockColor: widget.visitingCardColor,
                institutionLogoUrl: widget.institutionLogoUrl,
                institutionName: widget.institutionName,
                slogan: widget.slogan,
                assetIcon1: widget.assetIcon1,
                assetIcon2: widget.assetIcon2,
                assetIcon3: widget.assetIcon3,
              ),
              animation: _frontScale,
              builder: (BuildContext context, Widget child) {
                final Matrix4 transform = new Matrix4.identity()
                  ..scale(1.0, _frontScale.value, 1.0);
                return new Transform(
                  transform: transform,
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
            ),
            new AnimatedBuilder(
              child: BackVisitingCardView(
                blockColor: widget.visitingCardColor,
                backgroundImageUrl: widget.backgroundImageUrl,
                institutionLogoUrl: widget.institutionLogoUrl,
                name: widget.name,
                designation: widget.designation,
                institutionShortName: widget.institutionShortName,
                slogan: widget.slogan,
                phoneNo: widget.phoneNo,
                email: widget.email,
                address: widget.address,
              ),
              animation: _backScale,
              builder: (BuildContext context, Widget child) {
                final Matrix4 transform = new Matrix4.identity()
                  ..scale(1.0, _backScale.value, 1.0);
                return new Transform(
                  transform: transform,
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

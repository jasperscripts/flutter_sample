import 'dart:math';

import 'package:flutter/material.dart';
import 'package:realty/src/house.dart';

class WideLayout extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 960,
          // color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: HouseGrid(),
          )),
    );
  }
}

class HouseGrid extends StatelessWidget {
  const HouseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(houses.length, (index) {
          return HouseFlipper(house: houses[index]);
        }));
  }
}

class HouseFlipper extends StatefulWidget {
  final House house;

  const HouseFlipper({super.key, required this.house});

  @override
  State<HouseFlipper> createState() => _HouseFlipperState();
}

class _HouseFlipperState extends State<HouseFlipper> {
  late bool _showFrontSide;
  late Widget _myanimatedWidget;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _myanimatedWidget = HouseCardFront(house: widget.house);
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
      _myanimatedWidget = _showFrontSide ? HouseCardFront(house: widget.house) : HouseCardBack(house: widget.house);
      // _myanimatedWidget = HouseCardBack(house: widget.house);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: _switchCard,
          child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                layoutBuilder: __layoutBuilder,
                transitionBuilder: __transitionBuilder,
                child: _myanimatedWidget),
          );
  }

  Widget __layoutBuilder(Widget? currentChild, List<Widget> previousChildren) {
    return Stack(
      alignment: Alignment.topLeft,
      fit: StackFit.expand,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}

class HouseCardFront extends StatelessWidget {
  final House house;

  const HouseCardFront({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return 
        Expanded(
          child: Image.network(
            house.picture,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
  }
}

class HouseCardBack extends StatelessWidget {
  final House house;

  const HouseCardBack({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text(house.name),),
                              Expanded(flex: 1, 
                              child: Text(house.category, 
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),),
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                              children: [
                                Icon(Icons.star,color: Colors.red[500],),
                                Icon(Icons.star,color: Colors.red[500],),
                                Icon(Icons.star,color: Colors.red[500],),
                                Icon(Icons.star,color: Colors.red[500],),
                                Icon(Icons.star,color: Colors.red[500],),
                              ]
                          ),
                        ),
                        Text(house.description, textAlign: TextAlign.justify,),
                      ]
                    ) 
                  ),
                  Expanded(flex: 1, child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Price", textAlign: TextAlign.center,),
                      Text(house.price, textAlign: TextAlign.center,),
                    ],
                  )
                  ),
                ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/CoinHome/Coin/CoinReceive.dart';
import 'package:flutter_gmcwallet/CoinHome/Coin/CoinSend.dart';
import 'package:flutter_gmcwallet/CoinHome/Tron/TronReceive.dart';
import 'package:flutter_gmcwallet/CoinHome/Tron/TronSend.dart';
import 'package:flutter_gmcwallet/CoinHome/components/ShapeClipper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoinHome extends StatefulWidget {
  final AnimationController controller;
  //final Duration duration;

  CoinHome({Key key, this.controller}) : super(key: key);

  @override
  _CoinHomeState createState() => _CoinHomeState();
}

class _CoinHomeState extends State<CoinHome> {
  bool menuOpen = false;
  Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    if (_scaleAnimation == null) {
      _scaleAnimation =
          Tween<double>(begin: 1, end: 0.6).animate(widget.controller);
    }
    var size = MediaQuery.of(context).size;

    return AnimatedPositioned(
      duration: Duration(seconds: 2),
      top: 0,
      bottom: 0,
      left: menuOpen ? 0.3 * size.width : 0,
      right: menuOpen ? -0.3 * size.width : 0,
      // top: 0,
      // bottom: 0,
      // left: menuOpen ? 0.3 * size.width : 0,
      // right: menuOpen ? -0.5 * size.width : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Stack(children: [
            ClipPath(
              clipper: ShapeClipper2(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffffb473).withOpacity(0.8),
                    Color(0xffcc3494),
                  ]),
                ),
                height: 140,
              ),
            ),
            ClipPath(
              clipper: ShapeClipper1(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color(0xffd25a7c),
                      Color(0xfff9cc83),
                    ])),
                height: 140,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              !menuOpen
                                  ? IconButton(
                                      icon: Icon(Icons.sort,size: 35,),
                                      onPressed: () {
                                        setState(() {
                                          widget.controller.forward();
                                          menuOpen = true;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        setState(() {
                                          widget.controller.reverse();
                                          menuOpen = false;
                                        });
                                      },
                                    ),
                              Text(
                                "GMC",
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        buildgmcBalace(),
                        SizedBox(height: 35),
                        buildTron(),
                        SizedBox(height: 30),
                        buildGmc(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildgmcBalace() {
  return Container(
    height: 105,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2))
      ],
      gradient: LinearGradient(colors: [Color(0xffd25a7c), Color(0xfff9cc83)]),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 180,
            height: 100,
            child: Text(
              "Total GMC Balance",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 65,
          width: 95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "0.00\$",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildTron() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset(
              'assets/images/tronlogo.svg',
              color: Colors.red,
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "TRON",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text(
            "(TRX)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
      SizedBox(height: 10),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  width: 5.0,
                  color: Color(0XFFff7575),
                ),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2)),
              ],
            ),
            height: 210,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/tronlogo.svg',
                          color: Colors.red,
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text(
                            "9,999,999",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "TRX",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 190,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "9,999,999",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "KRW",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(TronReceive());
                        },
                        child: Text("받기"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFff7575),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(TronSend());
                          },
                          child: Text(
                            "보내기",
                            style: TextStyle(color: Color(0XFFff7575)),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 55, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(color: Color(0XFFff7575)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ],
  );
}

Widget buildGmc() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset(
              'assets/images/GMC.svg',
              // color: Colors.red,
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "GMC",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text(
            "(GMC)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
      SizedBox(height: 10),
      Column(
        children: [
          Container(
            height: 210,
            width: 400,
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0XFFecba24),
                    width: 5.0,
                  ),
                ),
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2)),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/GMC.svg',
                          // color: Colors.red,
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text(
                            "9,999,999",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "GMC",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 190,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "9,999,999",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "KRW",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(CoinReceive());
                        },
                        child: Text("받기"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFecba24),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(CoinSend());
                          },
                          child: Text(
                            "보내기",
                            style: TextStyle(color: Color(0XFFecba24)),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 55, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(color: Color(0XFFecba24)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ],
  );
}

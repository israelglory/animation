import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThreeDimensionalCard extends StatefulWidget {
  const ThreeDimensionalCard({Key? key}) : super(key: key);

  @override
  State<ThreeDimensionalCard> createState() => _ThreeDimensionalCardState();
}

class _ThreeDimensionalCardState extends State<ThreeDimensionalCard> {
  Offset location = Offset.zero;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const height = 256.0;
    final width = screenSize.width > 400 ? 400.0 : screenSize.width * 0.9;

    const cardHeight = height - 7;
    final cardWidth = width - 7;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 256,
                width: width,
                decoration: BoxDecoration(
                  gradient: const SweepGradient(colors: [
                    Colors.blue,
                    Colors.white,
                    Colors.purple,
                    Colors.lime,
                  ]),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002) // perspective
                  ..rotateX(0.01 * location.dy)
                  ..rotateY(0.01 * location.dx),
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    location += details.delta;
                    setState(() {});
                  },
                  onPanEnd: (details) {
                    location = Offset.zero;
                    setState(() {});
                  },
                  child: Container(
                    height: cardHeight,
                    width: cardWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/cardbg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 64.0,
                          top: 0.0,
                          right: 54.0,
                          left: 15.0,
                          child: Image.asset(
                            "assets/images/cardbgworld.png",
                          ),
                        ),
                        //Card name, number and exp. date
                        Positioned(
                          left: 30.0,
                          top: 30.0,
                          bottom: 30.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Glory Olaifa Israel',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Image.asset(
                                "assets/icons/cardsim.png",
                                height: 48,
                                width: 55,
                              ),
                              const Text(
                                '35-070-0003-3256-2022',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                'Exp. 12/26',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Card mastercard
                        Positioned(
                          //top: 0.0,
                          right: 30.0,
                          bottom: 30.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/mastercard.svg",
                                height: 30,
                                width: 30,
                              ),
                              const Text(
                                'MasterCard',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Card  logo
                        Positioned(
                          top: 30.0,
                          right: 30.0,
                          child: SvgPicture.asset(
                            "assets/images/cardLogo.svg",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

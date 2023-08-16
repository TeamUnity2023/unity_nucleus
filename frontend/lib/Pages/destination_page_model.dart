import 'package:flutter/material.dart';
import 'package:nucleus/src/main_button.dart';
import 'package:glassmorphism/glassmorphism.dart';

//This is a preview. This will be modularized later via adding parameters so that this can be used easily for any planet.
class PlanetShowcase extends StatelessWidget {
  const PlanetShowcase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 7, 15, 1),
      body: Stack(
        children: [
          const Positioned(
            top: -180,
            left: -150,
            right: 70,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/earth.png'),
            ),
          ),
          Center(
            child: GlassmorphicContainer(
              height: 250,
              linearGradient: LinearGradient(
                colors: [
                  const Color(0xFFffffff).withOpacity(0.1),
                  const Color(0xFFFFFFFF).withOpacity(0.05),
                ],
              ),
              width: 340,
              blur: 20,
              border: 2,
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.2),
                  const Color(0xFFFFFFFF).withOpacity(0.2),
                ],
              ),
              borderRadius: 20,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      'Visiter rating :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(
                      'Population :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 30, 10),
              child: Text(
                'The\nEarth',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column( mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Container( padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                    height: 250,
                    width: 340,

                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '''The Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29.2% of Earth\'s surface is land consisting of continents and islands.
                        The remaining 70.8% is covered with water, by oceans, and other salt-water bodies, but also by lakes, rivers, and other fresh water, which together constitute the hydrosphere.''',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ), textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  MainButton(
                    whenPressed: () {/*Instead pass what needs to be done*/},
                    title: 'Book a journey!',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

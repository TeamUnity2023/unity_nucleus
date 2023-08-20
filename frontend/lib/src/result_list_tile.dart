import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SearchResultItem extends StatelessWidget {
  final String departureImage;
  final String destinationImage;
  final String departurePlanetName;
  final String destinationPlanetName;
  final String transitInfo;

  const SearchResultItem({super.key, 
    required this.departureImage,
    required this.destinationImage,
    required this.departurePlanetName,
    required this.destinationPlanetName,
    required this.transitInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: GlassmorphicContainer(
        width: double.infinity,
        height: 150,
        // Limited height for the row
        borderRadius: 20,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.2),
            const Color(0xFFFFFFFF).withOpacity(0.2),
          ],
        ),
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
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Image.asset(departureImage),
                  const SizedBox(height: 2),
                  Text(
                    departurePlanetName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Image.asset(destinationImage),
                  const SizedBox(height: 2),
                  Text(
                    destinationPlanetName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Transit: $transitInfo',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

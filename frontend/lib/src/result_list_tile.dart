import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

//component widget with flutter listTile widget to show results of search from search_page.dart
//component should contain parameters/attributes for departure planet image, destination planet image, and transit information(text)

class SearchResultItem extends StatelessWidget {
  final String departureImage;
  final String destinationImage;
  final String transitInfo;

  const SearchResultItem({super.key, 
    required this.departureImage,
    required this.destinationImage,
    required this.transitInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(departureImage),
      title: Text('Transit: $transitInfo'),
      subtitle: Image.asset(destinationImage),
    );
    
    
  }
}


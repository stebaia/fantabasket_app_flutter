import 'package:flutter/material.dart';

class Constants {
  const Constants._();

  static const userKey = 'CURRENT_USER';
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const baseUrl = "https://fantabasket.talkandprofit.net/";

  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et arcu lectus. Nam vestibulum massa sit amet tortor dignissim dignissim. Etiam blandit efficitur risus vel sollicitudin. Maecenas eu turpis ornare, dignissim mi pharetra, placerat lectus. Fusce eget lorem porttitor, vestibulum velit vitae, pretium nisl. Phasellus efficitur sed arcu et tincidunt. Pellentesque in ipsum eros. Sed interdum tristique sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst.Phasellus quis placerat eros. Pellentesque ullamcorper pharetra fringilla. Aenean eget ligula ut enim laoreet tincidunt. Donec eu urna mi. Fusce ac mattis est. Morbi ac fermentum enim. Nunc tempor ultricies nunc. Maecenas iaculis pharetra rutrum. Sed feugiat fringilla ante at eleifend.Nulla tellus arcu, volutpat ac nulla at, blandit venenatis nunc. Praesent at tellus orci. Donec porttitor magna dolor, id consequat lectus ultricies ut. Phasellus a tellus faucibus est dictum blandit. Praesent consectetur malesuada bibendum. Donec ac elit in ipsum sollicitudin gravida eget non enim. Nulla facilisi. Etiam leo eros, consequat at porta non, luctus sit amet dolor. Pellentesque vestibulum vestibulum dolor, id rutrum nibh scelerisque elementum.Suspendisse potenti. Cras aliquam posuere purus ut mollis. Vivamus arcu elit, laoreet sed nisl nec, congue efficitur urna. Donec ac tempus nunc, sit amet aliquam ex. Donec ac mi sagittis, fringilla metus sed, luctus enim. Integer viverra tempor velit, eget tristique nunc efficitur in. Morbi dolor elit, condimentum sit amet justo vel, bibendum scelerisque mi. Integer interdum, ex et auctor volutpat, nisl nunc sollicitudin orci, et vehicula magna mi sed mauris. Ut dolor lacus, faucibus in dapibus ac, euismod sed velit. Mauris maximus convallis magna, non dictum magna pharetra quis. Aenean rhoncus scelerisque enim, ac tempus orci blandit ut.Quisque cursus dictum neque, sodales dignissim lorem viverra nec. Sed ornare ex eu dui blandit, vitae maximus eros tristique. Suspendisse rutrum nisl arcu, in feugiat nunc vehicula ac. Donec dapibus commodo vestibulum. Etiam vel mi at elit congue pulvinar. Cras dapibus lectus gravida tristique cursus. Donec id lorem pulvinar velit dapibus scelerisque.";

  static List<String> categoryCar = [
    'Berlina',
    'Suv',
    'City Car',
    'Fuoristrada',
    'Station Wagon',
    'Minivan'
  ];

  static Map<String, Color> categoryColors = {
    'A': const Color.fromARGB(255, 212, 37, 24),
    'A2': const Color.fromARGB(255, 244, 197, 45),
    'B': const Color.fromARGB(255, 189, 145, 3),
    'CGOLD': const Color.fromARGB(255, 134, 208, 70),
    'CSILVER': const Color.fromARGB(255, 58, 138, 60),
    'D': const Color.fromARGB(255, 41, 150, 238),
    'PROMOZIONE': const Color.fromARGB(255, 9, 92, 159),
    'CSI': const Color.fromARGB(255, 100, 18, 132),
    'GIOVANILE': const Color.fromARGB(255, 100, 18, 132),
    'RITIRATO': const Color.fromARGB(255, 100, 18, 132),
  };

  static Map<String, int> categoryValues = {
    'A': 25,
    'A2': 25,
    'B': 20,
    'CGOLD': 15,
    'CSILVER': 10,
    'D': 10,
    'PROMOZIONE': 5,
    'CSI': 0,
    'GIOVANILE': 0,
    'RITIRATO': 0,
  };
}

import 'package:flutter/material.dart';

class Constants {
  const Constants._();

  static const userKey = 'CURRENT_USER';
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const baseUrl = "https://api.onlyfantapp.it/";

  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et arcu lectus. Nam vestibulum massa sit amet tortor dignissim dignissim. Etiam blandit efficitur risus vel sollicitudin. Maecenas eu turpis ornare, dignissim mi pharetra, placerat lectus. Fusce eget lorem porttitor, vestibulum velit vitae, pretium nisl. Phasellus efficitur sed arcu et tincidunt. Pellentesque in ipsum eros. Sed interdum tristique sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst.Phasellus quis placerat eros. Pellentesque ullamcorper pharetra fringilla. Aenean eget ligula ut enim laoreet tincidunt. Donec eu urna mi. Fusce ac mattis est. Morbi ac fermentum enim. Nunc tempor ultricies nunc. Maecenas iaculis pharetra rutrum. Sed feugiat fringilla ante at eleifend.Nulla tellus arcu, volutpat ac nulla at, blandit venenatis nunc. Praesent at tellus orci. Donec porttitor magna dolor, id consequat lectus ultricies ut. Phasellus a tellus faucibus est dictum blandit. Praesent consectetur malesuada bibendum. Donec ac elit in ipsum sollicitudin gravida eget non enim. Nulla facilisi. Etiam leo eros, consequat at porta non, luctus sit amet dolor. Pellentesque vestibulum vestibulum dolor, id rutrum nibh scelerisque elementum.Suspendisse potenti. Cras aliquam posuere purus ut mollis. Vivamus arcu elit, laoreet sed nisl nec, congue efficitur urna. Donec ac tempus nunc, sit amet aliquam ex. Donec ac mi sagittis, fringilla metus sed, luctus enim. Integer viverra tempor velit, eget tristique nunc efficitur in. Morbi dolor elit, condimentum sit amet justo vel, bibendum scelerisque mi. Integer interdum, ex et auctor volutpat, nisl nunc sollicitudin orci, et vehicula magna mi sed mauris. Ut dolor lacus, faucibus in dapibus ac, euismod sed velit. Mauris maximus convallis magna, non dictum magna pharetra quis. Aenean rhoncus scelerisque enim, ac tempus orci blandit ut.Quisque cursus dictum neque, sodales dignissim lorem viverra nec. Sed ornare ex eu dui blandit, vitae maximus eros tristique. Suspendisse rutrum nisl arcu, in feugiat nunc vehicula ac. Donec dapibus commodo vestibulum. Etiam vel mi at elit congue pulvinar. Cras dapibus lectus gravida tristique cursus. Donec id lorem pulvinar velit dapibus scelerisque.";

  static Map<String, Color> categoryColors = {
    'A1': const Color.fromARGB(255, 182, 44, 35),
    'A2': const Color.fromARGB(255, 233, 139, 15),
    'B1': const Color.fromARGB(255, 106, 84, 13),
    'B2': const Color.fromARGB(255, 60, 92, 32),
    'C': const Color.fromARGB(255, 66, 152, 69),
    'D': const Color.fromRGBO(57, 166, 193, 1),
    'PROMO': const Color.fromARGB(255, 38, 110, 169),
    'AMATORE': const Color.fromARGB(255, 112, 33, 185),
    'GIOVANE': const Color.fromARGB(255, 215, 39, 192),
    'RITIRATO': const Color.fromARGB(255, 233, 236, 59),
  };

  static Map<String, int> categoryValues = {
    'A1': 25,
    'A2': 25,
    'B': 20,
    'B2': 15,
    'C': 10,
    'D': 10,
    'PROMO': 5,
    'AMATORE': 0,
    'GIOVANE': 0,
    'RITIRATO': 0,
  };
}

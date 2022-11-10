import 'dart:io';

void main() {
  bottleBeer();
}

void bottleBeer() {
  for (int i = 99; i >= 0; i--) {
    if (i == 1) {
      print('1 bottle of beer on the wall, 1 bottle of beer.');
      print(
          'Take one down and pass it around, no more bottles of beer on the wall.\n');
    } else if (i == 0) {
      print('No more bottles of beer on the wall, no more bottles of beer.');
      print(
          'Go to the store and buy some more, 99 bottles of beer on the wall.\n');
    } else {
      print('$i bottles of beer on the wall, $i bottles of beer.');
      print(
          'Take one down and pass it around, ${i - 1} bottles of beer on the wall.\n');
    }
  }
}



import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/screens/DataDetails.dart';

void main() {
  test('Valid Data Test', () {
    var result = Uri.dataFromString("https://api.openbrewerydb.org/breweries");
    expect(result, greaterThan(14));
  });
}
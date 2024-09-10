import 'package:flutter_test/flutter_test.dart';
import 'package:qpay/core/utils/enums/provider_type.dart';
import 'package:qpay/core/utils/recognize_provider.dart';

void main() {
  test('recognize vodacom 83', () {
    expect(RecognizeProvider.recognize('830143897'), ProviderType.VODACOM.name);
  });

  test('recognize vodacom 81', () {
    expect(RecognizeProvider.recognize('810143897'), ProviderType.VODACOM.name);
  });

  test('recognize vodacom 82', () {
    expect(RecognizeProvider.recognize('820143897'), ProviderType.VODACOM.name);
  });

  test('recognize airtel', () {
    expect(RecognizeProvider.recognize('996875512'), ProviderType.AIRTEL.name);
  });

  test('recognize orange', () {
    expect(RecognizeProvider.recognize('894741254'), ProviderType.ORANGE.name);
  });

  test('recognize africell', () {
    expect(
        RecognizeProvider.recognize('904741254'), ProviderType.AFRICELL.name);
  });

  test('recognize null 1', () {
    expect(RecognizeProvider.recognize('458584145'), null);
  });

  test('recognize null 2', () {
    expect(RecognizeProvider.recognize('808584145'), ProviderType.ORANGE.name);
  });
}

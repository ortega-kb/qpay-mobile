import 'package:flutter_test/flutter_test.dart';
import 'package:qpay/core/utils/link_util.dart';

void main() {
  final validLink = LinkUtil.paymentLinkGenerator(
    userCode: 'qp123456789101112',
    amount: '4500',
    description: 'test',
    wallet: 'CDF',
  );

  final validLink1 = LinkUtil.paymentLinkGenerator(
    userCode: 'qp123456789101112',
    amount: '4500',
    description: 'test',
    wallet: 'USD',
  );

  final invalidLink = LinkUtil.paymentLinkGenerator(
    userCode: 'qp1212121212121212',
    amount: '14500',
    description: 'test',
    wallet: '',
  );

  test("should return valid link (true)", () {
    expect(LinkUtil.validateLink(validLink.toString()), true);
  });

  test("should return valid link (true)", () {
    expect(LinkUtil.validateLink(validLink1.toString()), true);
  });

  test("should return invalid link (false)", () {
    expect(LinkUtil.validateLink("https://"), false);
  });

  test("should return invalid link (false)", () {
    expect(LinkUtil.validateLink("https://qpay.app/payment"), false);
  });

  test("should return invalid link (false)", () {
    expect(LinkUtil.validateLink("https://qpay.app/payment?id="), false);
  });

  test("should return invalid link (false)", () {
    expect(LinkUtil.validateLink("https://qpay.app/payment?id="), false);
  });

  test("should return invalid link (false)", () {
    expect(LinkUtil.validateLink(invalidLink.toString()), false);
  });
}

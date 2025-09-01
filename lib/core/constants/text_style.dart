import 'package:flutter/material.dart';

class PuddingTextStyle{
  static const TextStyle NanumBarunpenB = TextStyle(fontFamily: 'NanumBerunpenB.ttf');
  static const TextStyle NanumBarunpenR = TextStyle(fontFamily: 'NanumBarunpenR.ttf');
  static const TextStyle LotteriaChab = TextStyle(fontFamily: 'LiaSans-Bold.ttf');

  /// Heading
  static TextStyle heading1  = NanumBarunpenB.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading2 = NanumBarunpenB.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading = NanumBarunpenB.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  /// Body
  static TextStyle body1 = NanumBarunpenR.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body2 = NanumBarunpenR.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body3 = NanumBarunpenR.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  /// Button
  static TextStyle button = NanumBarunpenB.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  /// Label
  static TextStyle label1 = NanumBarunpenB.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  /// Lotteria
  static TextStyle lotteriaChab = LotteriaChab.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}

import 'package:flutter/material.dart';

const defaultScrollPhysics = BouncingScrollPhysics();

extension PticeLabel on int {
  String get withPriceLabel => '$this تومان';
}

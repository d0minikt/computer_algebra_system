import 'package:computer_algebra_system/core/expression/expression.dart';
import 'package:computer_algebra_system/core/expression/fraction.dart';
import 'package:computer_algebra_system/core/expression/function.dart';
import 'package:computer_algebra_system/core/expression/power.dart';
import 'package:computer_algebra_system/core/expression/sum.dart';
import 'package:computer_algebra_system/core/expression/vector.dart';

class Magnitude extends FunctionAtom {
  final Vector vector;
  Magnitude(this.vector);

  String toString() => "magnitude(${vector.toInfix()})";

  // magnitude is calculated by getting the square root of the sum of all the terms squared
  // e.g. magnitude(Vector[3,2]) -> sqrt(3^2 + 2^2) -> sqrt(13)
  @override
  Expression simplify() {
    final termsSquared =
        vector.values.map((v) => Power(v, Fraction.fromInt(2))).toList();
    return Power(Sum(termsSquared), Fraction.fromInt(1, 2)).simplifyAll();
  }
}

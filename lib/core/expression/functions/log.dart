import 'package:computer_algebra_system/core/expression/fraction.dart';

import '../function.dart';
import "../expression.dart";

class Log extends FunctionAtom {
  final Expression base;
  final Expression value;
  Log(this.base, this.value);

  String toString() => "log(${base.toInfix()},${value.toInfix()})";

  // simplifies the log
  @override
  Expression simplify() {
    final base = this.base.simplifyAll();
    final value = this.value.simplifyAll();
    if (base is Fraction && value is Fraction) {
      BigInt i = BigInt.one;
      Fraction n = base;
      while (n < value) {
        n *= base;
        i += BigInt.one;
      }
      if (n == value) return Fraction(i, BigInt.one);
    }
    final simplifiedLog = Log(base, value);
    // must be already simplified, prevent from simplifying
    simplifiedLog.simplified = true;

    return simplifiedLog;
  }
}

import 'dart:math';

class MathUtils {
  // Static method to find the square root of a number
  static double squareRoot(double number) {
    return sqrt(number);
  }

  // Static method to calculate the factorial of a number
  static int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * factorial(n - 1);
  }

  // Static method to compute the power of a number
  static double power(double base, double exponent) {
    return pow(base, exponent);
  }
}

void main() {
  // Usage of static methods without creating an instance of the class
  double number = 25;
  if (kDebugMode) {
    print('Square root of $number: ${MathUtils.squareRoot(number)}');
  }

  int n = 5;
  print('Factorial of $n: ${MathUtils.factorial(n)}');

  double base = 2;
  double exponent = 3;
  print('Power of $base raised to $exponent: ${MathUtils.power(base, exponent)}');
}

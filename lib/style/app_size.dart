class Insets{
  static double maxWidth = 1200.0;
}

abstract class AppInsets{
  double get padding; 
  double get appBarHeight;
}

class LargeInsets extends AppInsets{
  @override
  double get padding => 80.0;

  @override
  double get appBarHeight => 63.0;
}

class SmallInsets extends AppInsets{
  @override
  double get padding => 16.0;

  @override
  double get appBarHeight => 56.0;
}
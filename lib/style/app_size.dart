class Insets{
  static double get med => 12;
  static double get xs => 4;
  static double get sm => 8;
  static double get lg => 16;
  static double get xl => 24;
  static double get xxl => 48;
  static double get xxxl => 80;
  static double maxWidth = 1280.0;
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
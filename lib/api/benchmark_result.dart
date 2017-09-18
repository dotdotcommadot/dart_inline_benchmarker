part of inline_benchmarker;

class BenchmarkResult {

  //-----------------------------------
  // Public Properties
  //-----------------------------------

  /// Runtime in microseconds.
  int runtime = 0;

  /// startingTime in microseconds.
  int startingTime = 0;

  /// stopTime in microseconds.
  int stopTime = 0;

  //-----------------------------------
  // Constructor
  //-----------------------------------

  BenchmarkResult();

  //-----------------------------------
  // Public Methods
  //-----------------------------------

  void calculate() {

    runtime = _calculateRuntime();
  }

  //-----------------------------------
  // Private Methods
  //-----------------------------------

  int _calculateRuntime() => (stopTime - startingTime);
}

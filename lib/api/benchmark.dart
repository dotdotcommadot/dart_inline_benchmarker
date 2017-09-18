part of inline_benchmarker;

class Benchmark {

  //-----------------------------------
  // Public Properties
  //-----------------------------------

  final String identifier;

  final Stopwatch stopwatch;

  final int indentation;

  final List<BenchmarkResult> results = <BenchmarkResult>[];

  bool get isRunning => _currentResult != null;

  //-----------------------------------
  // Private Properties
  //-----------------------------------

  BenchmarkResult _currentResult;

  //-----------------------------------
  // Constructor
  //-----------------------------------

  Benchmark(
    this.identifier,
    this.stopwatch,
    {this.indentation: 0});

  //-----------------------------------
  // Public Methods
  //-----------------------------------

  void start() {

    if (isRunning)
      return;

    _currentResult = new BenchmarkResult();
    _currentResult.startingTime = stopwatch.elapsedMicroseconds;
  }

  void stop() {

    if (!isRunning || _currentResult == null)
      return;

    _currentResult.stopTime = stopwatch.elapsedMicroseconds;
    _currentResult.calculate();

    results.add(_currentResult);
    _currentResult = null;
  }

  void report() {

    if (results.length == 1)
    {
      print('${_getIndentation()}$identifier: Runtime: ${results.first.runtime.toString()} us');
    }
    else
    {
      print('${_getIndentation()}$identifier:');
      for (int i = 0; i < results.length; i++)
      {
        BenchmarkResult result = results[i];
        print('${_getIndentation()}› (${(i + 1).toString()}/${results.length}) Runtime: ${result.runtime.toString()} us');
      }
    }
  }

  //-----------------------------------
  // Private Methods
  //-----------------------------------

  String _getIndentation() {

    String indent = "";

    if (indentation != null && indentation != 0)
    {
      for (int i = 0; i < indentation; i++)
      {
        indent = '$indent   ';
      }
    }

    return indent;
  }
}
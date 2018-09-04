import 'package:inline_benchmarker/inline_benchmarker.dart';

class NullBenchmark extends Benchmark {
  //-----------------------------------
  // Constructor
  //-----------------------------------

  NullBenchmark() : super(null, null);

  //-----------------------------------
  // Public Methods
  //-----------------------------------

  @override
  void start() {}

  @override
  void stop() {}

  @override
  void report() {}
}

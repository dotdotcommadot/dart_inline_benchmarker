import 'package:inline_benchmarker/inline_benchmarker.dart';

void main() {
  
  runMyStuff();
  runMyOtherStuff();
}

void runMyStuff() {

  Benchmark runMyStuffBenchmark = Benchmarker.generate("runMyStuff", group: "MAIN");
  Benchmark forLoopBenchmark = Benchmarker.generate("forLoop", autoRun: false);
  
  for (int i = 0; i < 100; i++)
  {
    forLoopBenchmark.start();
    runMyOtherStuff();
    forLoopBenchmark.stop();
  }
  
  runMyStuffBenchmark.stop();
  
  Benchmarker.report(group: "MAIN");
  Benchmarker.report();
}

void runMyOtherStuff() {

  Benchmark runMyOtherStuffBenchmark = Benchmarker.generate("runMyOtherStuff", indentation: 1, group: "MAIN");

  // run
  
  runMyOtherStuffBenchmark.stop();
}
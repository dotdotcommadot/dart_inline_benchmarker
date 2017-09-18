## About

InlineBenchmarker is an easy to use inline benchmarking system.  
The goal of inline benchmarking is to help you find bottle-necks in your application, rather than to benchmark abstract units.  
Therefor [Dart's benchmark harness library](https://github.com/dart-lang/benchmark_harness) would probably be better suited.  
Inline benchmarks can be used in projects that are otherwise hard to benchmark (perhaps because they are too much of a spaghetti), or to monitor alghorithms on how they respond with production processes and data.

## How To: Using The Benchmarker

### Benchmarking Methods

```Dart
void loginMethod()
{
  Benchmark loginBenchmark = Benchmarker.generate("loginBenchmark");
  
  // Perform login logic
  
  loginBenchmark.stop();
  Benchmarker.report();
}
```

###### Explanation of Code:

- ```loginBenchmark``` is the name of the benchmark
- ```Benchmarker.report();``` will print out the results of the benchmark

##### Output:
```
[DEFAULT] loginBenchmark: Runtime: 1000 us
```

###### Explanation of Output:

- ```[DEFAULT]``` stands for the group the benchmark belongs to
- ```1000 us``` is how long the benchmark took to run

> µs is an abbreviation for microseconds.

### Benchmarking Loops

```Dart
void calculateMethod()
{
  Benchmark calculationBenchmark = Benchmarker.generate("calculationBenchmark", autoRun: false);
  
  for (int i = 0; i < 100 ; i++)
  {
    calculationBenchmark.start();   
    // Perform calculation logic
    calculationBenchmark.stop();
  }
  
  Benchmarker.report();
}
```

###### Explanation of Code:

- Setting ```autoRun``` to false will prevent the benchmark from running instantly.
- Benchmarks can be started manually using the ```start()``` method

##### Output:
```
[DEFAULT] calculationBenchmark:
› (1/100) Runtime: 10 us
› (2/100) Runtime: 10 us
› (3/100) Runtime: 10 us
...
› (100/100) Runtime: 10 us

```
###### Explanation of Output:

- ```(1/100)``` is which iteration was benchmarked

### Using Group and Indentation Parameters

For more complex applications, which combine nested methods and loops, it might be useful to format the output text using the ```group``` and ```indentation``` parameters.

```Dart
void calculateMethod()
{
  Benchmark calculateMethodBenchmark  = Benchmarker.generate("Calculation Benchmark", group: 'CALCULATION');
  Benchmark calculateLoopBenchmark    = Benchmarker.generate("Calculation Loop Benchmark", group: 'CALCULATION', indentation: 1, autoStart: false);
  
  for (int i = 0; i < 100 ; i++)
  {
    calculateLoopBenchmark.start();
    // Perform calculation logic
    calculateOtherStuffMethod();
    calculateLoopBenchmark.stop();
  }
  
  calculateMethodBenchmark.stop();
  Benchmarker.report(group: 'CALCULATION');
}

void calculateOtherStuffMethod()
{
  Benchmark calculateOtherStuffMethodBenchmark  = Benchmarker.generate("Calculate Other Stuff Benchmark", group: 'CALCULATION', indentation: 2);
  // Perform other calculation logic
  calculateOtherStuffMethodBenchmark.stop();
}
```

###### Explanation of Code:

- The ```group``` parameter will group benchmarks together in the output console.
- When no ```group``` is specified, a 'DEFAULT' group will be created
- The ```indentation``` parameter will indent the output with the number of tabs specified
- ```Benchmarker.report(group: 'CALCULATION');``` will only report the benchmark specified by the ```group``` parameter

##### Output:
```
[CALCULATION] Calculation Benchmark: Runtime: 10000 us
  [CALCULATION] Calculation Loop Benchmark:
  › (1/100) Runtime: 10 us
    [CALCULATION] Calculate Other Stuff Benchmark: Runtime: 10 us
  › (2/100) Runtime: 10 us
    [CALCULATION] Calculate Other Stuff Benchmark: Runtime: 10 us
  › (3/100) Runtime: 10 us
    [CALCULATION] Calculate Other Stuff Benchmark: Runtime: 10 us
    ...
  › (100/100) Runtime: 10 us
    [CALCULATION] Calculate Other Stuff Benchmark: Runtime: 10 us
```

## How To: Disabling Benchmarks
When you are running in production mode, you probably don't want the benchmarks running constantly.
A better option would be to give your application the ability to enable/disable benchmarks (perhaps by passing a URL parameter, in the case of a web application).

Disabling benchmarks is very easy:
```Dart
Benchmarker.disable();
```

##### Output:
```
Enable benchmarks to produce a report
```

## Info
  
For more info about this project, contact:

- [hans@dotdotcommadot.com](mailto:hans@dotdotcommadot.com)






part of dotdotcommadot_benchmarker;

class Benchmark
{
	final String identifier;
	final Stopwatch stopwatch;
  int indentation = 0;
  
  final List<BenchmarkResult> results = [];
	bool isRunning = false;
  
  BenchmarkResult _currentResult;
	
  Benchmark(this.identifier, this.stopwatch, {this.indentation});
	
	void start()
	{
		if (isRunning)
			return;
		
		isRunning = true;
		
		_currentResult = new BenchmarkResult();
		_currentResult.startingTime = stopwatch.elapsedMicroseconds;
	}
	
	void stop()
	{
		if (!isRunning || _currentResult == null)
			return;
		
		isRunning = false;
		
		_currentResult.stopTime = stopwatch.elapsedMicroseconds;
		_currentResult.calculate();
		results.add(_currentResult);
		_currentResult = null;
	}
	
	void report()
	{
		if (results.length == 1)
		{
			print('${getIndentation()}${identifier}: Runtime: ${results.first.runtime.toString()} us');
		}
		else
		{
			print('${getIndentation()}${identifier}:');
			for (var i = 0; i < results.length; i++)
  		{
  			BenchmarkResult result = results[i];
  			print('${getIndentation()}› (${(i + 1).toString()}/${results.length}) Runtime: ${result.runtime.toString()} us');
  		}
		}
	}
	
	String getIndentation()
	{
		String indent = "";
		
		if (indentation != null && indentation != 0)
		{
			for(int i = 0; i < indentation; i++)
  		{
				indent = '$indent   ';
  		}
		}
		
		return indent;
	}
}
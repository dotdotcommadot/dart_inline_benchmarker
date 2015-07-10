part of dotdotcommadot_benchmarker;

class BenchmarkResult
{
	/***
	 * Runtime in MicroSeconds.
	 */
	int runtime = 0;
	
	/***
	 * startingTime in MicroSeconds.
	 */
	int startingTime = 0;
	
	/***
	 * stopTime in MicroSeconds.
	 */
	int stopTime = 0;
	
	
	BenchmarkResult();
	
	void calculate()
	{
		runtime = _calculateRuntime();
	}
	
	int _calculateRuntime() => (stopTime - startingTime);
}
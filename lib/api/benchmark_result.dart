part of inline_benchmarker;

class BenchmarkResult
{
	//-----------------------------------
	//
	// Public Properties
	//
	//-----------------------------------

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

	//-----------------------------------
	//
	// Constructor
	//
	//-----------------------------------

	BenchmarkResult();

	//-----------------------------------
	//
	// Public Methods
	//
	//-----------------------------------
	
	void calculate()
	{
		runtime = _calculateRuntime();
	}

	//-----------------------------------
	//
	// Private Methods
	//
	//-----------------------------------

	int _calculateRuntime() => (stopTime - startingTime);
}
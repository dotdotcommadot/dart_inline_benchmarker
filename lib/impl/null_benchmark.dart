part of inline_benchmarker;

class NullBenchmark extends Benchmark
{
	//-----------------------------------
	//
	// Constructor
	//
	//-----------------------------------

	NullBenchmark() : super(null, null);

	//-----------------------------------
	//
	// Override Methods
	//
	//-----------------------------------

	@override 
	start()
	{
		// do nuttin
	}

	@override 
	stop()
	{
		// do nuttin
	}

	@override 
	report()
	{
		// do nuttin
	}
}
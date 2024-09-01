<cfscript>

	param URL.testBundles="";
	if (URL.testBundles.len()) {
		param URL.directories = "";
	}else{
		param URL.directories="integration,unit";
	}

    import testbox.system.TestBox
	testBox = new TestBox(
		bundles = URL.testBundles.listReduce(qualifyTestElements, []),
		directories = URL.directories.listReduce(qualifyTestElements, [])
	)

	// runs the tests with either HTML output if we browse to this file, or as text if it's run from the shell
	reportFormat = url.keyExists("reportFormat") ? url.reportFormat : "test.system.reports.SimpleReporter"
	result = testBox.run(reporter=reportFormat)
	writeOutput(result.trim())

	function qualifyTestElements(elements, element) {
		testPrefix = "test"
		qualified_element = element.listFirst(".") == testPrefix ? element : element.listPrepend(testPrefix, ".")
		return elements.append(qualified_element)
	}
</cfscript>

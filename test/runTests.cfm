<cfscript>
	// runs the tests with either HTML output if we browse to this file, or as text if it's run from the shell
	reportFormat = url.keyExists("reportFormat") ? url.reportFormat : "testbox.system.reports.SimpleReporter"

    testBox = new testbox.system.TestBox(directory="test")
    result = testBox.run(reporter=reportFormat)
    writeOutput(result)
</cfscript>

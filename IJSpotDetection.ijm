// Author: Sébastien Tosi (IRB Barcelona)
// Integration: Raphaël Marée and Volker Baecker
// Version: 1.0
// Date: 21/04/2017

// Path to input image and result table
inputDir = "/data/in/";
outputDir = "/data/out/";

// Functional parameters
LapRad = 2;
NoiseTol = 2.5;


arg = getArgument();
parts = split(arg, ",");

for(i=0; i<parts.length; i++) {
	nameAndValue = split(parts[i], "=");
	if (indexOf(nameAndValue[0], "input")>-1) inputDir=nameAndValue[1];
	if (indexOf(nameAndValue[0], "output")>-1) outputDir=nameAndValue[1];
	if (indexOf(nameAndValue[0], "radius")>-1) LapRad=nameAndValue[1];
	if (indexOf(nameAndValue[0], "threshold")>-1) NoiseTol=nameAndValue[1];
}


images = getFileList(inputDir);

for(i=0; i<images.length; i++) {
	image = images[i];
	if (endsWith(image, ".tif")) {
		// Open image
		open(inputDir + "/" + image);

		// Processing
		run("FeatureJ Laplacian", "compute smoothing="+d2s(LapRad,2));
		run("Find Maxima...", "noise="+d2s(NoiseTol,2)+" output=List light");

		// Export results
		saveAs("Results", outputDir+ "/" + image +".csv");

		// Cleanup
		run("Close All");
		
		if(isOpen("Results"))
		{
			selectWindow("Results");
			run("Close");
		}

	}
}
		

run("Quit");

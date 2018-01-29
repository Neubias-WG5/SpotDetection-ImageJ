// Author: Sébastien Tosi (IRB Barcelona)
// Version: 1.0
// Date: 21/04/2017

// Path to input image and result table
PathToImage = "E:\\Projects\\NEUBIAS\\FluoAnnotations\\simcep\\Results\\Img_0001_Spt.tif";
PathToResults = "E:\\Projects\\NEUBIAS\\macroResult\\Results.csv";

// Functional parameters
LapRad = 2;
NoiseTol = 2.5;

// Open image
open(PathToImage);

// Processing
run("FeatureJ Laplacian", "compute smoothing="+d2s(LapRad,2));
run("Find Maxima...", "noise="+d2s(NoiseTol,2)+" output=List light");

// Export results
saveAs("Results", PathToResults);

// Cleanup
run("Close All");
if(isOpen("Results"))
{
	selectWindow("Results");
	run("Close");
}

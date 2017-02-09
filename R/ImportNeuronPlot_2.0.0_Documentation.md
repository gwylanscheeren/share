Manual to ImportNeuronPlot
-------------------------

This is a (very short) guide to using the ImportNeuronPlot package by _Gwylan
Scheeren_ hosted on a [private Github repository](https://github.com/gwylanscheeren/ImportNeuronPlot "https://github.com/gwylanscheeren/ImportNeuronPlot").

Contents
--------
- Introduction
- Extraction process
- Usage
- Installation
- Install latest version of ImportNeuronPlot package

Introduction
------------
This package is created for the importing of .xls files created by ExploraNova's
Mercator software. Each file contains neuron counts per segmented brain area
(e.g. V1) further subdivided into label/tracer (e.g. resp. Cat.1/Fast Blue) for
one section/slide in a series of extracted brain sections.

Extraction process
---------------------
0. **Determine xls directory** The script identifies system, in WINDOWS: User is
prompted to select 'xls' folder/directory to process. On MAC/Linux user is asked
to select first file in 'xls' directory to be processed. If system is not
identified the current working directory is selected.

0. **Identify files** The user is presented with a list of detected 'xls'
files and asked to check it and press a button to continue. In addition a
comparison of these files to co-located and corresponding '.mcr' files is
carried out and presented. Naming scheme is ideally as follows: "[Animal]
[Hemisphere][Section number].xls" (eg. "BB122 LH017.xls")

0. **Import xls files** 'xls' files are imported and information on the
animal/case and hemisphere is presented/requested (in case automatic detection
fails). A list of segmented areas and label categories is presented and saved to
automatically created extraction directory.

0. **Get tracer/category labels** After checking for duplicate categories with
slightly differing names (e.g. 'Cat1' instead of 'Cat.1') user is prompted to
enter tracer/label names, e.g. 'FB' for Fast Blue or 'dl' for double labelled
neurons, for each detected category for example: 'Cat.1'.

0. **Extract, interpolate and save data** Data frames are extracted from
imported 'xls' files in a per area/region fashion, interpolated and saved to the
extraction folder in '.xls' format. These data frames are 3 column structures,
the first column lists the "_Sections_" and 2nd and 3rd columns represent
"_Supra_" and "_Infra_" _-granular_ counts for cortical areas. For subcortical
areas, one "_Neurons_" column will be created instead of the separate "_Supra_"
and "_Infra_" _-granular_ columns.

  If no neurons at all are detected for a certain area, a dummy file will be
  saved to a special 'no neurons' subfolder. Additionally extracted areas that
  do not represent a brain area e.g. 'contour' or 'vaisseau' will be prepended
  with '_' for easy identification and sorting. The identification of these
  areas is based on case insensitive matching to a precreated area list defined
  in the first section of the **scriptImport_xls()** function.

0. **Create interpolation result figures** Additionally .pdf files depicting the
un-interpolated and interpolated results are created and saved to extraction
folder

0. **Export to data aggregate** Finally all data (raw and interpolated) is
aggregated into one data frame for this case and saved to the extraction folder
for further analysis.

Package created by [Gwylan Scheeren](https://www.linkedin.com/in/gwylan-scheeren
-58a83464/ "LinkedIn page of Gwylan Scheeren"). Parts of code and idea adopted
from Ana Rita Ribeiro Gomes.
Last modification on 8 February 2017. For questions email me at: _g.n.l.scheeren@gmail.com_

Usage
---------------------
Running the import routine:

`library(ImportNeuronPlot)`

`scriptImport_xls()`

optional input to import function:

**verbose** = boolean switch to turn on verbose mode to get additional info during execution of script, for debugging purposes.
example:

`scriptImport_xls(verbose = TRUE)`

You can also get help by typing:
`?scriptImport_xls()`

**check.areas** = character vector with areas that are to be prepended with ‘_’ for sorting.
example:

`A <- c("Contour", "Outside", "pollution", "Site", "Vaisseau", "ventricule", "WM", "Zero")`

`scriptImport_xls(check.areas = A)`

Installation
---------------
Install necessary software on system:

0. Latest R (https://www.r-project.org/)
0. RStudio (_optional_) (https://www.rstudio.com/products/rstudio/download/)
0. Git (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
0. Java (https://www.java.com/en/download/manual.jsp)
0. Perl (strawberry) (http://strawberryperl.com/)

Install necessary packages in R/RStudio using the _command_ window:

`install.packages("xlsx")`

`install.packages("gdata")`

`install.packages("devtools")`

_Optional: for viewing the code, editing it and uploading to GitHub_
1. Get Github account (https://github.com/)
2. RStudio (https://www.rstudio.com/products/rstudio/download/)
3. Add project, add account, set up ssh using this guide: https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN

Install latest version of ImportNeuronPlot package
---------------------
Install **ImportNeuronPlot** using **P**rivate (repository) **A**uthorization **T**oken (**PAT**):

`library(devtools)`

`PAT <- "0d07916f363756d435c4c219b58f237e66687366"`

`install_github("gwylanscheeren/ImportNeuronPlot", auth_token = PAT)`

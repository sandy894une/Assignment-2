# PDF to Text Tool
# MiCk Morrison
# 6 May 2022
# This is a simple demo of using Rstudio/Rscripts to extract text from PDFS for textual analysis
# The goal is to create a corpus from a selected folder containing PDFS. This works on batches of PDFs, 
# rather than single PDFS.
# The script will search a folder for all PDFS
# 

# First step is to load our libraries
# remember, you might need to run the command `install.packages("pdftools")` once to install the package
# install.packages("pdftools") 
# install.packages("tesseract") 
# install.packages("tm")
# Run these three lines ^ above the first time you attempt this. Just remove the # from each line to make the code live.
# Comment them out again once installed successfully.

library(pdftools)
library(tesseract)
library(tm)

# Clear the local env before starting. Be sure to do this if you are having problems, i.e. then re-run the script from here

rm(list=ls())

# This sets the working directory. Make sure this is the location of your PDF files
# Easiest way to get this location is to browse from the Files pane, and in the More menu
# Select Copy Folder Path to Clipboard, and paste below.

setwd('C:/Users/sandy/OneDrive - University of New England/HINQ302/Assignment-2/Portfolio-task-3')


# copy the path to the location that your PDFS are stored, and replace in the URL below:
# Don't forget to include the additional code after the URL as I have done below. This will 
# search for PDFs (pattern="pdf$"), to search all sub-folders (recursive = TRUE) and include the full
# path of the file in the 'files' object (include.dirs = TRUE):

files <- list.files(path=".", pattern = "pdf$", recursive = TRUE, include.dirs = TRUE)

# Check that the PDFs imported successfully into the 'files' dataset

head(files) # This will produce a list of the files you have imported (or a selection of them)
class(files) # This tells us that 'files' is a character object. At present though, we just have the file names and nothing more

# now we have our text, we need to organise it a little and add it to a corpus using the TM library ('text mining')
corp <- Corpus(URISource(files),
               readerControl = list(reader = readPDF))

# Now, R has created a  'volatile corpus', or VCorpus, which is your corpus loaded only in R's memory (which is why it lives in your Global Environment)
# Because R is scary, here we will do the rest of our analysis in other applications.
# To export your corpus to text files, run:

writeCorpus(corp) #this will output each of the converted text files to individual text files in your working directory. Take a look now. 

# Acknowledgements
## A portion of this script is based  on guidelines provided at 
## https://data.library.virginia.edu/reading-pdf-files-into-r-for-text-mining/
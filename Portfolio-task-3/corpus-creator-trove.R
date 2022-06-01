# PDF to Text Tool
# filename: corpus-creator-trove.R
# MiCk Morrison
# 6 May 2022

#altered by Sandy Pullen for Portfolio-activity-3 for the Trove archive - was ultimately unsuccessful
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


library(tidyverse) #needed for str_remove
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

list_of_files <- list.files(path=".", pattern = "pdf$", recursive = TRUE, include.dirs = TRUE)

# Check that the PDFs imported successfully into the 'files' dataset

head(list_of_files) # This will produce a list of the files you have imported (or a selection of them)
class(list_of_files) # This tells us that 'files' is a character object. At present though, we just have the file names and nothing more


#remove the file extension from the filenames to be used in the loop
pdf_file_list <- str_remove(list_of_files,pattern=".pdf")
head(pdf_file_list)
for (i in pdf_file_list){
  
  pdf_name =paste(i,".pdf",sep="")
  txt_name = paste(i,".txt", sep="")
  
  eng <- tesseract("eng")
  text <- tesseract::ocr(pdf_name ,engine = eng)
  cat(text, file = txt_name)
  
}


# Acknowledgements
## A portion of this script is based  on guidelines provided at 
## https://data.library.virginia.edu/reading-pdf-files-into-r-for-text-mining/
## https://cran.r-project.org/web/packages/tesseract/vignettes/intro.html
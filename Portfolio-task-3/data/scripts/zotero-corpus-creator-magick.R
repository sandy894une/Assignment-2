# PDF to Text Tool
# filename:zotero-corpus-creator.R
# MiCk Morrison
# 6 May 2022

#altered by Sandy Pullen for Portfolio-activity-3
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
# install.packages("magick")

# Run these three lines ^ above the first time you attempt this. Just remove the # from each line to make the code live.
# Comment them out again once installed successfully.
library(tidyverse) #needed for str_remove
library(pdftools)
library(tesseract)
library(tm)
library(magick)

# Clear the local env before starting. Be sure to do this if you are having problems, i.e. then re-run the script from here

rm(list=ls())

# This sets the working directory. Make sure this is the location of your PDF files
# Easiest way to get this location is to browse from the Files pane, and in the More menu
# Select Copy Folder Path to Clipboard, and paste below.

setwd('C:/Users/sandy/OneDrive - University of New England/HINQ302/Assignment-2/Portfolio-task-3')


input <- image_read("1829-The-Hobart-Town-almanack-p33-77_5.png")

text <- input %>%
  image_contrast(sharpen = 5) %>%
  image_convert(type = 'Grayscale') %>%
  tesseract::ocr() 

cat(text, file="1829-The-Hobart-Town-almanack-p33-77_5.txt")

# Now, R has created a  'volatile corpus', or VCorpus, which is your corpus loaded only in R's memory (which is why it lives in your Global Environment)
#
# To export your corpus to text files, run:

#writeCorpus(corp) #this will output each of the converted text files to individual text files in your working directory. Take a look now. 

# Acknowledgements
## A portion of this script is based  on guidelines provided at 
## https://data.library.virginia.edu/reading-pdf-files-into-r-for-text-mining/
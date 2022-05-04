
# title: "capture-images.py""
# description: script to download land grant images from Libraries Tasmania website"
# author: "Sandy Pullen"
# date: '2022-05-01'


# before running this script in RStudio perform the following installations:
# 1. RStudio > Tools > Install Packages > reticulate
# 2. in the Terminal pane type> pip install pandas
# 3. in the Terminal pane note the current working directory (cwd)

import pandas as pd
import urllib.request

# specify the CSV file to be read in
# note: specify the path relative to the cwd obtained above

file_name= "Assignment-2/Portfolio-task-1/refined-land-csv-May-1.csv"

# create a dataframe, optionally specify the column name required
df = pd.read_csv(file_name, usecols=['IMAGE', 'LASTNAME', 'FIRSTNAME1', 'YEAR'])


# iterate over the dataframe (i.e. loop over each row)

for index, row in df.iterrows():  
  
  
  # construct URL from filename
  image_url="https://stors.tas.gov.au/fetch/" + row['IMAGE']
  
  # construct save name with IMAGE-LASTNAME-FIRSTNAME1, file path is relative to the cwd
  save_name = "Assignment-2/Portfolio-task-1/captured/" + row['IMAGE'] + "_" + row['LASTNAME'] + "_" + row['FIRSTNAME1'] + ".jpg"
  
  # download the image from the URL
  # Adding user_agent information
  opener=urllib.request.build_opener()
  opener.addheaders=[('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1941.0 Safari/537.36')]
  urllib.request.install_opener(opener)
  
  # Get resource
  urllib.request.urlretrieve(image_url, save_name)


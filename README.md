# Income Vs Representation

## Utilized Kaggle Datasets:
US Representation by Zip Code[https://www.kaggle.com/jayrav13/us-representation-by-zip-code] JSON format
US Household Income[https://www.kaggle.com/goldenoakresearch/us-household-income-stats-geo-locations?select=kaggle_income.csv] CSV format

### Data Clean-up

### kaggle_income.csv > clean_income_db (Project 2 Data Clean-up Notebook)
The first step of the data cleaning process was to load the kaggle_income.csv into a jupyter notebook. We then created it into a Pandas DataFrame and reviewed the columns and content to determine what would be needed for our database. We then pulled out the 8 columns we wanted vs all 19 that were available. We then removed rows based on the content from the income columns that was 0 and only pulled the last of the unique zip code entries since it can have multiple cities with the same zip. We then saved the DataFrame as a csv file to use in PostgresSQL.

### us_representation > officials complete (json with T Notebook) 
The json was much harder to clean then we expected. First step was to load the json file into the notebook. When trying to run such a large dataset of 228MB with 30k rows we had to learn to open jupyter notebook without the normal data limits (jupyter notebook -- NotebookApp.iopub_data_rate_limit=1.0e10) for it to even work. We then turned the data into a DataFrame and reset the index so that the Zip Code was a column. Then there was the complication that in order to get the political party and officials we wanted were nested in each officials column cell. We then had to view the nested details to determine how we can pull out the info we want. Once we were able to identify which key data we needed we created a list to hold the info and pulled out the name and political party. That allowed us to create a new DataFrame “officials” that we then turned into a csv to use in PostgresSQL. During this clean-up process I tried a few different things that can be seen in the json fails folder of github. Using things like json_normalize to figure out how to un-nest the information.

When loading these items into github we also ran into a problem because the file size limit is 100MB typically. We had to download git lfs in our terminal, track the files and have a gitattributes file. Once you set it up, you can push and pull like normal, it just takes a little more time. 

### Database (PostgresSQL)
The database in PostgresSQL was added and used CREATE TABLE to get the framework from each of the 2 csv. Then we used the import option to bring in the values of the tables. Once both were created, we used INNER JOIN by zip code to view the tables together. We then used different combinations of queries to review the information for what we needed. 

### Data Limitations
There were some limitations to our data. For example, we only had one variable that could be tested since there is no direct relationship between income and presidential party. We also only did the United States since the Income did cover other countries, but the US representation did not. Due to the different data sources, when joining it was only able to match to 40 of the 50 states. 

### Conclusion
In the end we were able to see some trends and correlations between average income and Political Party. For example, the Top 10 states for average income had primarily Democratic Representation for 8 states and Primarily Republican for 2 states. Republicans primarily serve in the highest total states 26 of the 40 in our data. We could continue to manipulate this data and find percentages of political party to be more accurate. 

![image](https://user-images.githubusercontent.com/87084344/152468809-561e7f0a-e0c7-48f1-ab3c-a9d9c2a8a074.png)


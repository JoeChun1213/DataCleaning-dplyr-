
# Data Cleaning using R

In this project, we aim to focus mostly on cleaning the Education Statistics data obtained  from https://datacatalog.worldbank.org/search/dataset/0038480. The data is a panel data with time information scattered across its columns and panel information across rows, which prompts cleaning before analysis.


## Raw data structure

When we first obtained the data, it contained 886930 observations and 70 variables. A quick inspection of the data revealed it is in the wide format with the year as the wide column variables. In addition the data contains many economic policy and projections. Cleaning the data for all the policies would be cumbersome. So we decided to clean the data for a few economic variables and a education projection.

The data can also be obtained from
[Link:](https://drive.google.com/file/d/11NCc8AoaXVmQ8x3pmOrazFlIKZJ9CHG0/view?usp=sharing)

## Data of interest

Wittgenstein Projection data: Contains countries projection as a function of levels of education attainment and gender from 1970 to 2020 for 242 countries.

The data is cleaned for two particular goals, namely a) Wittgenstein projection and b) range of selected economic variables such as Education level, adult literacy rate and GDP per capita.

## Steps taken in our cleaning
We used the `dplyr` library for cleaning purpose.

1. Filtering based on the year (1970:2020)
2. Filtering based on country
3. Pivoting tables,  separating, renaming and reordering of columns 
4. Making economic variables, gender and age group 
5. Repeating the steps 1-4 for 242 countries
6. Storing the individual country data  as a separate file for further analysis

library(tidyverse)

# Loading the data
df<-read_csv("data/EdStatsData.csv")


## Check the data

colnames(df)   # To display the col.names of df
 
US<-df[df$`Country Name`=='United States',-c(54:70)]  # Selelct year upto 2020 excluding prediction upto 2050
 
# The data is in wide format, we first convert it in to Long format
selected_cols=as.character(c(1970:2017,2020))
US_long <- US %>% pivot_longer(cols=all_of(selected_cols), names_to = 'Year', values_to = 'Edu') 
US_long<- US_long[,-c(2,4)]

# Separation of Indicator name variable
df_long<-US_long %>% separate(`Indicator Name`, c('col1', 'Edu.Level', 'Gender'), sep = ',')

# Again convert the unique Indicator names to columns
df_wide<-df_long %>% pivot_wider(names_from = col1, values_from = Edu)
write_csv(df_wide,"USA.csv")  # saving the files

# Choosing the variable of interest
Interest=c("Country Name", "Edu.Level", "Gender" , "Year", "Adult literacy rate" ,
  "Barro-Lee: Average years of primary schooling" , "Barro-Lee: Average years of secondary schooling",
  "Barro-Lee: Average years of tertiary schooling", "Barro-Lee: Average years of total schooling",
  "Barro-Lee: Population in thousands",
  "Duration of compulsory education (years)",
"Government expenditure on education as % of GDP (%)" ,
 "GDP per capita (current US$)") 

# Data 1
cleaned_df<- df_wide[Interest]

# Data 2 (Wittgenstein data)
Witt_data<-df_wide %>% select(contains("Wittgenstein"))

Witt_long<- Witt_data %>% pivot_longer(cols=everything(),names_to = "Var",values_to = "Edu",
                                       names_prefix = "Wittgenstein Projection:")

Witt_long_clean <-Witt_long %>% separate('Var', c('Category', 'Age Category', 'Gender'), sep='\\.')

 
#Wittgenstein Projection
country_list<-unique(df$`Country Name`) 

for (coun_name in country_list)
{
  
# Data 1
coun<-df[df$`Country Name`==count_name,-c(54:70)]  # Selelct year upto 2020 excluding prediction upto 2050

 
Long <- coun %>% pivot_longer(cols=all_of(selected_cols), names_to = 'Year', values_to = 'Edu') 
Long<- Long[,-c(2,4)]

# Separation of Indicator name variable

df_long<-Long %>% separate(`Indicator Name`, c('col1', 'Level', 'Gender'), sep = ',')

# Convert the unique Indicator names to columns

df_wide<-df_long %>% pivot_wider(names_from = col1, values_from = Edu)

fname=paste0(coun_name,  ".csv")
write_csv(df_wide, file=fname)


## Data2 : Wittgenstein Projection data cleaning 

Witt_data<-df_wide %>% select(contains("Wittgenstein"))

Witt_long<- Witt_data %>% pivot_longer(cols=everything(),names_to = "Var",values_to = "Edu",
                                       names_prefix = "Wittgenstein Projection:")

Witt_long_clean <-Witt_long %>% separate('Var', c('Category', 'Age Category', 'Gender'), sep='\\.')
fname=paste0(coun_name,"_Witt.csv")
write_csv(Witt_long_clean, file=fname) 
}

 

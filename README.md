# EUR-Lex
Downloading, parsing, aggregating and visualizing data on EU legislation

![alt text](https://github.com/demetriodor/eur-lex/blob/master/figures/F1_noncom_dir_hd.png)


## Purpose
This repository contain the `R` files used to download, parse, transform, aggregate and visualize data on the legislative acts adopted by the European Union (EU). The data is extracted from the [EUR-Lex](https://eur-lex.europa.eu/) database of EU law. This is work in progress and I plan to add more features and data fields in the future. You are welcome to contribute.

## Scope
The scope of the project covers the main types of legislative acts passed by the three main institutions of the EU. The main types of acts are directives, regulations, and decisions. In the terms of EUR-Lex, the scope includes sector 3 of the database and covers L, R, and D types of acts. There are other types of legislative acts that are used less often and that I do not collect (for a list of all types of acts see [here](https://eur-lex.europa.eu/content/tools/TableOfSectors/types_of_documents_in_eurlex.html)). The main institutions are the Council of the EU, the European Parliament (legislating together with the Council under the ordinary legislative procedure, former co-decision) and the European Commission. I exclude legal acts passed by other institutions of the EU, such as the European Central Bank. 

For now, the temporal scope of my collection is from 1 January 2003 until 30 June 2019. I plan to go back further in time with the data collection and to keep it updated regularly with new legislation arriving, inshallah.

At the moment, the data extraction covers 37,549 acts that comprise 11 GB of text.

## Method of data collection
My approach to collecting the raw data is as follows: I construct a list of EUR-Lex urls (which follow a standard pattern) from all possible CELEX numbers of legislative acts, try to access each url, download the legislative act corresponding to the url if exist, and move forward if not. Hence, I do not rely on the in-built search functions of EUR-Lex nor on the statistics that EUR-Lex provides [here](https://eur-lex.europa.eu/statistics/2019/legislative-acts-statistics.html).

Once the original webpage for each legislative act has been downloaded, I parse the various fields, and then proceed to creating variables, aggregating, visualizing and analysing the data. Since the data is downloaded and stored locally, if new data fields need to be created or changes to the parsing approach need to be implemented, this can happen relatively fast.

## Validity
I have put a lot of hours and effort to make sure that the data is as complete and reliable as possible. However, there are certain disclaimers that I need to make. First, the data I have collected reflects all the deficiencies of the original data as recorded in EUR-Lex. These included any missing or mis-classified legislative acts, any missing data fields (and there are quite a few of those), typos, and so on. Read further for details. My extraction can only be as good as the original data source. Second, EUR-Lex is a moving target. Not only is newly-adopted legislative being added regularly, but old records are sometimes changed, and old legislation that was missing from the database before is sometimes added. Currently, my extraction reflects the state of EUR-Lex as of 17 July 2019. 

I have checked the aggregate numbers of legislative acts that I have retrieved for each year against EUR-Lex searches by adoption date and against the EUR-Lex overviews linked above. Overall, the match is very close, especially for directives. There are small discrepancies when it comes to regulations. And there are sometimes bigger discrepancies when it comes to decisions. Decisions, however, are a very diverse group of legislative acts, some of which have very specific addressees, scope and period of validity. (Two technical reasons why aggregate numbers of decisions are difficult to get: First, while CELEX numbers with added numbers in brackets at the end in the form 3YYYYLXXXX(NN) are usually reserved for corrigenda, in the case of decisions they seem to be used for new decisions as well and to be included in the aggregate stats provided by EUR-Lex. Second, to the best of my guesses, the aggregate EUR-Lex stats include decisions under the M and J categories of legal acts, in addition to the main D category for decisions.)

in terms of data fields, the data on whether the legislative act is still in force is not very systematically included. Furthermore, the date of expiry is often missing when it should be there. Occasionally, but less often, the date of entry into force is also missing. On the positive side, the date of the document (date of adoption) is always available. 

## Data fields
Currently, the data collection includes the following fields: celex number, title, author(s), type of act (main type and secondary), an indicator whether it is new or amending legislative act, an indicator whether the act is still in force, date of document (adoption), date of publication, date of entry into force, date of expiration, keywords, and legal bases. These are all extracted from the ELI attributes of the webpages and not from the text of the legislative act itself. The text is available but for now is not included. Additional data fields can be added and the text of the legislative act itslef can be parsed for more information. I plan do some of that in the future, but you're welcome to fork and contribute to the project as well. The most important next task is to extract the directory codes of the legislation so that overviews per policy sector can be made.   

## Organization of the repository
The repository includes (1) a folder with the `R` scripts used for the project: one each for (a) downloading, (b) parsing, (c) wrangling, (d) aggregating, and (e) visualizing the data. It also includes the (2) resulting data: two big files (in `csv` and `RData` formats) at the level of the individual legislative act and four smaller files with aggregations of the number of legislative acts per year and per semester. In the aggregated files, separate numbers are provided for the number of legislative acts per the intersection of the following three variables: author, type, and new/amending status

## Results
Finally, here are some graphs of the evolution of EU's legislative productivity over the past 15 years done with the data

![Directives adopted by the Council and/or the European Parliament](https://github.com/demetriodor/eur-lex/blob/master/figures/F1_noncom_dir_hd.png)


![All legislative acts adopted by the European Commission](https://github.com/demetriodor/eur-lex/blob/master/figures/F4_com_all_hd.png)


![New and amending legislation](https://github.com/demetriodor/eur-lex/blob/master/figures/F5_noncom_newacts_hd.png)


## Terms of use
You are free to use the scripts and the data, and you are welcome to correct or extend the scripts. If you use the resulting data, please provide an acknowledgement: Toshkov, Dimiter (2019) Data on EU legislative acts extracted from EUR-Lex, 2004-2019. Available at: https://github.com/demetriodor/eur-lex 

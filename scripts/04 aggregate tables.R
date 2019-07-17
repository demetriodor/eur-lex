### Aggregate per year
# first load the data
load(file='./output_table/all_acts_2003-2019_f.Rdata') #load the table

out2<-out %>% filter(date_doc>='2003-01-01')
out2$amend_d<-ifelse(out2$amend_all==1, 'amend', 'new')
out2$group<-paste(out2$author2, out2$type_main, out2$amend_d, sep='.')

#aggregate per year 
eurlex_year<-table(out2$year,out2$group)
eurlex_year
write.csv(eurlex_year, './output_table/acts_per_year_2003-2019.csv')
save(eurlex_year, file='./output_table/acts_per_year_2003-2019.Rdata')

#aggregate per semester
eurlex_semester<-table(out2$year.sem,out2$group)
eurlex_semester
write.csv(eurlex_semester, './output_table/acts_per_semester_2003-2019.csv')
save(eurlex_semester, file='./output_table/acts_per_semester_2003-2019.Rdata')

### Transform the variables

#load('./output_table/all_acts_2003-2019.Rdata') #load the table

out$author2<-gsub('http://publications.europa.eu/resource/authority/corporate-body/', '', out$author)
out[grepl("EP", out$author2) & grepl("CONSIL", out$author2), "author2"] <- "Co-decision"
out[grepl("CONSIL", out$author2) | grepl("Council", out$author2), "author2"] <- "Council"
out[grepl("COM", out$author2), "author2"] <- "Commission"

out$type2<-gsub('http://publications.europa.eu/resource/authority/resource-type/', '', out$type)
out$type2<-gsub('DEC_ENTSCHEID, DEC', 'DEC_ENTSCHEID', out$type2)
out$type2<-gsub('DEC, DEC_ENTSCHEID', 'DEC_ENTSCHEID', out$type2)
out<-out %>% filter(type2!='COMPOS', type2!='JOINT_ACTION')

out$in_force<-gsub('http://data.europa.eu/eli/ontology#InForce-', '', out$in_force)
out$amends2<-ifelse(is.na(out$amends)==TRUE, 0, 1)

out$legal_basis2<-gsub('http://publications.europa.eu/resource/authority/treaty/', '', out$legal_basis)
out$legal_basis2<-gsub(', /EEA', '', out$legal_basis2)
out$legal_basis2<-gsub(', EEA', '', out$legal_basis2)
out$legal_basis2<-gsub('EEA, ', '', out$legal_basis2)
out<-out %>% separate (legal_basis2, sep=", ", into=paste0('legal_basis.',1:max(lengths(str_split(out$legal_basis2, ', ')))), fill='right') 

out$keywords2<-gsub('http://eurovoc.europa.eu/', '', out$keywords)
out<-out %>% separate (keywords2, sep=", ", into=paste0('keyword.',1:max(lengths(str_split(out$keywords2, ', ')))), fill='right') 

out$amend2<-grepl('amending',out$title, ignore.case=TRUE)
out$repeal<-grepl('repeal',out$title, ignore.case=TRUE)
out$recast<-grepl('recast',out$title, ignore.case=TRUE)
out$amend_all<-ifelse(out$amends2==1 | out$amend2==TRUE | out$repeal==TRUE | out$recast==TRUE, 1, 0)

out <- out %>% 
  mutate (type_main = substr(type2, 1,3),
          delegated = ifelse (substr(type2, 5,7)=='DEL', 1,0),
          implementing = ifelse (substr(type2, 5,7)=='IMP', 1,0),
          entscheid = ifelse (substr(type2, 5,7)=='ENT', 1,0),
          author2 = recode (author2, 'Commission' = 'Commission', 'Co-decision'='Co-decision', 'Council'='Council',
                            .default='Other'),
          date_doc = as.Date (date_doc),
          date_pub = as.Date (date_pub),
          date_force = as.Date (date_force),
          date_expiration = as.Date (date_expiration),
          year = year(date_doc),
          semester = semester(date_doc),
          year.sem = paste0(year, '.', semester)
  )

#write the result
write.csv(out, './output_table/all_acts_2003-2019.csv')
save(out, file='./output_table/all_acts_2003-2019.Rdata')

#filter variables and some values based on author
out<-out %>% 
  select (-type, -author, -keywords, -legal_basis, -amends) %>% 
  filter (author2!='Other')


write.csv(out2, './output_table/all_acts_2003-2019_f.csv')
save(out2, file='./output_table/all_acts_2003-2019_f.Rdata')
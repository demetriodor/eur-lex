### Parse the downloaded files

### Identify the files
docs <- list.files(path= './legal_acts/', pattern = "*.html", full.names=TRUE, recursive=TRUE)  

### Prepare the outfile
out<-data.frame(matrix(NA, nrow=length(docs), ncol=12))
colnames(out)<-c('celex', 'type','author', 'amends','in_force', 'date_doc','date_pub', 'date_force', 'date_expiration', 'keywords', 'legal_basis','title')

for (i in 1:length(docs)){
    h<-read_html(docs[i], encoding='UTF-8') #read the file
    
    # Basic information
    get_content('celex', '//meta[@property="eli:id_local"]/@content') 
    
    get_content('title', '//meta[@lang="en"][@property="eli:title"]/@content')
    
    get_content('type', '//meta[@property="eli:type_document"]/@resource')
    
    get_content('author', '//meta[@property="eli:passed_by"]/@resource')
    
    get_content('amends', '//meta[@property="eli:changes"]/@resource')

    get_content('in_force', '//meta[@property="eli:in_force"]/@resource')
    
    # Dates
    get_content('date_doc', '//meta[@property="eli:date_document"]/@content')
    
    get_content('date_pub', '//meta[@property="eli:date_publication"]/@content')
    
    get_content('date_force', '//meta[@property="eli:first_date_entry_in_force"]/@content')
    
    get_content('date_expiration', '//meta[@property="eli:date_no_longer_in_force"]/@content')
    
    # Descriptors
    get_content('keywords', '//meta[@property="eli:is_about"]/@resource')

    get_content('legal_basis', '//meta[@property="eli:based_on"]/@resource')
}

#save the result
write.csv(out, './output_table/all_acts_2003-2019.csv')
save(out, file='./output_table/all_acts_2003-2019.Rdata')

### This file prepares the data for the visualizations.
### The visualizations themselves have separate files

#filter
out<-out %>% filter (date_doc >='2004-07-01' & date_doc<'2019-07-01')

# Figure 1. Non-Commission legislation: directives
dirs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='DIR' & (author2=='Co-decision' | author2=='Council' )) %>%
  summarize (dirs = n())

cdirs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='DIR' & (author2=='Council' )) %>%
  summarize (cdirs = n())
cdirs[30,]<-c('2012.1',0)
cdirs<-cdirs[order(cdirs$year.sem),]
cdirs$cdirs<-as.numeric(as.character(cdirs$cdirs))

# 2.Non-Commission legislation: regulations
regs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='REG' & (author2=='Co-decision' | author2=='Council' )) %>%
  summarize (regs = n())

cregs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='REG' & (author2=='Council' )) %>%
  summarize (cregs = n())

# 3. Non-commission legislation: decisions
decs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='DEC' & (author2=='Council' | author2=='Co-decision')) %>%
  summarize (decs = n())

cdecs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='DEC' & (author2=='Co-decision')) %>%
  summarize (cdecs = n())

# 4. Commission legislation
acts<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='DEC' |type_main=='REG' | type_main=='DIR') & author2=='Commission') %>%
  summarize (acts = n())

regs<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='REG' | type_main=='DIR') & (author2=='Commission' )) %>%
  summarize (regs = n())

dirs<-out %>%
  group_by (year.sem) %>%
  filter (type_main=='DIR' & (author2=='Commission' )) %>%
  summarize (dirs = n())

# 5. Old and new: non-Commission directives
dirs<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='DIR' | type_main=='REG') & (author2=='Co-decision' | author2=='Council' )) %>%
  summarize (dirs = n())

dirsn<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='DIR' | type_main=='REG') & (author2=='Co-decision' | author2=='Council' ) & amend_all==0) %>%
  summarize (dirsn = n())

# 6. Types of Commission directives and regulations
regsd<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='DIR' | type_main=='REG' | type_main=='DEC' ) & (author2=='Commission') & (delegated==1)) %>%
  summarize (regsd = n())

regsi<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='DIR' | type_main=='REG' | type_main=='DEC' ) & (author2=='Commission') & (implementing==1 | delegated==1 )) %>%
  summarize (regsi = n())

regs<-out %>%
  group_by (year.sem) %>%
  filter ((type_main=='DIR' | type_main=='REG' | type_main=='DEC' ) & (author2=='Commission')) %>%
  summarize (regs = n())
regs<-regs[13:30,]

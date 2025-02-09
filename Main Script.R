### Sourcing in lookup files
source("C:/Users/benny/Documents/My Resps/NHS-Geography-Code-Lookup-File/Geo File.R")
WeeklyAE <- get_resource(res_id = "a5f7ca94-c810-41b5-a7c9-25c18d43e5a4")

WeeklyAE <- WeeklyAE %>% 
  select(-Country) %>% 
  rename(HB = HBT)

WeeklyAE$WeekEndingDate <- ymd(WeeklyAE$WeekEndingDate)

WeeklyAE <- full_join(WeeklyAE, HB_Lookup, by = "HB")

Hospital_List <- Lookup_List %>% 
  filter(GeoType == "Hospital") %>% 
  select(GeoName, GeoCode)

WeeklyAE <- WeeklyAE %>% 
  rename(GeoCode = TreatmentLocation) 

WeeklyAE <- full_join(WeeklyAE, Hospital_List, by = "GeoCode") %>% 
  select(-GeoType)
# These functions are for getting the network data for the street profile analysis tutorial ()
# You will need the following packages: 
# library(rjson)
# library(dplyr)
# library(sf)

#function to get bakerloo line stops
getBakerlooStops <- function(){
  
  #get json from TfL API
  api_call <- fromJSON(readLines("https://api.tfl.gov.uk/line/bakerloo/route/sequence/outbound"))
  
  #parse df of stops and latlongs
  datalist = list()
  for (i in 1:length(api_call$stations)) {
    
    datalist[[i]] <- data.frame(stn_name = api_call$stations[[i]]$name, 
                                stn_lat = api_call$stations[[i]]$lat, 
                                stn_lon = api_call$stations[[i]]$lon, 
                                line = "bakerloo")
  }
  bakerloo_stops <- do.call(rbind, datalist)
  
  
  
  return(st_as_sf(bakerloo_stops, coords = c("stn_lon", "stn_lat"), crs = 4326))
  
  
}


#function to bind bakerloo line stops into line

getBakerlooLine <- function(x){
  
  return(x %>% group_by(line) %>% st_union() %>% st_cast("LINESTRING"))
  
}
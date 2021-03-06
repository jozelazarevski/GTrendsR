gTrends = function(ch, geo = 'all', query, cat = "0")  
{
  authenticatePage2 = getURL("http://www.google.com", curl = ch)
  
  ## get Google Insights results CSV
  #trendsURL <- "http://www.google.com/trends/viz?"
  
  #trendsURL <- "http://www.google.com/trends/TrendsRepport?"
  trendsURL <- "http://www.google.com/trends/?"
  #resultsText <- getForm(trendsURL, .params = list(q = query, geo = geo, export = 1, hl = 'en', content=1, graph = 'all_csv'), curl = ch, .opts = list(verbose = F))
  
  pp = list(q = query, geo = geo, cat = cat, content = 1, export = 1, graph = 'all_csv')
  
  resultsText <- getForm(trendsURL, .params = pp, curl = ch)
  
  
  #print(resultsText)
  
  #print(rawToChar(resultsText))
  
  ## Sometimes we reach quota limit, in that case stop!
  if(any(grep("QUOTA", resultsText))){
    stop("Reached Google Trends quota limit! Please try again later.") 
  }
    
  resultsText = gFormatTrends2(resultsText)
  
  resultsText$GEO = geo
  
  return(resultsText)
  
}

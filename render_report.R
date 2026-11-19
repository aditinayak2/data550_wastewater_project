
library(rmarkdown)

map_months <- as.integer(Sys.getenv("MAP_MONTHS", "6"))

render(
  "final_report.Rmd",
  params = list(map_months = map_months)
)

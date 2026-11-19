library(dplyr)
library(ggplot2)
library(tidyr)
library(lubridate)
library(sf)

wastewater <- readRDS("data/clean/wastewater_clean.rds")
ga_counties <- st_as_sf(
  readRDS("data/clean/ga_counties_2025.rds")
)

if (!exists("map_months")) {
  map_months <- 6
}

latest_date <- max(
  as.Date(wastewater$sample_collect_date),
  na.rm = TRUE
)

wastewater_2026 <- wastewater |>
  mutate(sample_collect_date = as.Date(sample_collect_date)) |>
  filter(
    sample_collect_date >= latest_date %m-% months(map_months),
    sample_collect_date <= latest_date
  )

county_wval <- wastewater_2026 |>
  separate_rows(counties_served, sep = ",\\s*") |>
  group_by(counties_served) |>
  summarise(
    mean_wval = mean(wval, na.rm = TRUE),
    n_samples = sum(!is.na(wval)),
    .groups = "drop"
  )

ga_map <- ga_counties |>
  left_join(
    county_wval,
    by = c("NAME" = "counties_served")
  )

county_map_plot <- ggplot(ga_map) +
  geom_sf(aes(fill = mean_wval), color = "white", linewidth = 0.2) +
  scale_fill_gradient(
    low = "lightyellow",
    high = "darkred",
    na.value = "grey90",
    name = "Average WVAL"
  ) +
  labs(
    title = "COVID-19 Wastewater Viral Activity Across Georgia Counties",
    subtitle = paste(
      "Average wastewater viral activity level over the most recent",
      map_months,
      "months"
    ),    
    caption = "Counties without available measurements are shown in gray."
  ) +
  theme_void()

ggsave(
  filename = "output/figure_one.png",
  plot = county_map_plot,
  width = 10,
  height = 7,
  dpi = 300
)

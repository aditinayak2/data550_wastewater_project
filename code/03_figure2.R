here::i_am("code/03_figure2.R")

data <- readRDS(
  file = here::here("data/clean/wastewater_clean.rds")
)

#load libraries 
library(ggplot2)
library(dplyr)
library(lubridate)

#create monthly average wval 
data_monthly <- summarize(
  group_by(mutate(data, 
                  month = floor_date(sample_collect_date, "month")),
           month, sample_matrix),
  avg_wval = mean(wval, na.rm = TRUE),
  .groups = "drop"
)

#create figure (line graph)
figure_two <- ggplot(data_monthly,
                     aes(x = month,
                         y = avg_wval,
                         color = sample_matrix,
                         group = sample_matrix)) +
  geom_line(linewidth = 0.8) +
  scale_x_date(date_breaks = "6 months",
               date_labels = "%b %Y"
  ) +
  labs(title = "Wastewater Viral Activity Level",
       x = "Sample Collection Date",
       y = "Average WVAL",
       color = "Sample Matrix"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1)
  )

#save figure 
ggsave(
  here::here("output/figure_two.png"),
  plot = figure_two,
  device = "png",
  width = 12,
  height = 6
)




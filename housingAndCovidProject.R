data = read.csv("housingAndCovidData.csv")
data$period_begin <- as.Date(data$period_begin, format = "%Y-%m-%d")
data$period_end <- as.Date(data$period_end, format = "%Y-%m-%d")

# histogram over time
# Cross correlation of covid and housing irrespective of time
# Visual assessment and cross correlation (xi - mean) and (yi - mean) if its high there is a strong corrilation
# regression model covid vs housing

library(ggplot2)
ggplot(mapping = aes(x, y)) +
  geom_bar(data = data.frame(x = data$period_begin, y = data$median_price_mapped), stat = 'identity', fill = "black") +
  geom_bar(data = data.frame(x = data$period_begin, y = data$cases_mapped), stat = 'identity', fill = 'yellow', width = 3) +
  theme_classic() + scale_y_continuous(expand = c(0, 0))
# This plot uses a scaled representation of the housing and covid cases
# Mapping to smallest value to 0 and the biggest to 1 so they can be desplayed
# on the same graph
# From this we can see that the high number of covid cases has raised the median sale price
# At the start of covid the median sale price grew and then dropped as cases increased
# After some time the housing price stayed the same, higher then it was before covid


ccf(data$cases, data$median_sale_price)
# From this cross correlation we can see that covid cases and median sale price are autocorrialted to each other
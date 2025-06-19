#######################################################
# Step#01: Install and load required libraries
library(SPEI)
library(ggplot2)
library(dplyr)

#Step#02: Simulate data
set.seed(123)
precip <- rnorm(120, mean = 50, sd = 10)
pet <- rnorm(120, mean = 40, sd = 5)
cbalance <- precip - pet

# Step#03: Convert to ts object (monthly data starting Jan 2000)
cbalance_ts <- ts(cbalance, start = c(2000, 1), frequency = 12)

#Step#04: Calculate 3-month SPEI
spei_obj <- spei(cbalance_ts, scale = 6)

#Step=05: Convert to data frame for ggplot
spei_df <- data.frame(
  date = as.Date(as.yearmon(time(spei_obj$fitted))),
  spei = as.numeric(spei_obj$fitted)
)

#Step=06: Add wet/dry classification
spei_df <- spei_df %>%
  mutate(type = ifelse(spei >= 0, "Wet", "Dry"))

#Step=07: Plot
p=ggplot(spei_df, aes(x = date, y = spei, fill = type)) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = c("Wet" = "blue", "Dry" = "red")) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray30") +
  labs(title = "SPEI Wet and Dry Events",
       x = "Date", y = "SPEI") +
  theme_minimal()

ggsave("spei_plot_500dpi.png", plot = p, dpi = 500,
       width = 8, height = 4, units = "in", bg = "white")


        ########################## THE END ################################

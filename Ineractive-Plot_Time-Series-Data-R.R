###############################################################################
# Load required libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(plotly)
library(scales)
################################################################################
# Read Beveridge Wheat Price data from the original source
url <- "https://www.ime.usp.br/~pam/beveridge.xls"
tmp_file <- tempfile(fileext = ".xls")
download.file(url, destfile = tmp_file, mode = "wb")
df <- read_excel(tmp_file, col_names = FALSE)

# Read the data from your computer
df <- read_excel("beveridge.xls")
################################################################################
# Prepare data
colnames(df) <- c("Year", "Wheat_Price")
df <- df %>%
  mutate(
    Year = as.integer(Year),
    Wheat_Price = as.numeric(Wheat_Price)  # 🔁 This is essential
  ) %>%
  filter(!is.na(Year), !is.na(Wheat_Price)) %>%
  mutate(
    Period = cut(
      Year,
      breaks = c(1499, 1600, 1700, 1800, 1870),
      labels = c("1500–1600", "1601–1700", "1701–1800", "1801–1869")
    )
  )


################################################################################
# Build the ggplot object
g <- ggplot(df, aes(x = Year, y = Wheat_Price, color = Period)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth(method = "lm", se = FALSE, size = 1.2, linetype = "solid") +
  scale_color_brewer(palette = "Dark2") +
  scale_y_continuous(labels = comma) +
  labs(
    title = "Beveridge Wheat Price Index (1500–1869)",
    subtitle = "With Linear Trend Lines by Historical Period",
    x = "Year",
    y = "Wheat Price Index",
    color = "Period"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 20),
    plot.subtitle = element_text(size = 16),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14),
    legend.title = element_text(size = 15),
    legend.text = element_text(size = 13)
  )


################################################################################
# Plot the figure
plot(g)


################################################################################
# Save the figure as PNG file
ggsave("Time-Series_Interactive_500dpi.png", 
       plot = g, dpi = 500, width = 18, height = 10, bg = "white")  # Save the plot with 500 DPI and dark black labels



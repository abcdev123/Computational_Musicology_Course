library(ggplot2)

aisc2024 <- read.csv("aisc.csv", header = TRUE)

aisc2024 |>                   # Start with the data
  ggplot(                     # Set up the plot.
    aes(
      x = tempo,
      y = arousal,
      size = instrumentalness,
      colour = danceability
    )
  ) +
  geom_point() +              # Scatter plot.
  geom_rug(linewidth = 0.1) + # Add 'fringes' to show data distribution.
  geom_text(                  # Add text labels from above.
    x = 121,
    y = 4.91,
    label = "Onda Corta - Sud America",
    size = 3,                 # Override size (not loudness here).
    hjust = "left",           # Align left side of label with the point.
    vjust = "center",         # Align vertical centre of label with the point.
    angle = 30                # Rotate the text label
  ) +
  scale_x_continuous(         # Fine-tune the x axis.
    limits = c(0, 200),
    breaks = c(50, 100, 150, 200), # Specify grid lines
    minor_breaks = NULL       # Remove 'minor' grid lines.
  ) +
  scale_y_continuous(         # Fine-tune the y axis in the same way.
    limits = c(1, 9),
    breaks = c(1, 5, 9),
    minor_breaks = NULL
  ) +
  scale_colour_viridis_c() +  # Use the popular viridis colour palette.
  scale_size_continuous(      # Fine-tune the sizes of each point.
    trans = "exp",            # Use an exp transformation to emphasise loud..
    guide = "none"            # Remove the legend for size.
  ) +
  theme_light() +             # Use a simpler theme.
  labs(                       # Make the titles nice.
    x = "Tempo",
    y = "Arousal",
    colour = "Danceability"
  )

library(ggplot2)
library(dplyr)

corpus <- read.csv("aisc.csv", header = TRUE)


corpus <- corpus %>%
  mutate(tempo_bin = cut(tempo, breaks = seq(0, 200, by = 40)))

ggplot(corpus, aes(x = tempo_bin, y = danceability, fill = tempo_bin)) +
  geom_boxplot() +
  scale_fill_viridis_d() + 
  theme_minimal() +
  labs(
    title = "Danceability Distribution Across Tempo Bins",
    x = "Tempo Bins",
    y = "Danceability",
    fill = "Tempo Range"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot(corpus, aes(x = arousal)) +
  geom_histogram(binwidth = 0.3, fill = "steelblue", color = "black", alpha = 0.7) +
  theme_minimal() +
  labs(
    title = "Histogram of Arousal Levels",
    x = "Arousal",
    y = "Frequency"
  )


corpus_avg <- corpus %>%
  group_by(tempo) %>%
  summarise(avg_valence = mean(valence, na.rm = TRUE))

ggplot(corpus_avg, aes(x = tempo, y = avg_valence)) +
  geom_line(color = "red", size = 1) +
  geom_point(color = "darkred") +
  theme_minimal() +
  labs(
    title = "Valence vs Tempo Trend",
    x = "Tempo",
    y = "Average Valence"
  )



library(ggplot2)
library(dplyr)

corpus <- read.csv("aisc.csv", header = TRUE)

corpus <- corpus %>%
  mutate(tempo_bin = cut(tempo, breaks = seq(0, 200, by = 40)))

ggplot(corpus, aes(x = arousal)) +
  geom_histogram(binwidth = 0.3, fill = "steelblue", color = "black", alpha = 0.7) +
  theme_minimal() +
  labs(
    title = "Histogram of Arousal Levels",
    x = "Arousal",
    y = "Frequency"
  )

corpus_avg <- corpus %>%
  group_by(tempo) %>%
  summarise(avg_valence = mean(valence, na.rm = TRUE))

ggplot(corpus_avg, aes(x = tempo, y = avg_valence)) +
  geom_line(color = "red", size = 1) +
  geom_point(color = "darkred") +
  theme_minimal() +
  labs(
    title = "Valence vs Tempo Trend",
    x = "Tempo",
    y = "Average Valence"
  )


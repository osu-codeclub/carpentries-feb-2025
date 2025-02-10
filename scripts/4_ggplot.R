# 1 Grammar of graphics---------------------------------------------------------

# 2 Looking at our data and getting set up--------------------------------------

library(tidyverse)
library(gapminder)

View(gapminder)
str(gapminder)

?ggplot()

# 3 Building our plot-----------------------------------------------------------
ggplot(data = gapminder)

gapminder |> 
  ggplot()

gapminder |> 
  ggplot(mapping = aes(x = gdpPercap, y = lifeExp))

gapminder |> 
  ggplot(aes(x = gdpPercap, y = lifeExp))

gapminder |> 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

## Challenge 1------------------------------------------------------------------
# Modify the plot we’ve made so that you can see the relationship between life 
# expectancy and year.

gapminder |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_point()

## Challenge 2------------------------------------------------------------------
# Modify to color your points by continent.
gapminder |>
  ggplot(aes(x = year, y = lifeExp, color = continent)) + 
  geom_point()

# 4 Adding more layers----------------------------------------------------------

gapminder |>
  ggplot(aes(x = year, y = lifeExp, color = continent)) +
  geom_line()

gapminder |> 
  ggplot(aes(x = year, y = lifeExp, color = continent, group = country)) +
  geom_line()

gapminder |> 
  ggplot(aes(x = year, y = lifeExp, color = continent, group = country)) +
  geom_line() +
  geom_point()

gapminder |> 
  ggplot(aes(x = year, y = lifeExp, group = country)) +
  geom_point(aes(color = continent)) +
  geom_line()

## Challenge 3------------------------------------------------------------------
# Change the order of the point and line layers - what happens?

gapminder |>
  ggplot(aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(aes(color = continent))

gapminder |>
  ggplot(aes(x = year, y = lifeExp, group = country)) +
  geom_line(aes(color = continent)) +
  geom_point() 

# 5 Transformations and statistics----------------------------------------------
gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() # log 10 scales the x axis

gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + # not inside aes
  scale_x_log10() # log10 transform the x-axis

gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + # not inside the aes
  scale_x_log10() +
  geom_smooth(method = "lm") # smooth with a linear model ie "lm"

gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + # not inside the aes
  scale_x_log10() +
  geom_smooth(method = "lm", # smooth with a linear model ie "lm"
              linewidth = 3, # increase thickness of the line
              se = FALSE) # turn off plotting of a confident internal

## Challenge 4A-----------------------------------------------------------------
# Modify the color and the size of the points in the previous example. 
# You’ll also probably want to make the linewidth less ridiculous.

gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, color = "purple", size = 0.5) + # outside the aes
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 1) 

## Challenge 4B-----------------------------------------------------------------
# Modify the plot from 4A so points are a different shape 
# and colored by continent with new trendlines

gapminder |>
  ggplot(aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(shape = 17, # 17 is a closed triangle
             alpha = 0.5) + 
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 1) # smooth with a linear model ie "lm"


# 6 Multi-panel figures---------------------------------------------------------

gapminder_americas <- gapminder |>
  filter(continent == "Americas")

gapminder_americas |>
  ggplot(aes(x = year, y = lifeExp, group = country)) +
  geom_line()

gapminder_americas |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap(vars(country))  # make facets by country

# 7 Modifying text--------------------------------------------------------------

gapminder_americas |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap(vars(country)) + # make facets by country
  labs(x = "Year",              # x axis title
       y = "Life expectancy",   # y axis title
       title = "Figure 1. Life expectancy in the Americas from 1952-2007", # main title of figure
  )

# 8 Adjusting theming-----------------------------------------------------------

gapminder_americas |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap(vars(country)) + # make facets by country
  theme(axis.text.x = element_text(angle = 45)) + # years on the x on a 45 deg angle
  labs(x = "Year",              # x axis title
       y = "Life expectancy",   # y axis title
       title = "Figure 1. Life expectancy in the Americas from 1952-2007", # main title of figure
  ) +
  theme_bw() + # change to a black and white theme
  theme(text = element_text(family = "AppleGothic"), # change all fonts
        strip.background = element_rect(color = "red", fill = "black"), # strip text outline red, fill black
        strip.text = element_text(color = "white"), # strip text white
        axis.text.x = element_text(angle = 45, # years on the x on a 45 deg angle
                                   vjust = 0.7)) # scoot year numbers down a lil

# 9 Exporting a plot--------------------------------------------------------------

life_exp_americas_plot <- gapminder_americas |>
  ggplot(aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap(vars(country)) + # make facets by country
  theme(axis.text.x = element_text(angle = 45)) + # years on the x on a 45 deg angle
  labs(x = "Year",              # x axis title
       y = "Life expectancy",   # y axis title
       title = "Figure 1. Life expectancy in the Americas from 1952-2007", # main title of figure
  ) +
  theme_bw() + # change to a black and white theme
  theme(text = element_text(family = "AppleGothic"), # change all fonts
        strip.background = element_rect(color = "red", fill = "black"), # strip text outline red, fill black
        strip.text = element_text(color = "white"), # strip text white
        axis.text.x = element_text(angle = 45, # years on the x on a 45 deg angle
                                   vjust = 0.7)) # scoot year numbers down a lil

ggsave(filename = "results/lifeExp.png", # file path and name
       plot = life_exp_americas_plot,  # what to save
       width = 18, 
       height = 12, 
       dpi = 300, # dots per inch,  ie resolution
       units = "cm") # units for width and height

## Challenge 5------------------------------------------------------------------

# Create some box plots that compare life expectancy between the continents over 
# the time period provided. Try and make your plot look nice, add labels 
# and adjust the theme!


gapminder |>
  ggplot(aes(x = continent, y = lifeExp, fill = continent)) +
  geom_boxplot() +
  facet_wrap(vars(year)) +
  theme_classic() + # my favorite complete theme 
  theme(axis.title.x = element_blank(), # remove x-axis title
        axis.text.x = element_blank(), # remove x-axis labels
        axis.ticks.x = element_blank()) + # remove x-axis ticks
  labs(y = "Life Expectancy (years)",
       fill = "Continent") # change the label on top of the legend
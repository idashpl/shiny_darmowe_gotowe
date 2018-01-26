################################################################################
# Plik zawierający kod którego efekty są dostępne zarówno w pliku ui.R jak i 
# server.R. Może zawierać m.in. komendy wczytujące paczki, kod wstępnie 
# przygotowujący dane, definicje połączeń z bazami danych itp.
################################################################################

library(ggplot2)
library(dplyr)
library(ggthemes)
library(DT)
library(shiny)
library(nycflights13)

options(scipen = 999)

flights <- flights
airlines <- airlines

# łączenie dwóch dataframe'ów
modFlights <- flights %>% 
  inner_join(airlines, by = 'carrier')

# wybór siedmu linii lotniczych
chosenCarrier <- modFlights %>% count(name) %>% 
  arrange(desc(n)) %>% 
  head(7)

# filtrowanie danych 
modFlights <- modFlights %>% 
  filter(!is.na(dep_delay), name %in% chosenCarrier$name)

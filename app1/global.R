################################################################################
# Shiny App using shinydashboard
#
# Author: Nathália Campos
# Created: 2019-07-31
################################################################################

# import libraries
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(shinyBS)
library(DT)
library(formattable)
library(rhandsontable)
library(highcharter)
library(dygraphs)
library(shinycssloaders)
library(RColorBrewer)
library(forecast)


# load modules
# source("modules/mod_graphs.R")
# source("modules/mod_cards.R")
# source("modules/mod_tables.R")

file.sources <- list.files(path = c("modules", "modules/graphs"), pattern = "*.R",  full.names = TRUE)

sapply(file.sources, source, .GlobalEnv)


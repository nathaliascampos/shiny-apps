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
library(dashboardthemes)
library(highcharter)
library(rhandsontable)
library(DT)
library(formattable)
library(forecast)
library(shinycssloaders)

# load modules
source("modules/mod_cards.R")
source("modules/mod_tables.R")
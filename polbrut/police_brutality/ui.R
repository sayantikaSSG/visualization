#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)
pol_bru = read.csv("C:\\Users\\Sayantika\\Documents\\polbrut\\policebrutality.csv")

# Define UI for application that draws a histogram
shinyUI(dashboardPage(
  dashboardHeader(title="Police Brutality in USA"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("About the dataset",tabName = "menu3"),
      menuItem("Univariate Plots",tabName = "menu1"),
      menuItem("Bivarite Plots",tabName = "menu2"),
      menuItem("Conclusion",tabName = "menu4")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("menu1",h1("Univariate Plots"),fluidPage(
        sidebarLayout(
          sidebarPanel(
            selectInput("coloumn","choose the variable",choices = c("Age",
                                                                    "Gender",
                                                                    "Race",
                                                                    "Year",
                                                                    "State",
                                                                    "Manner of death",
                                                                    "Armed",
                                                                    "Mental illness",
                                                                    "Flee")),
            actionButton("go","apply")
          ),
          mainPanel(plotOutput("chart"),textOutput("write"))
        )
      )),
      tabItem("menu2",h1("Bivarite Plots"),fluidPage(
        sidebarLayout(
          sidebarPanel(
            selectInput("coloumn1","choose the bivarte plots",choice = c("age vs year",
                                                                         "age vs race", 
                                                                         "age vs gender",
                                                                         "age vs mental stability",
                                                                         "race vs year",
                                                                         "race vs gender",
                                                                         "race vs armed",
                                                                         "race vs manner of death",
                                                                         "race vs flee",
                                                                         "state vs race",
                                                                         "state vs gender",
                                                                         "armed vs flee",
                                                                         "armed vs mental stability")),
            actionButton("go1","Apply")
          ),
          mainPanel(plotlyOutput("chart1"),verbatimTextOutput("write1"))
        )
      )),
      tabItem("menu3",h1("About the Project"),fluidPage(
        tags$b(tags$h2("About the Dataset Police Brutality:")),
        tags$ul(tags$h4("The chosen data set contains the information about the brutal deaths in hands of police in the years 2000 to
                        2016. This dataset aims to provide insight into individuals who were killed during altercations with police. It
                        includes information on their age, race, mental health status, weapons they were armed with, and if they
                        were fleeing.The dataset has 12479 rows and 19 coloumns.
                        This dataset was provided by FBI and the Centers for Disease Control and Prevention.")), 
        tags$b(tags$h2("What I want to find from this project:")),
        tags$ul(tags$h4("1) Are the police partial to a specific Age, Race or Gender?")),
        tags$ul(tags$h4("2) Which state has the most death cases?")),
        tags$ul(tags$h4("3) How does the Police brutality change over year?")),
        tags$ul(tags$h4("4) Were the victims Mentally unstable, armed or trying to flee?")),
        tags$b(tags$h2("Approach:")),
        tags$b(tags$h4("We will try to answer the above questions using some univariate and bivariate plots.")),
        tags$b(tags$h2("Details of the variables:")),
        tableOutput("table")
      )),
      tabItem("menu4",h1("Conclusion"),fluidPage(
        tags$b(tags$h4("CONCLUSION:- From all the univarite and multivariate plots and charts i have reach to  certain number of conclusion:")),
        tags$ul(tags$h4("1) The police might be partial to white people and females.")), 
        tags$ul(tags$h4("2) The most cases of police brutalityoccured in California.")),
        tags$ul(tags$h4("3) The year 2015 was when the police bruatlity attained its maximum.")),
        tags$ul(tags$h4("4) It is also seen that for most of the victims the presense of weapons were unknown. For the people who were
                        carrying weapons it was mostly guns or knives.
                        Most of the victims were mentally stable and they did not try to flee.")),
        tags$b(tags$h4 ("So we can conclude that this data shows that in some of cases the police has been brutal out of need of the situation, though for most of the time that was not the case."))
      ))
      
    )
  )
)
)

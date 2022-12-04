#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)
pol_bru = read.csv("C:/Users/Sayantika/Desktop/policebrutality.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observeEvent(input$go,
               if(input$coloumn=="Age"){
                 output$chart<-renderPlot({
                   ggplot(pol_bru,aes(x= Age))+geom_histogram(color = "white", fill = "blue", binwidth = 1) 
                 })
                 output$write<-renderPrint({
                   print("Mostly people in there youth(20-40)have been the victims.")
                 })
               }
               else if(input$coloumn=="Gender"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= Gender, fill = Gender))+
                     geom_bar()+
                     coord_flip()
                 })
                 output$write<-renderPrint({
                   print("The victims were mostly male.")
                 })
               }
               else if(input$coloumn=="Race"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= Race, fill = Race))+
                     geom_bar()
                 })
                 output$write<-renderPrint({
                   print("Shows the amount of brutality on different races.")
                 })
               }
               else if(input$coloumn=="Year"){
                 output$chart<-renderPlot({
                   ggplot(pol_bru,aes(x= Year))+geom_histogram( binwidth = 1, color = "blue", fill = "sky blue")
                 })
                 output$write<-renderPrint({
                   print("The most amount of brutality is seen on 2015.")
                 })
               }
               else if(input$coloumn=="State"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= State,fill = State))+
                     geom_bar(width = 0.5)+
                     theme(axis.text=element_text(size=5))+
                     coord_flip()
                 })
                 
                 output$write<-renderPrint({
                   print("The most number of brutality is seen in Callifornia")
                 })
               }
               else if(input$coloumn=="Manner of death"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= Manner_of_death,fill = Manner_of_death))+
                     geom_bar()
                 })
                 output$write<-renderPrint({
                   print("Most of the victims were shot, though some of them were tasered or both.")
                 })
               }
               else if(input$coloumn=="Armed"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= Armed,fill = Armed))+
                     geom_bar(width = 0.5)+
                     theme(axis.text=element_text(size=5))+
                     coord_flip()
                 })
                 output$write<-renderPrint({
                   print("The weapons are either unknown or guns or knife.")
                 })
               }
               else if(input$coloumn=="Mental illness"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= Mental_illness,fill = Mental_illness))+
                     geom_bar()+
                     coord_flip()
                 })
                 output$write<-renderPrint({
                   print("Most of the victims were mentally stable.")
                 })
               }
               else if(input$coloumn=="Flee"){
                 output$chart<-renderPlot({
                   ggplot(data = pol_bru,aes(x= Flee,fill = Flee))+
                     geom_bar()+
                     coord_flip()
                 })
                 output$write<-renderPrint({
                   print("Most of the victims were not trying to flee.")
                 })
               }
  )
  
  observeEvent(input$go1,
               if(input$coloumn1=="age vs year"){
                 output$chart1<-renderPlotly({
                   ggplot(pol_bru, aes(x = Year, y = Age))+
                     geom_point()+
                     geom_smooth()
                 })
                 output$write1<-renderText({
                   print("From th above plot we can say that the on an average the victims are of the same age group over the years.")
                 })
               }
               else if(input$coloumn1=="age vs race" ){
                 output$chart1<-renderPlotly({
                   ggplot(pol_bru,aes(x= Race, y = Age))+
                     geom_boxplot()
                 })
                 output$write1<-renderText({
                   print("The age distribution in different races.")
                 })
               }
               else if(input$coloumn1=="age vs gender" ){
                 output$chart1<-renderPlotly({
                   ggplot(pol_bru,aes(x= Gender, y = Age))+
                     geom_boxplot()
                 })
                 output$write1<-renderText({
                   print("This shows the distribution of age genderwise.")
                 })
               }
               else if(input$coloumn1=="age vs mental stability" ){
                 output$chart1<-renderPlotly({
                   ggplot(pol_bru,aes(x= Mental_illness, y = Age))+
                     geom_boxplot()
                 })
                 output$write1<-renderText({
                   print("The distribution of age and mental illness.")
                 })
               }
               else if(input$coloumn1=="race vs year"){
                 output$chart1<-renderPlotly({
                   ggplot(pol_bru,aes(x= Race, y = Year))+
                     geom_boxplot()
                 })
                 output$write1<- renderText({
                   print("Shows how the police were partial to the white race in the earlier years.")
                   
                 })
               }
               else if(input$coloumn1=="race vs gender"){
                 output$chart1<-renderPlotly({
                   ggplot(data = pol_bru,aes(x= Race,fill = Gender))+
                     geom_bar()
                 })
                 output$write1<- renderText({
                   print("Shows the distribution of race and age.")
                   
                 })
               }
               else if(input$coloumn1=="race vs armed"){
                 output$chart1<-renderPlotly({
                   ggplot(data = pol_bru,aes(x= Race,fill = Armed))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("Shows the weapon presence in different races.")
                 })
               }
               else if(input$coloumn1=="race vs manner of death"){
                 output$chart1<- renderPlotly({
                   ggplot(data = pol_bru,aes(x= Race,fill = Manner_of_death))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("The manner of death in different races.")
                 })
               }
               else if(input$coloumn1=="race vs flee"){
                 output$chart1<- renderPlotly({
                   ggplot(data = pol_bru,aes(x= Race,fill = Flee))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("The tendency of fleeing in different races.")
                 })
               }
               else if(input$coloumn1=="state vs race"){
                 output$chart1<- renderPlotly({
                   ggplot(data = pol_bru,aes(x= Race,fill = State))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("The death of different races accross the states.")
                 })
               }
               else if(input$coloumn1=="state vs gender"){
                 output$chart1<- renderPlotly({
                   ggplot(data = pol_bru,aes(x= Gender,fill = State))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("the death of different genders across different states.")
                 })
               }
               else if(input$coloumn1=="armed vs flee"){
                 output$chart1<- renderPlotly({
                   ggplot(data = pol_bru,aes(x= Flee,fill = Armed))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("Tendency of fleeing amongst armed peoples.")
                 })
               }
               
               else if(input$coloumn1=="armed vs mental stability"){
                 output$chart1<- renderPlotly({
                   ggplot(data = pol_bru,aes(x= Mental_illness,fill = Armed))+
                     geom_bar()
                 })
                 output$write1<-renderText({
                   print("Mental stability of the armed people.")
                 })
               }
  )
  output$table<-renderTable({
    x=c("UID",
        "Name",
        "Age",
        "Stages of life",
        "Gender",
        "Race",
        "Date",
        "Year",
        "Quarter",
        "Month",
        "Week",
        "Day",
        "City",
        "State",
        "Region",
        "Manner of death",
        "Armed",
        "Mental illness",
        "Flee")
    z=c("Unique ID of the victim",
        "The name of the victim",
        "The age of the victim",
        "The age stage of the victim",
        "The Gender of the victim",
        "The Race of the victim",
        "The date of death",
        "The year in which the death occurred",
        "The Quarter in which the death occurred",
        "The month in which the death occurred",
        "The week in which the death occurred",
        "The day in which the death occurred",
        "The City in which the death occurred",
        "The State in which the death occurred",
        "The Region in which the death occurred",
        "In what way was the victim killed?",
        "Did the victim have a weapon?",
        "Was the victim mentally ill?",
        "Did the victim try to escape?")
    nature_of_variable= data.frame(cbind(variable_name=x,description=z))
    nature_of_variable
  })
})

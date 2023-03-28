#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  citationText <- reactive({
    paste0(input$author,
           ifelse(input$author == "", "", ". "),
           input$title,
           ifelse(input$title != "" & (input$version != "" | input$edition != ""),", ", " "),
           input$version,
           ifelse(input$version != "" & input$edition != "", ", ", ""),
           input$edition,
           ifelse(input$type != ""," [", ""),
           input$type,
           ifelse(input$type != "","]. ", ""),
           input$place,
           ifelse(input$place == "","" , ": "),
           input$publisher,
           ifelse(input$publisher != "" | input$title != "", "; ", ""),
           input$pubdate,
           ifelse(input$accessdate != "" | input$revdate != "", " [", ""),
           ifelse(input$revdate != "","modified ", ""),
           input$revdate,
           ifelse(input$revdate == "","" ," ;"),
           ifelse(input$accessdate != "", "accessed ", ""),
           input$accessdate,
           ifelse(input$accessdate != "" | input$revdate != "", "]. ", ""),
           ifelse(input$URL != "", "Available from: ", ""),
           input$URL,
           ifelse(input$URL != "" & input$identifier != "", " ", ""),
           input$identifier)
  })
  output$citation <- renderText({
    citationText()
  })
}

#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

    fluidPage(titlePanel("Food Composition Data Citation Generator"),
              div(style="display:inline-block",textInput(inputId = "author",
                                                         label = "Author(s)",
                                                         width = '400px',
                                                         placeholder = "ex) Haytowitz DB, Ahuja JKC, Wu X, Somanchi M, Nickle M, Nguyen QA, Roseland JM, Williams JR, Patterson KY, Li Y, et al.")),
              div(style="display:inline-block",textInput(inputId = "title",
                                                         label = "Tile/Name",
                                                         width = '400px',
                                                         placeholder = "ex) USDA National Nutrient Database for Standard Reference")),
              div(style="display:inline-block",textInput(inputId = "version",
                                                         label = "Version",
                                                         width = '400px',
                                                         placeholder =  "ex) Version 1.5.0")),
              div(style="display:inline-block",textInput(inputId = "edition",
                                                         label = "Edition",
                                                         width = '400px',
                                                         placeholder =  "ex) 5th Edition")),
              div(style="display:inline-block",textInput(inputId = "type",
                                                         label = "Resource Type",
                                                         width = '400px',
                                                         placeholder = "ex) Internet dataset")),
              div(style="display:inline-block",textInput(inputId = "place",
                                                         label = "Place of Publication (if applicable)",
                                                         width = '400px', placeholder = "ex) Wishington (DC)")),
              div(style="display:inline-block",textInput(inputId = "publisher",
                                                         label = "Publisher(s)",
                                                         width = '400px',
                                                         placeholder = "ex) Nutrient Data Laboratory, Beltsville Human Nutrition Research Center, ARS, USDA")),
              div(style="display:inline-block",textInput(inputId = "pubdate",
                                                         label = "Date of Publication",
                                                         width = '400px',
                                                         placeholder = "ex) 2019 May 2")),
              div(style="display:inline-block",textInput(inputId = "revdate",
                                                         label = "Edition Date of Revision/Modification",
                                                         width = '400px',
                                                         placeholder = "ex) 2019 May 2")),
              div(style="display:inline-block",textInput(inputId = "accessdate",
                                                         label = "Date Accessed",
                                                         width = '400px',
                                                         placeholder = "ex) 2019 May 2")),
              div(style="display:inline-block",textInput(inputId = "URL",
                                                         label = "URL",
                                                         width = '400px',
                                                         placeholder = "ex) https://data.nal.usda.gov/dataset/usda-national-nutrient-database-standard-reference-legacy-release")),
              div(style="display:inline-block",textInput(inputId = "identifier",
                                                         label = "Additional Idenitifier(s)",
                                                         width = '400px',
                                                         placeholder = "ex) identifier: 69ebc253-1869-4bf0-8471-b0c2fb5742f5"))),
    div(style="font-size:30px;font-weight:bold;padding-top:20px;padding-bottom:10px;",
        renderText(paste0("Your Citation:"))),
    div(style="width: 90%; outline: 2px solid #F1592A; font-size: 20px;  min-height: 200px; border-radius: 10px; background: #fdece7;", textOutput("citation"))

  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "CitationTemplate"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

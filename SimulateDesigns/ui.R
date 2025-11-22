# Simulate Designs



# ---- UI ----
ui <- dashboardPage(
  dashboardHeader(title = "Simulate Study Designs",titleWidth = "300px"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("tachometer-alt")),
      # menuItem("Confidence intervals", tabName = "CI", icon = icon("chart-bar")),
      menuItem("Two-arms designs", tabName = "two-arms", icon = icon("chart-bar")),
      menuItem("Multi-arms designs", tabName = "multi-arms", icon = icon("chart-bar")),
      menuItem("Longitudinal designs", tabName = "longitudinal", icon = icon("chart-bar"))
    )
  ),
  
  dashboardBody(
    tabItems(
      # Primera pestaña
      tabItem(tabName = "home",
              
             
      ),
      tabItem(tabName = "CI",
              h3("Confidence intervals")),
      # Segunda pestaña
      tabItem(tabName = "two-arms",
              fluidRow(
                column(8,
                       h3(HTML("A two-arms clinical trial is a type of clinical study where participants 
                       are divided into two groups (or “arms”):
                       <br><br>
                       <ul>
                       <li>Treatment Group (Arm 1): Participants receive the experimental treatment or intervention.</li>
                       <li>Control Group (Arm 2): Participants may receive a placebo, standard treatment, 
                       or no intervention.</li>
                       </ul><br>
                               These trials are common in evaluating the efficacy and safety of new drugs,
                               medical devices, or treatment protocols by directly comparing outcomes between 
                               the two arms.")))
              ),
              hr(),
              box(title="Parallel two-arms clinical trial: importance of the control group",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                  h3(HTML("In a simple two-arm clinical trial without baseline measurements, 
                          differences observed at the end of the study may be influenced by pre-existing 
                          imbalances rather than the treatment effect itself. Without accounting for participants’ 
                          initial status, natural variability, regression to the mean, and unequal prognostic 
                          factors across groups can bias estimates and reduce statistical power. 
                          This increases the risk of incorrect conclusions—either overstating a 
                          treatment benefit or missing a true effect. Including baseline measurements 
                          allows adjustment for these differences, improving precision and the validity 
                          of the trial’s results.")),
                  br(),br(),
                  tags$a(
                    href = "https://irblleida-biostatistics.shinyapps.io/Clinical-Trials-NonEspecific-Effects/",
                    target = "_blank",
                    class = "btn btn-success",
                    "Go to simulator"
                  )),
                  column(5,
                         img(src = "img/FigureRCT.jpg", width = "100%") )
                  )
                  ),
              box(title="Parallel two-arms clinical trial with binary outcome",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                  h3(HTML("In a two-arm design with a binary outcome, the choice between superiority, e
                  quivalence, and non-inferiority frameworks determines how treatment effects are evaluated.
                  <ul><li>Superiority trials aim to show that a new intervention performs significantly better 
                  than the control, typically testing whether the difference in event rates exceeds zero in a f
                  avorable direction.</li>
                  <li>Equivalence trials evaluate whether the difference between groups is small enough 
                  to conclude the treatments are clinically indistinguishable, requiring both upper and lower 
                  bounds of the difference to fall within a predefined equivalence margin.</li>
                  Non-inferiority trials test whether the new treatment is not unacceptably worse than 
                  the control by more than a specified margin, prioritizing benefits such as safety, cost, 
                  or practicality over a proven efficacy gain.</li>
                  </ul>
                  Clear definition of the hypothesis and margins is critical, as these directly 
                          influence sample size, interpretation, and regulatory acceptance of the results.")),
                  br(),br(),
                  tags$a(
                    href = "https://irblleida-biostatistics.shinyapps.io/Clinical-Trial-Two-Arms-Binomial/",
                    target = "_blank",
                    class = "btn btn-success",
                    "Go to simulator"
                  )),
                  
                  column(5,
                         img(src = "img/Superiority.png", width = "100%") )
                  )
                  )
      )
    )
  )
)
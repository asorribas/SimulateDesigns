# Simulate Designs



# ---- UI ----
ui <- dashboardPage(
  dashboardHeader(title = "Simulate Study Designs",titleWidth = "300px"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      # menuItem("Confidence intervals", tabName = "CI", icon = icon("chart-bar")),
      menuItem("Two-arms designs", tabName = "two-arms", icon = icon("vials")),
      menuItem("Multi-arms designs", tabName = "multi-arms", icon = icon("sitemap")),
      menuItem("Longitudinal designs", tabName = "longitudinal", icon = icon("chart-line")),
      br(),
      menuItem("Give us some feedback", tabName = "feedback", icon = icon("comment-dots")),
      menuItem("Our group", tabName = "group", icon = icon("users"))
      
      
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$style(HTML("
      .content-wrapper {
        background-color: white !important;
      }
      .right-side {
        background-color: white !important;
      }
      /* Dejar espacio en blanco antes del footer */
      .content-wrapper {
        background-color: white;
        min-height: calc(100vh - 80px); /* Ajusta según tu header/footer */
        padding-bottom: 300px;
      }

      /* Footer alineado con el contenido (no debajo del sidebar) */
      .main-footer {
        background-color: #ffffff;
        padding: 15px;
        text-align: left;
        border-top: 1px solid #d2d6de;
        margin-left: 0px; /* Width default del sidebar */
        width: 100%;
        position: absolute;
        bottom: 0;
        color: #555;
      }
    "))
    ),
    tabItems(
      # Primera pestaña
      tabItem(tabName = "home",
              fluidPage(
                column(6,
              h2("Welcome to the Clinical Trial & Experimental Design Simulator Hub"),
              hr(),
              h3(HTML("This application provides streamlined access to a set of interactive simulators 
              designed to support decision-making in clinical trials and experimental research. Each tool 
              allows you to explore key design parameters—such as sample size, power, allocation ratios, 
              treatment effects, and variability—while observing how they influence study performance and outcomes.<br><br>
              Use the navigation menu to select a simulator of interest. You will find practical examples, recommended 
              settings, and visual outputs that help translate statistical concepts into real-world study planning.<<br><br>
              These resources are intended for students, clinicians, and researchers aiming to develop a deeper understanding 
              of quantitative methods in biomedical investigation.<br><br>
                      <b>Start exploring, experiment with different scenarios, and enhance your study-design expertise.</b>"))
                ),
              column(6,
                     img(src = "img/teamTable.jpg", width = "100%") )
              )
              
      ),
      tabItem(tabName = "CI",
              h3("Confidence intervals")),
      # Segunda pestaña
      tabItem(tabName = "two-arms",
              fluidRow(
                column(6,
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
                               the two arms."))),
                column(6,
                       img(src = "img/two_arms.png", width = "100%") ),
              hr(),
              br(),br(),br(),
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
                             href = "papers/Teaching_Statistics_2025.pdf",
                             target = "_blank",     # Open in new tab/window
                             style="width:400px",
                             class = "btn btn-primary",
                             HTML("P. Sandoval, E.Vilaprinyo, R. Alves, and A. Sorribas,<br>
                             Beyond statistical power in designing clinical trials: <br>Shiny/R
                             apps to the rescue, <br>Teach. Stat. (2025), 1–13,DOI 10.1111/test.12403")
                           ),
                           tags$a(
                             href = "https://irblleida-biostatistics.shinyapps.io/Clinical-Trial-Two-Arms-Binomial/",
                             target = "_blank",
                             class = "btn btn-success",
                             style = "font-size: 24px;",
                             "Go to simulator"
                           )),
                    
                    column(5,
                           img(src = "img/Superiority.png", width = "100%") )
                  )
              ),
              box(title="Parallel two-arms clinical trial: quantitative outcome",width = 12,
                  status="warning",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                           h3(HTML("Not yet implemented")),
                           )
                  )
              )
      )
      ),
      tabItem(tabName = "multi-arms",
              img(src = "img/muticentric.png", width = "100%")),
      tabItem(tabName = "longitudinal",
              img(src = "img/longitudinal.png", width = "100%"))
    ),
    tags$footer(class = "main-footer",
    box(title='Funding',solidHeader = T,width = 8,status='primary',
        fluidRow(
          column(6,
                 img(src = "img/Institutions.png", width=600)
          ),
          column(6,
                 h5(HTML('<b>Project: PI20/00377</b> <br> Albert Sorribas, Ester Vilaprinyo,
                         Rui Alves, Pedro Sandoval <br> Miguel Ángel Escobar, Jose Serrano, Xavier Gómez <br>
                         Biomodels Group <br> University of Lleida - Institute of Biomedical Research (IRBLleida)'))
          )
        )
    )
  )
  ),
  
  
)
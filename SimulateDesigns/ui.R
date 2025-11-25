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
      menuItem("Other designs",tabName = "other_designs",icon=icon("bars")),
      br(),
      menuItem(text="Give us some feedback",
               tabName = "feedback",
               icon = icon("comment-dots")),
      menuItem(text="Our group",
               href = "http:///www.biomodels.udl.cat",
               icon = icon("users"))
      
      
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
              fluidRow(
                column(6,
                       h4(HTML("A multi-arm clinical trial is a type of study in which several treatments (or 
                       interventions) are tested at the same time within a single trial. Instead of comparing 
                       just one experimental treatment against a control or standard treatment (as is done 
                       in a traditional two-arm trial), multi-arm trials include three or more groups (“arms”). 
                       Each arm receives a different intervention—this could be different drugs, different doses, 
                       or different combinations of therapies.<br>
                       Key features: <br>
                       <ul>
                       <li>Shared control group: Often one control group is used for comparison against 
                       all experimental treatments, which improves efficiency.</li>
                       <li>Simultaneous evaluation: It allows researchers to compare multiple alternatives 
                       in the same population and setting.</li>
                       <li>Adaptive designs common: Some multi-arm trials use adaptive methods,
                               where ineffective treatments can be dropped early and new arms added mid-trial.</li>
                               </ul>"))),
                column(6,
              img(src = "img/muticentric.png", width = "100%")),
              box(title="Parallel multi-arms clinical trial with normally distributed outcome",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                           h3(HTML("In a parallel multi-arm trial, several treatments are compared 
                           simultaneously, usually against a common control. With a continuous outcome, 
                           one-way ANOVA provides a straightforward framework to test whether any of the 
                           treatments differ in mean effect. By modeling treatment as a single factor, 
                           ANOVA assesses overall differences while controlling the Type I error rate for 
                           the global hypothesis. If significant, post-hoc pairwise comparisons help identify 
                           which treatments differ. This design increases efficiency by evaluating multiple 
                           interventions within the same study population and improves evidence-based 
                           decision-making when several promising options exist.")),
                           br(),br(),
                           tags$a(
                             href = "https://irblleida-biostatistics.shinyapps.io/ANOVA-One-Fixed-Factor/",
                             target = "_blank",
                             class = "btn btn-success",
                             style = "font-size: 24px;",
                             "Go to simulator"
                           )),
                    
                    column(5,
                           img(src = "img/multi_arm_tree.png", width = "100%") )
                  )
                  
              ),
              box(title="Multicentric parallel multi-arm clinical trial (Randomized Complete Block Design)",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                           h3(HTML("In a parallel multi-arm clinical trial—such as a multicenter 
                                   study—multiple treatments are evaluated simultaneously against a 
                                   common control or against each other. This design improves efficiency 
                                   by sharing resources and participants, but also increases the risk of 
                                   center-to-center variability and imbalance in key prognostic factors. 
                                   Incorporating blocking (e.g., by study center or other relevant stratifiers) 
                                   ensures that each treatment group is well represented within each block, reducing 
                                   confounding from site-specific differences such as patient characteristics, clinical 
                                   practice, or outcome assessment. Proper blocking enhances comparability between arms, 
                                   improves precision, and supports valid inference across a diverse trial population.")),
                           br(),br(),
                           tags$a(
                             href = "https://irblleida-biostatistics.shinyapps.io/DOE_RCBD/",
                             target = "_blank",
                             class = "btn btn-success",
                             style = "font-size: 24px;",
                             "Go to simulator"
                           )),
                    
                    column(5,
                           img(src = "img/RCBD.png", width = "100%") )
                  )
                  
              )
              )
              ),
      tabItem(tabName = "longitudinal",
              fluidRow(
                column(6,
                       h3(HTML("What is a longitudinal study?<br><br>
                               A longitudinal study is a design in which the same subjects 
                               are followed over time and repeatedly measured on one or more outcomes of interest.
                               Because each individual contributes several observations, the data capture both the evolution 
                               of the outcome within subjects and the differences between treatment groups across time. <br><br>
                               This structure allows researchers to evaluate treatments not only by comparing groups 
                               at a single point but by examining whether their trajectories differ, for example in 
                               baseline levels, rates of change, or patterns of response. Repeated or replicated measurements 
                               enhance the precision of estimates, reduce the impact of measurement error, and provide a clearer 
                               picture of within-subject variability.<br><br> As a result, longitudinal designs offer a powerful framework 
                               for understanding how treatments exert their effects dynamically rather than at a single snapshot in time."))),
                column(6,
                       img(src = "img/longitudinal.png", width = "100%")),
                box(title="Two-arm (treatment vs control) with repeated mseasurements",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                           h3(HTML("In a two-arm longitudinal trial with repeated outcome measurements, each participant 
                                   is followed across multiple time points to capture changes over the course of treatment. 
                                   When subject-specific variability is expected and replicate measurements are taken at each time point,
                                   a mixed-effects model offers a robust analytical framework. It separates between-subject and within-subject 
                                   sources of variation, accommodates incomplete follow-up, and accounts for correlation among repeated observations. 
                                   This approach increases precision in estimating treatment effects over time and enables the evaluation of treatment–time 
                                   interactions, providing deeper insight into how treatment response evolves during the study.")),
                           br(),br(),
                           tags$a(
                             href = "https://irblleida-biostatistics.shinyapps.io/LongitudinalReplicate/",
                             target = "_blank",
                             class = "btn btn-success",
                             style = "font-size: 24px;",
                             "Go to simulator"
                           )),
                    
                    column(5,
                           img(src = "img/longi1.png", width = "100%") )
                  )
                  
              ),
              box(title="Two-arm (treatment vs control) with repeated mseasurements (Using splines)",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                           h3(HTML("In a two-arm longitudinal trial with repeated outcomes measured over continuous time, 
                           treatment effects may evolve in a nonlinear way. Instead of assuming a rigid parametric trend, 
                           spline-based mixed-effects models provide flexible curves that adapt to the data while preserving smoothness.
                           By modeling time with splines and including random subject effects, the approach accounts for within-subject 
                           correlation and captures individual trajectories. This framework supports estimation of complex treatment–time 
                           interaction patterns, improves model fit when changes are not linear, and enables more realistic interpretation of 
                           treatment dynamics throughout follow-up.")),
                           br(),br(),
                           tags$a(
                             href = "https://irblleida-biostatistics.shinyapps.io/LongitudinalTwoGroupsSpline/",
                             target = "_blank",
                             class = "btn btn-success",
                             style = "font-size: 24px;",
                             "Go to simulator"
                           )),
                    
                    column(5,
                           img(src = "img/LongiSplines.png", width = "100%") )
                  )
                  
                  
              ),
              box(title="Multi-arm (compare several treatments) with repeated mseasurements",width = 12,
                  status="primary",solidHeader = T,collapsible = T, collapsed = T,
                  fluidPage(
                    column(7,
                           h3(HTML("In a longitudinal multi-arm clinical trial, participants are randomized to 
                           several treatments and followed over multiple sessions to assess how responses evolve. With 
                           repeated measurements on each subject (but no replicates per session), outcomes are correlated 
                           within individuals. A mixed-effects model accounts for this dependency by incorporating random subject 
                           effects, capturing individual variability in baseline levels and progression over time. This approach 
                           improves accuracy in estimating treatment differences, allows testing treatment–time interactions, and handles 
                           missing observations more effectively than traditional repeated-measures ANOVA.")),
                           br(),br(),
                           tags$a(
                             href = "https://irblleida-biostatistics.shinyapps.io/CompareLongitudinal/",
                             target = "_blank",
                             class = "btn btn-success",
                             style = "font-size: 24px;",
                             "Go to simulator"
                           )),
                    
                    column(5,
                           img(src = "img/LongiMulti.png", width = "100%") )
                  )
                  
                  
              
              )
              )
              ),
      tabItem(tabName = "other_designs",
              fluidRow(
                column(6,
                       h3(HTML("Other common designs"))),
                column(6,
                       img(src = "img/two_arms.png", width = "100%") ),
                hr(),
                br(),br(),br(),
                box(title="Repeated latin squares: mixed models with two random block factors",width = 12,
                    status="primary",solidHeader = T,collapsible = T, collapsed = T,
                    fluidPage(
                      column(7,
                             h3(HTML("In a repeated Latin square design, each treatment appears exactly once in every 
                             row and every column, balancing two nuisance sources of variation (e.g., subjects and periods, 
                             or centers and operators). When the trial includes replications of the Latin square, variability a
                             cross these factors should be modeled appropriately. A mixed-effects model allows treatment to be 
                             evaluated as a fixed effect while treating both row and column effects—and their replication—as random factors. 
                             This approach accounts for correlation within the structured layout, improves precision in estimating treatment 
                             differences, and supports valid inference even when data are unbalanced or include missing observations.")),
                             br(),br(),
                             tags$a(
                               href = "https://irblleida-biostatistics.shinyapps.io/LatinSquares/",
                               target = "_blank",
                               class = "btn btn-success",
                               "Go to simulator"
                             )),
                      column(5,
                             img(src = "img/LSD.png", width = "100%") )
                    )
                ))
              ),
      tabItem(tabName = "feedback")
    ),
    tags$footer(class = "main-footer",
    box(title='Funding',solidHeader = T,width = 12,status='primary',
        fluidRow(
          column(6,
                 img(src = "img/Institutions.png", width=550)
          ),
          column(6,
                 h5(HTML('<b>Project: PI20/00377</b> <br> Albert Sorribas, Ester Vilaprinyo,
                         Rui Alves, Pedro Sandoval <br> Miguel Ángel Escobar, Jose Serrano, Xavier Gómez <br>
                         Biomodels Group <br> University of Lleida - Institute of Biomedical Research (IRBLleida)'))
          )
        )
    )
  )
  
  
  

)  ############ End dashboardBody
)  ############ END UI DashboardPage
getreal_email <- c( "cmiller@gswcf.org", 
                    "mrodriguez@citrus-gs.org", 
                    "dgoins@citrus-gs.org", 
                    "cmitchell@gswcf.org", 
                    "josiadacz@gsgateway.org", 
                    "ldeal@gsgateway.org", 
                    "KMiller@gsgateway.org", 
                    "rnetzel@gssef.org", 
                    "mavellino@gssef.org",
                    "mmoore@gswcf.org",
                    "kevingilds@gmail.com")

library(blastula)
library(glue)
mail_template <- compose_email(
  body = md(c(
    
    "Data Entry reports have been updated and can be found at the following links",
    
    "",
    
    "🔗 **[Access Dashboard]({https://kgilds.github.io/getrealwiki/dashboard.html})**",
    
    
    
    "The purpose of these reports is to help you review your data entry, take action on the informatin, and/ or ask me for clarification on your data.
    
    If someone needs to be added this email, please send me their contact information.
    
    The survey forms have been closed. 
    
    Thank you"
    
    
    
    
  )),
  footer = md(c(
    "This email was generated automatically from the reporting system.",
    "If you believe you received this email in error, please contact me."
  ))
)


debug_email <- compose_email(
  body = md(c(
    "# Debug Email Content",
    "",
    "This email will show you exactly what's being generated:",
    "",
    "**Current Date:** ", as.character(Sys.Date()),
    "",
    "**Test URL:** https://www.google.com",
    "",
    "**Link Test:** [Click Here](https://www.google.com)",
    "",
    "**Variable Test:**",
    glue::glue("URL: {url}", url = "https://example.com"),
    "",
    glue::glue("Link: [Test Link]({url})", url = "https://example.com")
  ))
)


dashboard_url <- "https://kgilds.github.io/getrealwiki/dashboard.html"
report_url <- "https://kgilds.github.io/getrealwiki/data-entry-report.html"

email_content <- glue("

## Get REAL! Data Entry Reports

Data Entry Reports have been updated as of October 31, 2025. 

**Dashboard** 🔗:[Access Dashboard]({dashboard_url})

The purpose of the dashboard is to help you review your data entry, take action on the information, and/ or ask me for clarification on your data.
    
If someone needs to be added this email, please send me their contact information.
    

    
Thank you

Best regards,

Kevin
")

footer_content <- glue(" 
  Get REAL! Reporting MY: 2025-2026
  
  Developed by Kevin Gilds, MPA"
  
)

compose_email(body = md(email_content),
              footer = md(footer_content)) %>% 
  smtp_send(
    from = "kevingilds@gmail",
    to = "kevingilds@gmail.com",
    subject = "Get REAL! Data Updates",
    credentials = creds_file("gmail_creds")
  )
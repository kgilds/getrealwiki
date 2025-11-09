
library(blastula)
library(glue)


getreal_email <- c("aprater@gswcf.org",
                    "csamuel@gswcf.org",
                    "cmitchell@gswcf.org",
                    "josiadacz@gsgateway.org",
                    "KMiller@gsgateway.org",
                    "ldeal@gsgateway.org",
                    "lschindler@citrus-gs.org",
                    "mavellino@gssef.org",
                    "rnetzel@gssef.org",
                   "kevingilds@gmail.com"

)

dashboard_url <- "https://kgilds.github.io/getrealwiki/dashboard.html"
report_url <- "https://kgilds.github.io/getrealwiki/data-entry-report.html"

email_content <- glue("

## Get REAL! Data Entry Updates

Data Entry Reports have been updated as of October 31, 2025. 

**Dashboard** 🔗:[Access Dashboard]({dashboard_url})

The purpose of the dashboard is to help you review your data entry, take action on the information, and/ or ask me for clarification on your data.
    
Update {Limited data entry for the girl survey and no data entry for session summaries, and attendance data } 

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
    to = getreal_email,
    subject = "Get REAL! Data Updates",
    credentials = creds_file("gmail_creds")
  )
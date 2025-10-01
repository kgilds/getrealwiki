
library(blastula)
library(glue)


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



dashboard_url <- "https://kgilds.github.io/getrealwiki/dashboard.html"
report_url <- "https://kgilds.github.io/getrealwiki/data-entry-report.html"

email_content <- glue("
# Get REAL! Data Entry Reports

Data Entry Reports have been updated as of August 1, 2025. 

**Dashboard** 🔗:[Access Dashboard]({dashboard_url})

**Data Entry Report** 📊: [Access Report]({report_url})

The purpose of these reports is to help you review your data entry, take action on the informatin, and/ or ask me for clarification on your data.
    
If someone needs to be added this email, please send me their contact information.
    
If you are still working on adding data please let me know--at some point I need to close data entry. 
    
Thank you

Best regards,
Kevin
")

footer_content <- glue(" 
  Get REAL! Reporting MY: 2024-2025
  
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
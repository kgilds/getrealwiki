library(glue)
library(blastula)

getreal_email <- c( "csamuel@gswcf.org",
                    "cmitchell@gswcf.org",
                    "ujones@gswcf.org",
                    "aprater@gswcf.org",
                    "tmills@gswcf.org",
                    "lschindler@citrus-gs.org",
                    "mschuchhardt@citrus-gs.org",
                    "kparker@citrus-gs.org",
                    "josiadacz@gsgateway.org",
                    "ldeal@gsgateway.org",
                    "KMiller@gsgateway.org",
                    "rnetzel@gssef.org",
                    "mavellino@gssef.org",
                    "kevingilds@gmail.com")


dashboard_url <- "https://kgilds.github.io/getrealwiki/dashboard.html"

# Girl Scouts colors: dark green #004d23, gold #ffc72c, white #ffffff

header_html <- '
<div style="background-color:#004d23; padding:24px 32px; border-radius:4px 4px 0 0;">
  <h1 style="color:#ffffff; font-family:Arial, sans-serif; margin:0; font-size:22px; letter-spacing:0.5px;">
    Get REAL! Dashboard Update
  </h1>
  <p style="color:#ffc72c; font-family:Arial, sans-serif; margin:6px 0 0 0; font-size:13px; font-weight:bold; letter-spacing:1px;">
    MEMBERSHIP YEAR 2025–2026
  </p>
</div>
'

body_html <- glue('
<div style="background-color:#ffffff; padding:28px 32px; font-family:Arial, sans-serif; font-size:15px; color:#333333; line-height:1.6;">

  <p>I wanted to let you know that <strong>changes have been made to the dashboard</strong> </p>
  
  <p> News Page Added - New News page added to keep users informed of dashboard updates and changes. 

Value Box Style Update - Updated value box icons on the Girl Survey page: Pre Surveys and Post Surveys now use clipboard icons; Total Surveys replaced with Councils Reporting. - Added value boxes to the Session Summary page showing Total Session Records, Sites Reporting, and Councils Reporting. 

Attendance Page Added - New Attendance page now available in the dashboard navigation. - View total attendance records, sites reporting, and councils reporting at a glance. - Interactive table allows filtering by council; average absences by site included.
</p>
  
  <div style="border-top:3px solid #ffc72c; margin:24px 0;"></div>

  <p style="text-align:center;">
    <a href="{dashboard_url}"
       style="background-color:#004d23; color:#ffffff; padding:12px 28px; text-decoration:none;
              font-weight:bold; border-radius:4px; font-size:15px; display:inline-block;">
      📊 Access Dashboard
    </a>
  </p>

  <div style="border-top:3px solid #ffc72c; margin:24px 0;"></div>

  <p>If you have questions, or if there is anyone who should be added to this email list, please reach out and I will get that taken care of.</p>

  <p>Thank you,<br><strong>Kevin</strong></p>

</div>
')

footer_html <- '
<div style="background-color:#f4f4f4; padding:14px 32px; border-top:1px solid #dddddd;
            font-family:Arial, sans-serif; font-size:12px; color:#666666; text-align:center;">
  Get REAL! Reporting &nbsp;|&nbsp; MY: 2025–2026<br>
  Developed by Kevin Gilds, MPA
</div>
'

full_html <- paste0(header_html, body_html, footer_html)

email <- compose_email(body = md(full_html))

# Preview
html_out <- get_html_str(email)
writeLines(html_out, '/tmp/email_preview.html')

# Send — uncomment when ready
 email %>%
smtp_send(
from = "kevingilds@gmail",
to = getreal_email,
     subject = "Get REAL! Dashboard Updates — What's New",
     credentials = creds_file("gmail_creds")
   )

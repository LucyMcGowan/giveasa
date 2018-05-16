# GiveASA Application

This application uses Google Sheets as a backend. If you are editing this, please run the following _just once_ in order to create your Google token to push to the shiny servefr

```
shiny_token <- gs_auth() # authenticate w/ your desired Google identity here
saveRDS(shiny_token, "shiny_app_token.rds")
```

Be sure to put `shiny_app_token.rds` in your `.gitignore` file so that you do not commit it to GitHub.
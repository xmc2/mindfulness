# Mindfulness

Welcome to the mindfulness Shiny app, an Audio tracking web application powered by R/Shiny, and built by [Sarah Salter](https://github.com/sarahsalter) & Matt Cole.
 

Our application provides a convenient way for patients to access wellness audio files and provides use measurement for researchers. 

You may access the live site: https://jhubiostatistics.shinyapps.io/mindfulness/

# Get started

To get started, go ahead and clone the repository: `git clone https://github.com/mattkcole/mindfulness.git`


You will also need to obtain the media files from dropbox, (download [here](https://www.dropbox.com/sh/fbmgp84m8wohkev/AACOnzNsbsI1kNxT63L5m6Dya?dl=0)* and place all .mp3 and .gif files into the `~/www` sub directory).

Load shiny, `library('shiny')` and run the app with `runApp()`. 

You will be prompted to log in, and you may use the Username / Password combination "John" - "John" to log in as a User or the combination "Nattyboh" - "12345678" to log in as an Administrator. 

User activity will be logged [here](https://docs.google.com/spreadsheets/d/13WjhTKefPh821hn7Cr00rCyD3kXWwjRsjsYCqcjzDp8/edit?usp=sharing).

NOTE: Users do not need read or write access for data to be collected, as the data collection process is proxied through Google forms.

# Capabilities 

## *Login*

Log in capabilities are provided in order to
* Restrict access to only those intended to use the application
* Record who is using the application

## *Security*

Passwords are encrypted using the MD5 hash function and non-administrators will not be able to see the data being collected.  In addition to it being required that patient's have unique usernames, patients must also have unique passwords, which are case sensitive.  A login error will notify the user of this duplication issue, which will then be immediately fixed by one of the researchers in control of data management.  


## *Recording*

Activity on the site will be logged, including which audio files were interacted with, exactly when the files were accessed, and whom interacted them. This is done so in a way that protects data integrity through lack of data access permissions given to non-admin users (they have no access to the Google sheet).

## *Visualization*

The admin dashboard provides an overview of the activity occurring on the site. New ways are currently being brainstormed and implemented for a more programmatic way to download and display the data.  







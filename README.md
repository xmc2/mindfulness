# Mindfulness

Welcome to the mindfulness Shiny app, an Audio tracking web application powered by R/Shiny. 

Our application provides a convenient way for patients to access welness audiofiles and provides use measurement for researchers. 

# Get started

To get started, go ahead and clone the repository
You will also need to obtain the .MP3 and .GIF files from dropbox, (download here into the `~/www` sub directory)

load shiny, `library('shiny')` and run the app with `runApp()`

You will be prompted to log in,
You may use the Username / Password combination "John" - "John" to log in as a User or the combination 'Nattyboh' - '12345678' to log in as an administrator. 

# Capabilities 

## Login

Log in capabilities are provided in order to
* Resrtict access to only those intended to use the application
* Record who is using the application

## Security

Passwords are encrypted using the MD5 hash function and non-adnimistrators will not be able to see the data being collected.

## Recording

Activity on the site will be logged, including which audio files were interacted with, exactly when the files and whom interacted with the files.

## Visulization

The admin dashboard provides an overview of the activity occuring on the site.




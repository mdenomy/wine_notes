# Wine Notes
Wine Notes is an application to allow you to review wines and track wine purchase history.

It is also a convenient place for the author to improve his Rails skills.  

## Generating Sample Data
Run rake db:populate to generate a set of sample data.  
** Note this will blow away any existing data **

## Technical Details
This is a "breakable toy" application for improving my Rails skills and playing around with different technologies.

### Twitter Bootstrap
Twitter Bootstrap, which helped get things up and running quickly, but also suffers from looking like every other app running Twitter Bootstrap.

### Nested Resources
The app takes advantage of nested resources to provide a RESTful interface.  For example, reviews and purchases are nested under wines, so you end up with URLs like this:
/wines/2/reviews/new
/wines/4/purchases/index

There were some early challenges around routing and managing dependencies in tests, but after a while things start to make sense.


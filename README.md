## URL Shortener Application  
An appication, which gets an url string and (possibly) shortens it. Kinda mimics the functionality of 'bit.ly' service.
Requisites:
- Ruby version: 2.5.3  
- Rails version: 5.2.2.1  

Database creation:
- Create a file called 'application.yml', create key/value pairs with URL_SHORTENER_DATABASE_USERNAME and URL_SHORTENER_DATABASE_PASSWORD respectively.  
- `rails db:create`
- `rails db:migrate`
- Download a GeoLite2 Country MinMax DB from [here](https://dev.maxmind.com/geoip/geoip2/geolite2/#Downloads) and place it into `db` folder inside the project.
- `rails s`

Happy shortening!


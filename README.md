## URL Shortener Application  
An appication, which gets an url string and (possibly) shortens it. Kinda mimics the functionality of 'bit.ly' service.
Requisites:
- Ruby version: 2.5.3  
- Rails version: 5.2.2.1  

How to configure the project:
- `bundle install`
- `yarn install`
- Create a file called 'application.yml', with key/value pairs of URL_SHORTENER_DATABASE_USERNAME and URL_SHORTENER_DATABASE_PASSWORD inside.  
- `rails db:create`
- `rails db:migrate` (optionally - `rails db:seed`)
- Download a GeoLite2 Country MinMax DB from [here](https://dev.maxmind.com/geoip/geoip2/geolite2/#Downloads) and place it into `db` folder inside the project.
- `foreman start -f Procfile.dev`
- Navigate to [localhost:5000](http://localhost:5000) to start using the app.  

---
Server-side analysis of visits by country - `rake visits:analyze`

Happy shortening!


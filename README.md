# CrimeFinder

Enter a location and get a list of UK crimes that happened in or around that area. Makes use of the https://data.police.uk/ API.

### Notes
- Crimes seem to take around 3 months to make it on to the system.
- Classes used are `lib/crime.rb` and `lib/crime_finder.rb`.

### Todo
- As a user, when I perform a successful search followed by a search for a location that doesn't exist I'll still see the results for the successful search. If the location is not valid then you should see an error or have the latitude and longitude cleared.
- There should be a way to handle 429 response codes (too many requests).
- There should be a way to handle the response given if there are too many crimes (ie the search area was too large).
- As a user, I'd rather not see "no crimes found" before I've performed a search.
- There should be a way to validate the country so that a "UK only" message is shown if the user searches for locations in another country.
- As a user, I want a way to set a date so I can search for crimes further in the past.
- As a user, I want a way to filter crimes by category.
- As a developer, I'd rather not have all the `Rendered pages/_crime.html.slim` lines cluttering up the logs.

Description: Account creation

Lifecycle:
Examples:
/tables/imdb.table

Scenario: Open imdb.com main page
Meta:
   @testImdb
Given I am on the main application page

Scenario: Create user account
Meta:
   @testImdb
When I create IMDb account and enter '<name>', '<email>', '<password>' and re-enter '<password>'
Then a new account exists

Scenario: Perform search for movie by search box
Meta:
   @testImdb
When I perform search for movie by search box
Then the list of movies exists

Scenario: Open page for one of the found products
Meta:
   @testImdb
When I click on a link of a found movie
Then the page with movie description opens

Scenario: Add movie to Watchlist
Meta:
   @testImdb
When I add a chosen movie to Watchlist
Then the movie is added

Scenario: Navigate to 'Your Watchlist'
Meta:
   @testImdb
When I navigate to Watchlist
Then the list of saved movies exists

Scenario: Sort list from Your Watchlist and export it
Meta:
   @testImdb
When I sort the list of movies in Watchlist
Then the moves are sorted
When I export the list of movies in a file
!-- Some Then step to complete the story?
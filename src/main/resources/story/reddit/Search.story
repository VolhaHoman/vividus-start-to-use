Description: Perform search by top search bar

Scenario: Open reddit.com main page
Meta:
   @testReddit
Given I am on the main application page

Scenario: Post search
Meta:
   @testReddit
When I refresh the page
When I change context to an element by the xpath '//input[@id='header-search-bar']'
When I enter '<searchItem>' in a field by the xpath '//input[@id='header-search-bar']'
!-- change context to the field
When I set focus to the context element
When I press ENTER on keyboard
When I wait until the page title contains the text '<searchItem>'
Then the page title contains the text '<searchItem>'
Examples:
|searchItem                    |
|#{generate(HarryPotter.book)} |

Scenario: Open post page from search result page
Meta:
   @testReddit
When I select a random post
Then the text 'This thread is archived' exists
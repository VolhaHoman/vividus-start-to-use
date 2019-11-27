Description: Product search

Scenario: Open walmart.com main page
Meta:
   @test
Given I am on the main application page

Scenario: Perform product search
Meta:
   @test
When I change context to an element by the xpath '//form[@id='global-search-form']'
!-- When I select '<departmentStore>' from a drop down by the xpath '//button[@id='global-search-dropdown-toggle']' (not a dropdown but a button)
When I enter '<toyName>' in a field by the xpath '//input[contains(@class,'GlobalSearch-input')]'
When I click on an element by the xpath '//button[@id='global-search-submit']'
Then an element by the xpath '//a[@id='povActive']' exists
Examples:
|toyName      |departmentStore|
|LEGO         |Toys           |

Scenario: Open product page for product from Search results
Meta:
   @test
!-- Composite: When I select a random product
When I click on an element by the xpath '(//a[contains(@class,'product-title-link')])[#{randomInt(1, 20)}]'
Then an element by the xpath '//h1[@class='prod-ProductTitle font-normal']' exists

Scenario: Add product to cart
Meta:
   @test
When I change context to an element by the xpath '//div[contains(@class,'display-inline-block prod-product')]'
When I click on an element by the xpath '//button[contains(@class,'prod-ProductCTA')]'
When I change context to the page
Then the text 'You just added 1 item' exists

Scenario: Navigate to cart
Meta:
   @test
When I change context to an element by the xpath '//div[@class='PAC-pos']'
When I click on an element by the xpath '//button[contains(@class,'button capitalize')]'
Then the text 'Your cart:' exists
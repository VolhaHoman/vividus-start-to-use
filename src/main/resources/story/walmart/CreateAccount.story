Description: Account creation

Scenario: Open walmart.com main page
Meta:
   @testWalmart
Given I am on the main application page

Scenario: Create user account
Meta:
   @testWalmart
When I click on element located `By.id(header-account-toggle)`
When I change context to the page
When I click on element located `By.xpath(//div[text()='Create Account'])`
Then the text 'Create your Walmart account' exists

Scenario: Validation of mandatory fields on sign-up form
Meta:
   @testWalmart
   @skip
When I change context to an element by the xpath '//div[@id='sign-in-widget']'
When I click on a button with the name 'Create Account'
When I ${visualTestingAction} baseline with name '${UnauthUserBaseline}'

Scenario: Fill in the registration form
Meta:
   @testWalmart
When I enter '<firstName>' in a field by the xpath '//input[@id='first-name-su']'
When I enter '<lastName>' in a field by the xpath '//input[@id='last-name-su']'
When I enter '<email>' in a field by the xpath '//input[@id='email-su']'
When I enter '<password>' in a field by the xpath '//input[@id='password-su']'
When I click on a button with the name 'Create Account'
When I find >= `0` elements by `By.xpath(//div[@class='captcha re-captcha']) and for each element do
|step                                                                               |
|When I change context to an element by the xpath '//div[@id='rc-anchor-container']'|
|When I check a checkbox                                                            |
!-- CAPTCHA
When I change context to the page
Then the text 'Your Account' exists
Examples:
|firstName                  |lastName                  |email                             |password                      |
|#{generate(Name.firstName)}|#{generate(Name.lastName)}|#{generate(Internet.emailAddress)}|#{generate(Internet.password)}|

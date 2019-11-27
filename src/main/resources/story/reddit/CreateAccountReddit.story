Description: Account creation

Scenario: Open reddit.com main page
Meta:
   @test
Given I am on the main application page

Scenario: Create user account
Meta:
   @test
When I refresh the page
!-- When I decline an action in an alert with the message 'www.reddit.com wants to Show notifications'
When I click on element located `By.xpath(//a[text()='sign up'])`
When I switch to a frame by the xpath '//iframe[contains(@src,'actionSource')]'
When I change context to an element by the xpath '//div[@class='Container']'
When I enter '<email>' in a field by the xpath '//input[@id='regEmail']'
When I click on a button with the name 'Next'
When I select a random username
When I change context to an element by the xpath '//div[contains(@class,'usernameStep')]'
When I enter '<password>' in a field by the xpath '//input[@id='regPassword']'
When I switch to a frame by the xpath '//iframe[contains(@name,'a-')]'
When I check a checkbox by the xpath '//div[@class='recaptcha-checkbox-border']'
!-- re-CAPTCHA for humans
When I click on a button with the name 'Sign Up'
!-- When I click on an element by the xpath '//button[contains(@class,'SignupButton')]'
Then the text 'Find communities by topics you're interested in.' exists
When I click on a button with the name 'Finish'
!-- When I click on an element by the xpath '//button[contains(@class,'SubscribeButton')]'
When I refresh the page
Then an image with the src 'https://www.redditstatic.com/avatars/avatar_default_20_FF4500.png' exists
Examples:
|email                             |userName                   |password                      |
|#{generate(Internet.emailAddress)}|#{generate(Name.fullName)} |#{generate(Internet.password)}|

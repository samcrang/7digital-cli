Feature: init
  Scenario:
    Given the file "~/.7d" does not exist
    When I run `7d init` interactively
    And I type "YOUR_KEY_HERE"
    And I type "YOUR_SECRET_HERE"
    And I type "some_token"
    And I type "some_token_secret"
    Then the exit status should be 0
    And the file "~/.7d" should contain:
      """
      ---
      consumer_key: YOUR_KEY_HERE
      consumer_secret: YOUR_SECRET_HERE
      token: some_token
      token_secret: some_token_secret
      """

  Scenario:
    Given a file named "~/.7d" with:
      """
      ---
      consumer_key: YOUR_KEY_HERE
      consumer_secret: YOUR_SECRET_HERE
      token: some_token
      token_secret: some_token_secret
      """
    When I run `7d init`
    Then the exit status should be 1

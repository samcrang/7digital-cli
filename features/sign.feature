Feature: sign
  Scenario: Generating a signed track/details URI
    When I run `7d sign track/details --trackid=1234`
    Then the exit status should be 0
    And the output should contain "https://api.7digital.com/1.2/track/details"

  Scenario: Generating a signed release/details URI
    When I run `7d sign release/details --releaseid=12345`
    Then the exit status should be 0
    And the output should contain "https://api.7digital.com/1.2/release/details"

  Scenario: Generating a signed clip URI
    When I run `7d sign clip --trackid=1234`
    Then the exit status should be 0
    And the output should contain "https://previews.7digital.com/clip"

  Scenario: Generating a signed stream/catalogue URI
    When I run `7d sign stream/catalogue --trackid=1234`
    Then the exit status should be 0
    And the output should contain "https://stream.svc.7digital.net/stream/catalogue"

  Scenario: Generating a signed stream/catalogue URI
    When I run `7d sign stream/subscription --trackid=1234`
    Then the exit status should be 0
    And the output should contain "https://stream.svc.7digital.net/stream/subscription"

Feature: help
  Scenario: Not providing a subcommand
    When I run `7d`
    Then the exit status should be 1
    And the output should contain:
      """
      Subcommands:
        init
        sign
        """

  Scenario: Asking the main command for help
    When I run `7d --help`
    Then the exit status should be 1
    And the output should contain:
      """
      Subcommands:
        init
        sign
      """

  Scenario: Not providing an endpoint to sign
    When I run `7d sign`
    Then the exit status should be 1
    And the output should contain:
      """
      Endpoints:
        clip
        track/details
      """

  Scenario: Asking the sign subcommand for help
    When I run `7d sign --help`
    Then the exit status should be 1
    And the output should contain:
      """
      Endpoints:
        clip
        track/details
      """

  Scenario: Using an unrecognized subcommand
    When I run `7d unknown`
    Then the exit status should be 1
    And the output should contain:
      """
      Subcommands:
        init
        sign
      """

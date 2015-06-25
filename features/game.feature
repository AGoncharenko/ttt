Feature: Game testing

  @javascript
  Scenario: Two players join the game and making moves
    Given I'm in "Andrew"'s browser
    And I visit home page
    When I click on "New Game" link
    Then I enter "Andrew" into Modal
    And I'm in "Rudi"'s browser
    And I visit game page
    Then I enter "Rudi" into Modal
    When I'm in "Andrew"'s browser
    And I click "cell_0" cell on gameboard
    When I'm in "Rudi"'s browser
    And I click "cell_1" cell on gameboard
    When I'm in "Andrew"'s browser
    And I click "cell_8" cell on gameboard
    When I'm in "Rudi"'s browser
    And I click "cell_4" cell on gameboard
    When I'm in "Andrew"'s browser
    And I click "cell_3" cell on gameboard
    When I'm in "Rudi"'s browser
    And I click "cell_7" cell on gameboard
    Then I should see game result on home page
    When I'm in "Andrew"'s browser
    Then I should see game result on home page
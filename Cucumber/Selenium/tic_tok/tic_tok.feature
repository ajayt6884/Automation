Feature: Tic_tac_toe
Scenario: Play tic_tac_toe game
Given a board like this:
|   | 1 | 2 | 3 |
| 1 |   |   |   |
| 2 |   |   |   |
| 3 |   |   |   |
When player x plays in row 2, column 1
Then the board should be look like this:
|   | 1 | 2 | 3 |
| 1 |   |   |   |
| 2 | x |   |   |
| 3 |   |   |   |

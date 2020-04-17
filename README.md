# Playcard Game :diamonds: :hearts: Red or Black :clubs: :spades: ? - Flutter

* Flutter v 1.12.13
* Dart v 2.7.1


## Game Rules
**Goal of the game ** : to guess, in turns, the next card that will be picked from the deck. 
### What you need
* Between 1 and 8 players
* One deck of 52 cards
* Something to drink 

### Proceedings
* The game is played in **4 rounds**.
* In each round, if the player's prediction is right, the player gives N sips to another player.
If the player was wrong, he drinks N sips himself.
* N is depending on the round.

#### 1) 1st Round - Red or Black
* **Bet** : 1 sip
* **Guessing rule** : Each player, before picking a card, says if the color of the card would be Red (hearts and diamonds) or Black (spades and clumbs).


#### 2) 2nd Round - Higher or Lower
* **Bet** : 2 sips
* **Guessing rule** : Each player, before picking a card, says if the value of the card would be Higher or Lower than the card he picked in the previous round.


#### 3) 3rd Round - Between or External
* **Bet** : 3 sips
* **Guessing rule** : Each player, before picking a card, says if the value of the card would be Between or Outside the interval made by the 2 previous cards picked.


#### 4) 4rd Round - Hearts, Diamons, Clubs or Spades
* **Bet** : 4 sips
* **Guessing rule** : Each player, before picking a card, says if the color of the card would be Hearts, Diamonds, Clubs or Spades.

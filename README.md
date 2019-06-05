# MKS22X-FinalProject

### **Project Description**
##### Bubble Bobble is a multi-level game, where the objective of the player is to defeat all monsters on screen in order to progress to the next level. The player first blows a bubble at a monster to capture it. Then, it must pop the bubble in order to kill the monster. When a monster is killed, it becomes a food item, which the player can grab to increase their score. The player has a total of 3 lives. If the player touches a monster, a life is lost. If all three lives are lost, the game goes all the way back to the beginning.
---

### **Directions**
1. Clone this repo
```
git clone git@github.com:cwu155/MKS22X-FinalProject.git
```
2. Open the Sketch folder in Processing.
3. Run.
---

### **Bugs**
- Jump
- Bubbles *should* disappear when it hits an enemy.
- Player can shoot bubble beams

---

### **Development Log**
#### 5/20/19
- T: Uploaded images of Bub, enemies and items
- T: Displayed Bub and level 1 map
- C: Made testing folder, started to test Bub's movement

#### 5/21/19
- T: Made Bub move, but doesn't move when key is pressed
- C: Made Bub move left, right in Testing folder

#### 5/22/19
- T: Separated classes into tabs
- T: Added interfaces to keep track of displayable, moveable, and collideable objects
- C: Added accessor methods for Player, made Bub jump
- C: Deleted and merged folders/files

#### 5/23/19
- C: Added a Platform class in Testing

#### 5/24/19
- T: Added bounds so that Bub can't walk offscreen
- T: Tried to fix up movement
- C: Made Bub stop when he lands onto a platform

#### 5/25/19
- C: Tried to make Bub jump more smoothly

#### 5/26/19
- T: Added bounds so Bub can't jump above the map
- T: Added bounds so that Bub can't blow bubbles past the left/right bounds of map
- C: Fixed Bub's jump, made sprite change directions when facing left or right
- C: Added to Bubble class so Bub blows bubbles

#### 5/27/19
- T: Added display for enemies
- T: Set up item pictures according to point worth
- C: Made bubbles move in both directions, merged Testing code into main code

#### 5/28/19
- T: Made enemy turn into food item when hit by a bubbles
- T: Added method to check if bubble touches enemy
- T: Added counter for time, but it gets progressively slower. Probably because of frame rate?
- C: Added enemy display into Testing, worked on movement

#### 5/29/19
- T: Changed bubble blowing to spacebar
- T: Made enemy disappear when hit with bubble, also turns into food item
- T: Made item disappear when hit with player

#### 5/30/19
- T: Added random food item after hitting enemy with bubble
- T: Added game end (when no enemies + no bubbles, since only 1 level right now)

#### 5/31/19
- T: Added health bars

#### 6/1/19

#### 6/2/19
- T: Added win/lose messages

#### 6/3/19
- T: Fixed bubble movement (restricted to inside map)

#### 6/4/19
- T: Fixed bubble movement (again)
- T: Fixed player movement (cannot hug the wall)
- T: Bubbles + player cannot move after losing (could still win if they moved)
- T: Added levels!

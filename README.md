# Fire Emblem Battle Simulation
**Current version is v2** \
This version simply has working automated battles.

**Instructions listed are found in comments of Fire_Emblem_Simulation_v2.pde**

**WELCOME TO FIRE EMBLEM SIMULATOR**\
  The goal of this program is to give a (basic) simulation of a battle in a Fire Emblem game\
  The program makes use of two types of classes: Warrior and Weapon\
  The program also makes use of an important battle function! (which comes in two varients: text only or text+animation)
  
**TO BEGIN, LET'S MAKE A WARRIOR CLASS**\
  There are 4 types of warriors: "Swordsman", "Lancer", "Axesman", and "Archer"\
  Here is some basic info about each type of warrior\
  **Swordsman:** Effective against Axesman and Archers. Can only hold swords\
  **Lancer:** Effective against Swordsman. Can only hold lances\
  **Axesman:** Effective against Lancer. Can only hold axes\
  **Archer:** Effect against Lancer. Can only hold bows\
  To create a new warrior, please give the following pieces of data: Name, Level, Warrior Type\
  **PLEASE STATE WARRIOR TYPE EXACTLY AS WRITTEN PRIOR (First letter capitalized). IF NOT, THE PROGRAM WILL NOT RECOGINIZE THE WARRIOR TYPE**\
*Example: Warrior swordGuy = new Warrior ("Sword Guy", 1, "Swordsman");*
  
**NEXT, LET'S MAKE A WEAPON FOR EACH WARRIOR**\
  There are 4 types of weapons: "Sword", "Lance", "Axe", "Bow"\
  To create a new weapon, please give the following pieces of data: Name, Attack Bonus, Weapon Type\
  **PLEASE STATE WEAPON TYPE EXACTLY AS WRITTEN PRIOR (First letter capitalized). IF NOT, THE PROGRAM WILL NOT RECOGINIZE THE WEAPON TYPE**\
 *Example: Weapon sword = new Weapon ("Swordy McSword Face", 1, "Sword");*
 
 **NOW, LET'S GIVE EACH WARRIOR A WEAPON**\
 **Remember! Each warrior type can only wield their class's weapon!**\
 *Example: swordGuy.giveWeapon(sword);*
 

 **ALRIGHT! TIME TO NOW SHOW THE STATS OF EACH WARRIOR!**\
 ***(If you want to specify specific stats, you can always manually edit the stats! Eg. swordGuy.potions = 500)***\
 *Example: swordGuy.statsRead();*
 
**NOW FOR THE MAIN PART OF THE PROGRAM! THE BATTLES!**\
There are two main ways to start a battle!
* First method is doing a text battle. This method only displays a text log/play-by-play of the battle
* Second method is doing a animation battle. This method displays both a text log/play-by-play of the battle AND a fully animated version of the battle!

***NOTE: ANIMATION BATTLES CAN ONLY BE CALLED ONCE DURING THE RUN OF A PROGRAM***\
**To run a text only battle, use the battle(a,b) function (Where 'a' is Warrior 1 and 'b' is Warrior 2)**\
*Example:battle(swordGuy,bowGuy);*
 **To run an animation battle, use the battleDraw(a,b) function (Where 'a' is Warrior 1 and 'b' is Warrior 2)**\
 *Example:battleDraw(swordGuy,bowGuy);*
 
**NOW YOU KNOW THE BASICS OF THE PROGRAM! FEEL FREE TO COMMENT OUT THIS TUTORIAL PORTION AND USE THIS PROGRAM HOW EVER YOU WOULD LIKE!\
THANKS FOR PLAYING!\
-Chetan**
 

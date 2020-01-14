//DO NOT TOUCH, IMPORTANT VALUESvvvv
PImage BattleLeft1; //Creates empty PImages that will be used for Warrior 1 in the animation
PImage BattleLeft2;
PImage BattleLeft3;
int LeftX = 50; // Sets the base X and Y values for Warrior 1 in the animation 
int LeftY = 150;
PImage BattleRight1; //Creates empty PImages that will be used for Warrior 2 in the animation
PImage BattleRight2;
PImage BattleRight3;
int RightX = 350; // Sets the base X and Y values for Warrior 2 in the animation 
int RightY = 150;
int SpriteResize = 200; //This is a universal value that determines the size of the warriors in the animation (simply resizes the base sprites given)
PImage Background; // Creates an empty PImage for the background image for the animation
PFont font; // Creates a blank font type
Warrior Warrior1; //Creates a blank value for warrior 1 which will be filled later when doing the animation
Warrior Warrior2; //Creates a blank value for warrior 1 which will be filled later when doing the animation
//DO NOT TOUCH, IMPORTANT VALUES^^^^

void setup(){
  //DO NOT TOUCH, IMPORTANT VALUESvvvv
  size(600,400); //Sets the screen size for the animation (NOTE: 600x400 IS RECOMENDED SIZE. CHANGING SCREEN SIZE WILL RUIN THE ANIMATION)
  background(0,0,0); //Sets the background to black (This will be overwritten later with an actual image IF the user runs a drawn battle. I simply made it black just because I think it looks better than the default gray)
  font = createFont("OCRAStd",28); //Creates a font which will be used in the animation (personally I this OCRAStd fits better with the theme but if you don't like it, you can simply change it)
  textFont(font); //This sets the main font used in the program to be 'font' (aka the font I legit just made right above this line)
  //DO NOT TOUCH, IMPORTANT VALUES^^^^
  
  
  //WELCOME TO FIRE EMBLEM SIMULATOR
  //The goal of this program is to give a (basic) simulation of a battle in a Fire Emblem game
  //The program makes use of two types of classes: Warrior and Weapon
  //The program also makes use of an important battle function! (which comes in two varients: text only or text+animation)
  
  //TO BEGIN, LET'S MAKE A WARRIOR CLASS
  //There are 4 types of warriors: "Swordsman", "Lancer", "Axesman", and "Archer"
  //Here is some basic info about each type of warrior
  //Swordsman: Effective against Axesman and Archers. Can only hold swords
  //Lancer: Effective against Swordsman. Can only hold lances
  //Axesman: Effective against Lancer. Can only hold axes
  //Archer: Effect against Lancer. Can only hold bows
  //To create a new warrior, please give the following pieces of data: Name, Level, Warrior Type///////////////////////////////////////////
  //PLEASE STATE WARRIOR TYPE EXACTLY AS WRITTEN PRIOR (First letter capitalized). IF NOT, THE PROGRAM WILL NOT RECOGINIZE THE WARRIOR TYPE
  //Let's create a new warrior for each warrior type!
  Warrior swordGuy = new Warrior ("Sword Guy", 1, "Swordsman");
  Warrior lanceGuy = new Warrior ("Lance Guy", 5, "Lancer");
  Warrior axeGuy = new Warrior ("Sword Guy", 4, "Axesman");
  Warrior bowGuy = new Warrior ("Sword Guy", 3, "Archer");
  
  //NEXT, LET'S MAKE A WEAPON FOR EACH WARRIOR
  //There are 4 types of weapons: "Sword", "Lance", "Axe", "Bow"
  //To create a new weapon, please give the following pieces of data: Name, Attack Bonus, Weapon Type///////////////////////////////////////////
  //PLEASE STATE WEAPON TYPE EXACTLY AS WRITTEN PRIOR (First letter capitalized). IF NOT, THE PROGRAM WILL NOT RECOGINIZE THE WEAPON TYPE
  //Let's now create a weapon for each weapon type!
  Weapon sword = new Weapon ("Swordy McSword Face", 1, "Sword");
  Weapon lance = new Weapon ("Pokie Lance Thing", 3, "Lance");
  Weapon axe = new Weapon ("Tree Cutter 5000", 2, "Axe");
  Weapon bow = new Weapon ("Stick with String", 1, "Bow");
  
  //NOW, LET'S GIVE EACH WARRIOR A WEAPON
  //Remember! Each warrior type can only wield their class's weapon!
  swordGuy.giveWeapon(sword);
  lanceGuy.giveWeapon(lance);
  axeGuy.giveWeapon(axe);
  bowGuy.giveWeapon(bow);
  
  
  //ALRIGHT! TIME TO NOW SHOW THE STATS OF EACH WARRIOR!
  swordGuy.statsRead();
  lanceGuy.statsRead();
  axeGuy.statsRead();
  bowGuy.statsRead();
  //(If you want to specify specific stats, you can always manually edit the stats! Eg. swordGuy.potions = 500)
  
  
  //NOW FOR THE MAIN PART OF THE PROGRAM! THE BATTLES!
  //There are two main ways to start a battle!
  //First method is doing a text battle. This method only displays a text log/play-by-play of the battle
  //Second method is doing a animation battle. This method displays both a text log/play-by-play of the battle AND a fully animated version of the battle! 
  //NOTE: ANIMATION BATTLES CAN ONLY BE CALLED ONCE DURING THE RUN OF A PROGRAM
  //To run a text only battle, use the battle(a,b) function (Where 'a' is Warrior 1 and 'b' is Warrior 2)
  //To run an animation battle, use the battleDraw(a,b) function (Where 'a' is Warrior 1 and 'b' is Warrior 2)
  //Here's an example of an animation battle!
  battleDraw(swordGuy,bowGuy);
  
  
  //NOW YOU KNOW THE BASICS OF THE PROGRAM! FEEL FREE TO COMMENT OUT THIS TUTORIAL PORTION AND USE THIS PROGRAM HOW EVER YOU WOULD LIKE!
  //THANKS FOR PLAYING!
  //-Chetan
  
  
}

void draw(){ 
  if (Warrior1 != null && Warrior2 != null && Background != null && Warrior1 != Warrior2){ //Run the following code IF the sprites (listed at the start of the program) are assigned an image (aka battleDraw was executed)
    background(Background); //Replaced the background to the background sprite assigned during battleDraw
    int W1HealthBack = Warrior1.health; //Creates a backup of the Warrior 1's health so that the damage taken can be calculated (near the end of the draw function)
    int W2HealthBack = Warrior2.health; //Creates a backup of the Warrior 2's health so that the damage taken can be calculated (near the end of the draw function)
    if (Warrior1.health >0 && Warrior2.health > 0){ //If either of the warrrior's health are above zero, run the following code
      
      if ( Warrior2.level > Warrior1.level ){ //If Warrior 2 has a higher level than Warrior 1, they get the first move
          Warrior2.Attack(Warrior1); //Warrior 2 attacks Warrior 1
          if (Warrior1.health > 0){ //If Warrior 1 is still alive after the attack, run this code
            Warrior1.Attack(Warrior2); //Warrior 1 attacks Warrior 2
          }
          
        }
        
      else if ( Warrior2.level < Warrior1.level || Warrior2.level == Warrior1.level){ //If Warrior 1 has a higher level than Warrior 2 OR if Warrior 1 has the SAME level as Warrior 2, they get the first move (THIS MEANS WARRIOR 1 HAS PORT PRIORITY IN BATTLE)
          Warrior1.Attack(Warrior2); //Warrior 1 attacks Warrior 2
          if (Warrior2.health > 0){ //If Warrior 2 is still alive after the attack, run this code
            Warrior2.Attack(Warrior1); //Warrior 2 attakcs Warrior 1
          }
        }
        
      if (frameCount % 2 == 0){ //For every second frame, run this code
        image(BattleRight3,RightX,RightY); //Warrior 2 displays their attack sprite
        image(BattleLeft1,LeftX,LeftY); //Warrior 1 displays their standing sprite
        fill(255,0,0); //Set text colour to red
        text((Warrior1.health - W1HealthBack), 90, height-200); //Displayed the damage taken by Warrior 1
      
      }
      
      else{ //For every other frame, run this code
        image(BattleRight1,RightX,RightY); //Warrior 2 displays their standing sprite
        image(BattleLeft3,LeftX,LeftY); //Warrior 1 displays their attack sprite
        fill(255,0,0); //Set text colour to red
        text( (Warrior2.health - W2HealthBack), width- 120, height-200); //Displayed the damage taken by Warrior 2
      
      }
      
      fill(255,255,255); //Sets text colour to white
      text(Warrior1.health +"/"+Warrior1.healthMax, 50,50); //Shows Warrior 1's current health in relation to their max health
      text(Warrior2.health +"/"+Warrior2.healthMax, 450,50); //Shows Warrior 2's current health in relation to their max health
      
      
      
      delay(500); //Add a delay in the animation to make it look cleaner on the eyes
     }
     else{
       delay(3000); //At the end of the battle, the program shows the aftermath for 3 seconds before removing the warriors
     }
     
   }
}



void battle(Warrior a, Warrior b){ //This battle function only displays text (used if the user does not want to run an animation)
  while (a.health >0 && b.health > 0){ //If either of the warrrior's health are above zero, run the following code
    if ( b.level > a.level ){ //If Warrior 2 has a higher level than Warrior 1, they get the first move
        b.Attack(a); //Warrior 2 attacks Warrior 1
        delay(500); //Delay of 500 to make the text easier to read as it flows
        if (a.health > 0){ //If Warrior 1 is still alive after the attack, run this code
          a.Attack(b); //Warrior 1 attacks Warrior 2
          delay(500); //Delay of 500 to make the text easier to read as it flows
        }
        
      }
      
    else if ( b.level < a.level || b.level == a.level){ //If Warrior 1 has a higher level than Warrior 2 OR if Warrior 1 has the SAME level as Warrior 2, they get the first move (THIS MEANS WARRIOR 1 HAS PORT PRIORITY IN BATTLE)
        a.Attack(b); //Warrior 1 attacks Warrior 2
        delay(500); //Delay of 500 to make the text easier to read as it flows
        if (b.health > 0){ //If Warrior 2 is still alive after the attack, run this code
          b.Attack(a); //Warrior 2 attacks Warrior 1
          delay(500); //Delay of 500 to make the text easier to read as it flows
        }
      }
  }
}


  
void battleDraw(Warrior a, Warrior b){ //This battle function displays both text AND the animation
  loadSprites(a,b); //Loads the correct sprites for Warrior 1 and 2
  Warrior1 = a; //Sets Warrior 1 to the given first warrior
  Warrior2 = b; //Sets Warrior 2 to the given second warrior
}

void loadSprites(Warrior a, Warrior b){ //Loads sprites based on two given warriors DONT USE THIS COMMAND ALONE, USE 'battleDraw' TO RUN THIS FUNCTION
  int backgroundNumb = int(random(0,62)); //There are 62 possible backgrounds (0-61), this simply picks a random background
  Background = loadImage("fe12bg/fe12bg"+str(backgroundNumb)+".png"); //Loads the image file for the background number (Major shoutout to whomever made this background pack to download, for having an easily/simple naming covention)
  Background.resize(width,height); //Resizes the background image to fill the screen size (background cannont be used otherwise)
  
  
  if (a.warriorType == "Archer"){ //If Warrior 1 is an archer, load the correct sprites and resize sprites accordingly
    BattleLeft1 =  loadImage("BowLeft1.png");
    BattleLeft1.resize(SpriteResize,0);
    BattleLeft2 =  loadImage("BowLeft2.png");
    BattleLeft2.resize(SpriteResize,0);
    BattleLeft3 =  loadImage("BowLeft3.png");
    BattleLeft3.resize(SpriteResize,0);
    
  }
  
  else if (a.warriorType == "Swordsman"){ //If Warrior 1 is a swordsman, load the correct sprites and resize sprites accordingly
    BattleLeft1 =  loadImage("SwordLeft1.png");
    BattleLeft1.resize(SpriteResize,0);
    BattleLeft2 =  loadImage("SwordLeft2.png");
    BattleLeft2.resize(SpriteResize,0);
    BattleLeft3 =  loadImage("SwordLeft3.png");
    BattleLeft3.resize(SpriteResize,0);
    
  }
  
  else if (a.warriorType == "Lancer"){ //If Warrior 1 is a lancer, load the correct sprites, resize sprites accordingly, and reshift the sprite location to reallign
    BattleLeft1 =  loadImage("LanceLeft1.png");
    BattleLeft1.resize(SpriteResize,0);
    BattleLeft2 =  loadImage("LanceLeft2.png");
    BattleLeft2.resize(SpriteResize,0);
    BattleLeft3 =  loadImage("LanceLeft3.png");
    BattleLeft3.resize(SpriteResize,0);
    LeftY += 90;
    
    
  }
  
  else if (a.warriorType == "Axesman"){ //If Warrior 1 is an axesman, load the correct sprites, resize sprites accordingly, and reshift the sprite location to reallign
    BattleLeft1 =  loadImage("AxeLeft1.png");
    BattleLeft1.resize(SpriteResize,0);
    BattleLeft2 =  loadImage("AxeLeft2.png");
    BattleLeft2.resize(SpriteResize,0);
    BattleLeft3 =  loadImage("AxeLeft3.png");
    BattleLeft3.resize(SpriteResize,0);
    LeftY += 40;
    
  }
  
  
  if (b.warriorType == "Archer"){ //If Warrior 2 is an archer, load the correct sprites and resize sprites accordingly
    BattleRight1 =  loadImage("BowRight1.png");
    BattleRight1.resize(SpriteResize,0);
    BattleRight2 =  loadImage("BowRight2.png");
    BattleRight2.resize(SpriteResize,0);
    BattleRight3 =  loadImage("BowRight3.png");
    BattleRight3.resize(SpriteResize,0);
    
  }
  
  else if (b.warriorType == "Swordsman"){ //If Warrior 2 is a swordsman, load the correct sprites and resize sprites accordingly
    BattleRight1 =  loadImage("SwordRight1.png");
    BattleRight1.resize(SpriteResize,0);
    BattleRight2 =  loadImage("SwordRight2.png");
    BattleRight2.resize(SpriteResize,0);
    BattleRight3 =  loadImage("SwordRight3.png");
    BattleRight3.resize(SpriteResize,0);
    
  }
  
  else if (b.warriorType == "Lancer"){ //If Warrior 2 is a lancer, load the correct sprites, resize sprites accordingly, and reshift the sprite location to reallign
    BattleRight1 =  loadImage("LanceRight1.png");
    BattleRight1.resize(SpriteResize,0);
    BattleRight2 =  loadImage("LanceRight2.png");
    BattleRight2.resize(SpriteResize,0);
    BattleRight3 =  loadImage("LanceRight3.png");
    BattleRight3.resize(SpriteResize,0);
    RightY += 90;
    
  }
  
  else if (b.warriorType == "Axesman"){ //If Warrior 2 is an axesman, load the correct sprites, resize sprites accordingly, and reshift the sprite location to reallign
    BattleRight1 =  loadImage("AxeRight1.png");
    BattleRight1.resize(SpriteResize,0);
    BattleRight2 =  loadImage("AxeRight2.png");
    BattleRight2.resize(SpriteResize,0);
    BattleRight3 =  loadImage("AxeRight3.png");
    BattleRight3.resize(SpriteResize,0);
    RightY += 40;
    
  }
  
  
}

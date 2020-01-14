class Warrior {
  String name;
  int level;
  String warriorType; //Archer, Swordsman, Axesman, Lancer
  int health;
  int healthMax;
  int potions;
  Weapon weaponHolding;
  int xpNeeded;
  int xpCount;
  boolean hasWeapon;
  int attackPower;
  int defencePower;
  
  
  Warrior (String n, int l, String wt){
    name = n;
    level = l;
    if (wt == "Archer" || wt == "Swordsman" || wt == "Axesman" || wt == "Lancer"){ //Makes sure the warrior type given is a valid warrior type
      this.warriorType = wt;
    }
    else{
      this.warriorType = "Invalid"; //If the warrior type given is not valid, simply give the warrior type of 'Invalid'
    }
    
    this.health = 100 + (2*this.level) ; //Sets the warriors health based on their current level
    this.healthMax = this.health; //Takes note of the warriors max health (as this.health will be constantly changing);
    this.potions = int(random(0,4)); //Give the warrior a random amount of potions between 0-3
    this.xpNeeded = (7*this.level); //Takes note of the xp needed for the warrior to reach their next level
    
    this.attackPower = (int(random(1, (2+ ( 1* (this.level / 6 )))))) + ( (this.level * 5)/4 ) ; //Sets the attack power of the warrior. The heigher the level, the heigher the attack power (also a random element in there so not every warrior is the same)
    this.defencePower = (int(random(1, (2+ ( 1* (this.level / 8 )))))) + ( (this.level *3 ) /4 ); //Sets the defence power of the warrior. The heigher the level, the heigher the defence power (also a random element in there so not every warrior is the same)
    
    this.xpCount = 0; //Gives the warrior 0 xp to start off with
    this.hasWeapon = false; //The warrior has no weapon to start off with
    
    
  }
  
  void Attack (Warrior e){ //Attack command of a warrior
    if (e.health > 0 ){ //If the warrior that is being attacked ISN'T at 0 HP, run this code
      boolean effectiveAttack = false; // effective attack is set to false at first (may change to true if attack is effective against the  enemy)
      int attackDamage = 0; //Attack damage is given a value of 0 to start with
      
      if (this.hasWeapon == true){ //If the warrior that is attacking has a weapon, run this code
        attackDamage = (this.attackPower - e.defencePower); //The damage given to the enemy starts with the attackers attack power subtract the enemy's defence power (Same formula that is used in the Fire Emblem games)
        
        //The next following set of if-statements simply checks if the attack is effective or not against the enemy
        //Effectivness is based on the Fire Emblem weapon triangle
        //If effective, the attacker gains a +2 attack bonus
        //If not effective, the attacker's attack damage is reduced by two
        
        if ( this.warriorType == "Swordsman"){
          if (e.warriorType == "Axesman" || e.warriorType == "Archer"){ //Sword beats axe and bow, so the attack is effective
            attackDamage += 2;
            effectiveAttack = true;
          }
          else if (e.warriorType == "Lancer"){ //Sword doesn't beat a lance, so the attack is not as effective
            attackDamage -= 2;
            effectiveAttack = false;
          }
          else{ //If the warrior types are the same, no attack bonus or decrease is applied
          }
        }
          
        if ( this.warriorType == "Axesman"){
          if (e.warriorType == "Lancer"){ //Axe beats lance, so the attack is effective
            attackDamage += 2;
            effectiveAttack = true;
          }
          else if (e.warriorType == "Swordsman"){ //Axe doesn't beat sword, so the attack is not as effective
            attackDamage -= 2;
            effectiveAttack = false;
          }
          
          else{ //If the warrior types are the same, no attack bonus or decrease is applied
          }
        }
          
        if ( this.warriorType == "Archer"){
          if (e.warriorType == "Lancer"){ //Bow beats lance, so the attack is effective
            attackDamage += 2;
            effectiveAttack = true;
          }
          else if (e.warriorType == "Swordsman"){ //Bow doesn't beat sword, so the attack is not as effective
            attackDamage -= 2;
            effectiveAttack = false;
          }
          
          else{ //If the warrior types are the same, no attack bonus or decrease is applied
          }
        }
          
        if ( this.warriorType == "Lancer"){
          if (e.warriorType == "Swordsman"){ //Lance beat sword, so the attack is effective
            attackDamage += 2;
            effectiveAttack = true;
          }
          else if (e.warriorType == "Axesman" || e.warriorType == "Archer"){ //Lance doesn'tt beat axe, so the attack is not as effective
            attackDamage -= 2;
            effectiveAttack = false;
          }
          else{ //If the warrior types are the same, no attack bonus or decrease is applied
          }
        }
        attackDamage += this.weaponHolding.bonusGained(this); //The attacker has a (high) chance to gain the weapons attack bonus AND a (low) chance to gain a quad attack bonus.
        
        }
      else{
        if (attackDamage != 0){ //The attacker only does 1 damage as they do not have a weapon (ONLY IF THEIR ATTACK DAMAGE IS NOT AT A BASE OF 0)
          attackDamage = 1; 
        }
      }
      
      if (this.warriorType == "Invalid"){ //Gives an error message if the warrior type is invalid
          println("Your warrior class (for " +this.name + ") has never been seen before! Sadly you cannot do any damage :(");
          println("(PLEASE RECREATE YOUR WARRIOR AND MAKE SURE TO USE OF THE 4 WARRIOR TYPE OPTIONS)");
          println();
          attackDamage = 0;
          }
          
      if (attackDamage < 0){ // If the attack damage is less than zero, set the attack damage to zero (this makes it so the attacked doesn't 'give' health to the enemy)
        attackDamage = 0;
      }
      
      e.health = e.health - attackDamage; //Changes the enemy's health based on the attack damage
      println(this.name, "attacked", e.name + "!", this.name, "did", attackDamage, "damage!");
      if (effectiveAttack == true){ //If the attack was effective, print a special message
        println("Effective attack!", this.warriorType, "beats", e.warriorType + "!");
      }
      
      else{ //If the attack wasn't effective, print a special message
        println("Attack not effective!", e.warriorType, "beats", this.warriorType + "!");
      }
      
      if (e.health <= 0 ){ //If the enemy's health is at zero, the attacker wins the battle 
        e.health = 0;
        println(this.name, "won the battle against", e.name+"!");
        this.winLoot(e);
      }
    }
    else{ //Prints a special message if the warrior that is being attacked has no health to begin with
      println("You cannot fight this warrior as they have no health to fight with");
    }
    println();
  }
  
  
  void statsRead(){ //Reads the stats of the warrior
    println(this.name + "'s", "Stats:");
    println("Class Type:", this.warriorType);
    println("Health:",this.health +"/"+this.healthMax+" HP");
    println("Current level:" + this.level);
    println(this.xpCount + "/" + this.xpNeeded, "XP");
    println("Attack Power:" + this.attackPower);
    println("Defence Power:" + this.defencePower);
    println(this.name, "is carrying", this.potions, "potions");
    if (hasWeapon == false){ //Checks if the warrior has a weapon, if not run this code
      println(this.name, "doesn't have a weapon");
    }
    else{ //Checks if the warrior has a weapon, if they do run this code
      println(this.name + "'s weapon is:", this.weaponHolding.name, "(With attack bonus:", this.weaponHolding.attackBonus +")");
    }
    println();
  }
  
  
  void potionConsume(){ //Allows the warrior to drink a potion to recover HP
    int healthBackup = this.health; //Creates a backup of the current health, so that the HP gained can be calculated later
    if (this.health != this.healthMax){ //Checks if the warrior isn't at max health
      if (this.potions != 0){ //Checks if the warrior has potions to use
        this.health += 20; //Adds 20HP to the warrior
        this.potions -= 1; //Removes one of the warrior's potions
        
        if (this.health > this.healthMax){ //If the warrior has more HP than they are supposed to, simply make their current HP the same as their max HP
          this.health = this.healthMax;
        }
        
        println(this.name, "has restored", (this.health - healthBackup), "HP!", this.name, "now has", this.health +"/"+this.healthMax+" HP");
        
      }
      else{ //Runs if the warrior has no potions
        println("You do not have any potions!");
      }
    }
    else{ //Runs if the warrior is already at full health
      println(this.name, "already has full health. No potions are needed");
    }
    println();
  }
  
  void levelUp(){ //Allows the warrior to level up
    int levelRaise = 0; //Sets a counter for amount of times a warrior has leveled up 
    while (this.xpCount >= this.xpNeeded){ //While the warrior has enough XP to level up, level up
      this.xpCount -= this.xpNeeded; //Removes the XP needed to level up from the current level XP count
      this.level += 1; //Raises the warrior's level up by 1
      levelRaise += 1; //Counts that 1 level up has taken place
      this.xpNeeded = (7*this.level); //Sets the new xp needed for a level up 
      this.attackPower = (int(random(1, (2+ ( 1* (this.level / 6 )))))) + ( (this.level * 5)/4 ) ; //Sets the new attack power 
      this.defencePower = (int(random(1, (2+ ( 1* (this.level / 8 )))))) + ( (this.level *3 ) /4 ); //Sets the new defence power
      this.health = 100 + (2*this.level) ; //Give the warrior full health alongside an increase in total HP
      this.healthMax = this.health; //Changes the warrior's max HP count
      
    }
    
    if (levelRaise > 1){ //If the warrior leveled up more than once, run this
      println(this.name, "has leveled up", levelRaise, "times!", this.name, "is now level", this.level);
    }
    
    else if (levelRaise == 1){ //If the warrior leveled up only once, run this
      println(this.name, "has leveled up", "once!", this.name, "is now level", this.level);
    }
    
    else if (levelRaise == 0){ //If the warrior did not level up at all, run this
      println(this.name, "did not level up as they did not have enough XP to level up. They currenlty need", (this.xpNeeded - this.xpCount), "more XP.");
    }
    println();
  }
  
  void giveWeapon(Weapon w){ //Allows the warrior to hold a weapon
    if (hasWeapon == false && w.warriorType == this.warriorType && w.hasOwner == false){ //If the warrior currently has no weapon, the weapon they are trying to hold is compatible with their warrior type AND if the weapon doesn't already have an owner, run this
      this.hasWeapon = true;
      this.weaponHolding = w;
      w.giveOwner(this);
      println(this.name, "now is wielding", w.name, "("+w.weaponType+")");
    }
    
    else if (hasWeapon == false && w.warriorType != this.warriorType){ //If the warrior has no weapon BUT the weapon they are trying to hold isn't compatible with their warrior type, run this
      println(this.name, "cannont equip", w.name, "as a", w.weaponType, "cannot be equipped on a", this.warriorType);
    }
    
    else if(w.hasOwner == true){ //If the weapon already belongs to a warrior, run this 
      println(this.name, "cannont equip", w.name, "as it already belongs to", w.owner.name);
    }
    
    else{ //If the warrior already has a weapon , run this
      println(w.name, "cannot be equipped on", this.name,  "as", this.name, "already has a weapon ("+this.weaponHolding.name+")");
    }
    println();
  }
  
  
  void removeWeapon(){ //Allows the warrior to drop the weapon they are holding on to
    if (hasWeapon == true){ //If the warrior has a weapon, run this
      println(this.name, "is no longer holding on to", this.weaponHolding.name +".");
      this.weaponHolding.removeOwner();
      this.hasWeapon = false;
      this.weaponHolding = null;
      
    }
    else{ //If the warrior has no weapon, run this
      println(this.name, "has no weapon to drop.");
    }
    println();
  }
  
  
  void winLoot(Warrior e){ //If the warrior wins a battle, allow them to gain rewards
    int xpGained = 1 + (e.level / 2); //The warrior gains a certain amount of xp (based on how their opponent's level) 
    int potionsGained = int(random(1,3)); //Gains a random amount of potions
    this.xpCount += xpGained;
    this.potions += potionsGained;
    println(this.name, "got", potionsGained, "potions and also gained", xpGained, "XP!");
  }
  
}
  
  
  
  
  

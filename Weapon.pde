class Weapon{
  String name;
  int attackBonus;
  String weaponType; //Sword, Bow, Axe, Lance
  String warriorType; //Archer, Swordsman, Axesman, Lancer
  Warrior owner;
  boolean hasOwner;
  
  
  Weapon (String n, int ab, String wt){
    name = n;
    attackBonus = ab;
    weaponType = wt;
    
    if (weaponType == "Sword"){ //If the weapon is a sword, set the warrior type they can be assigned to Swordsman
      warriorType =  "Swordsman";
    }
    
    if (weaponType == "Bow"){ //If the weapon is a bow, set the warrior type they can be assigned to Archer
      warriorType =  "Archer";
    }
    
    if (weaponType == "Axe"){ //If the weapon is an axe, set the warrior type they can be assigned to Axesman
      warriorType =  "Axesman";
    }
    
    if (weaponType == "Lance"){ //If the weapon is a lance, set the warrior type they can be assigned to Lancer
      warriorType =  "Lancer";
    }
    
    hasOwner = false; //no weapon has a owner from the begining
    
    
    
  }
  
  int bonusGained(Warrior w){ //Checks if a bonus is gained during battle
    int output;
    
    if ( (int(random(0,4))) != 3){ //Creates a 2/3 chance of running (aka a attack bonus is gained)
      output = attackBonus;
      if ( (int(random(0,10))) == 2){ //Creates a 1/10 chance of a critical to be hit (aka attack bonus is multiplied by 4)
        println(w.name, "got a critical! Quad Attack Bonus!");
        output = output*4;
      }
    }
    
    else{ //Creates a 1/3 chance that of running (aka attack bonus is not gained
      println(w.name, "fluked! They did not get an attack bonus!");
      output = 0;
    }
   
    //println();
    return output;
  }
  
  
  void giveOwner(Warrior w){ //Allows the weapon to be given an owner
    if (this.hasOwner == false){
      this.owner = w;
      this.hasOwner = true;
      //println(this.name, "now belongs to", w.name + ".");
    }
  }
  
  
  void removeOwner(){ //Allows the weapon to be removed of an owner
    if (this.hasOwner == true){
      this.owner = null;
      this.hasOwner = false;
    }
  }
  
}

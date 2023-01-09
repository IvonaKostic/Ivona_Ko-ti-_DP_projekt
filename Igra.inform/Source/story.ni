"Igra" by Ivona Kostic

Include Basic Screen Effects by Emily Short.
Include Easy Doors by Hanon Ondricek.

When play begins:
	say "There was once a young man named Jack who lived in a small village. Jack was often the subject of ridicule and laughter because he was different from everyone else. He was clumsy and awkward, and he often stumbled and fell when he walked. Despite this, Jack had a kind and generous heart, and he always tried to help others whenever he could. One day, a rumor spread through the village that a beautiful princess had been captured by a dragon and locked away in a castle. The villagers were afraid to try and rescue the princess, but Jack knew he had to do something. He knew he was no match for the dragon, but he also knew that he couldn't just stand by and do nothing. Despite the laughter and ridicule of the other villagers, Jack set out on a journey to rescue the princess. You are Jack. You are in forest now.“;
	
The display banner rule is listed before the when play begins stage rule in the startup rules.
	
The forest is a room.  "You are standing in a dense forest. The trees are tall and their branches form a canopy overhead, blocking out most of the sunlight. There is a faint path winding through the underbrush, leading east and west." It is west of the house.

Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

After looking:
	let count of exits be the number of viable directions;
	if the count of exits is 0:
		say "(There are no routes out of this room.)";
	else:
		say "(From here, you can move to [a list of viable directions].)"; 
		continue the action.

The player is a person. A person can be poisoned or unpoisoned. The player is unpoisoned.
A person can be hungry or replete. The player is hungry.
The carrying capacity of the player is 3.

Check carrying thing:
	if the carrying capacity of the player is greater than 3:
		say "You have to drop one of the things you're carrying.";
		stop the action;
	otherwise:
		continue the action.
		
carrying thing is an action applying to one visible thing. 
Understand "carrying [something] " as carrying thing.


Before going the west:
	if the player is in the forest:
		say "You follow the west path out of the forest"; 
		end the story saying "After finding a way out, you were too scared to go back in the forest.";
	otherwise:
		continue the action.

Before going the east:
	if the player is in the forest:
		say "You follow the east path deeper into the forest and got to the old house.";
		move the player to the house;
		stop the action;
	otherwise:
		continue the action.
		
The house is a room. The house is south of the castle. "You are now in the old house. It looks like it has been abandoned for some time, but it is still in good repair. There is a male person standing."

The Salesman is a person in the house. "It is salesman, who is standing in front of the table, on which are  several gadgets and weaponry. He stares at you intently. You can ask him about the things on the table."

The table is here. It is fixed in place.	
The weaponry is a kind of thing. 
The gadget is a kind of thing.

The sword is the weaponry. 
The knife is the weaponry.
The flaming torch is a gadget. It is lit.

The sword is on the table.
The knife is on the table.
The flaming torch is on the table.

[Tables]
Table of Salesman Responses
Topic			Response					Index
"the flaming torch"			"It costs 10 dollars"					"the flaming torch"
"the sword"			"It costs 20 dollars"					"the sword"
"the knife"			"It costs 5 dollars"					"the knife"
"the things on the table"			"I am selling weaponry and gadget"				"the things on the table"
"things"			"I am selling weaponry and gadget"				"things"	
"things on table"			"I am selling weaponry and gadget"				"things on table"

After asking Salesman about something:
	if the topic understood is a topic listed in the Table of Salesman Responses:
		say "[Response entry]";
		
The block buying rule does nothing.

the d is a number that varies.
the d is 20.

Before of buying something on the table:
	if the player carries the wallet:
		say "Salesman says: [italic type]You can buy the the sword, the flaming torch or the knife if you have enough money[roman type][line break]";	
	otherwise:
		say "You do not have wallet or money with you".

Carry out buying the sword:
	if the player carries the sword:
		say “You’ve already bought it.” instead;
	else if the player carries the wallet and d is 20:
		say "Jack: I want to buy the sword[paragraph break]";		
		now d is d minus 20 ;
		say "You hand over cash, now you have [d] dollars remaining.[line break]You take the sword from the salesman.";
		now the player carries the sword;
	else if d is less than 20:
		say "Sorry, but you do not have enough money to buy the sword".
	
Carry out buying the flaming torch:
	if the player carries the flaming torch:
		say “You’ve already bought it.” instead;
	else if the player carries the wallet and d is greater than 10:
		say "Jack: I want to buy the flaming torch[paragraph break]";	
		now d is d minus 10;
		say "You hand over cash, now you have [d] dollars remaining.[line break]You take the flaming torch from the salesman.";
		now the player carries the flaming torch;
	else if d is less than 10:
		say "Sorry, but you do not have enough money to buy the flaming torch".
		
Carry out buying the knife:
	if the player carries the knife:
		say “You’ve already bought it.” instead;
	else if the player carries the wallet and d is greater than 5:
		say "Jack: I want to buy the knife[paragraph break]";		
		now d is d minus 5;
		say "You hand over cash, now you have [d] dollars remaining.[line break]You take the knife from the salesman.";
		now the player carries the knife;
	else if d is less than 5:
		say "Sorry, but you do not have enough money to buy the knife".

The castle is a room."You are now in front of castle. In order to get into the castle you need to open the Castle Door."

The Castle Door is a door. It is lockable and locked. 
The Castle Door is south of the hallway and north of the castle.

The nickel key is a thing.
The nickel key can be discovered or undiscovered. It is undiscovered.
The nickel key unlocks the Castle Door.

Before opening the Castle Door:
	if the player is carrying the nickel key:
		now the Castle Door is unlocked;
		move the player to the hallway;
		stop the action;
	otherwise:
		say "The Castle Door is locked.[line break]Search for the key in the garage.";
		stop the action.

The garage is a dark room. The garage is east of the castle. "You are in the garage. It is a large, cluttered space with a concrete floor and fluorescent lighting.". It contains a cabinet and a rug.

Before going to the garage:
	if the player carries the flaming torch:
		say "You can see everything. Now you can search for key";
		continue the action;
	otherwise:
		say "The player can not enter garage.[line break]Only way to get inside is, if you have flaming torch";

The description of cabinet is "It is made of sturdy oak and has a smooth, polished finish.[paragraph break] You can notice that the drawer is part of the cabinet".
The cabinet is fixed in place.
An openable container called the drawer is part of the cabinet. In the drawer is a paper.
The paper contains a message. The description of the message is "MESSAGE: [italic type]In fridge are three cakes, only chocolate cake is not poisonous.[roman type]"

The rug is an enterable supporter. 
There is the nickel key under the rug.

Instead of looking under the rug:
	if the nickel key is undiscovered:
		say "You saw a nickel key under the rug. Keep the key, you need it for unlocking Castle Door";
		now the player is carrying the nickel key;
		now the nickel key is discovered;
		stop the action;
	otherwise:
		say "I can not see anything";
		stop the action.
		
The fox is an animal in the garage. "Here is also the smart fox which is a small, animal with bright, alert eyes, and a bushy tail. It looks sly and cunning, with a sharp, curious gaze that seems to suggest that it is always thinking."

A thing can be drinkable. A thing is usually not drinkable.
The cure is a thing. 
The cure is drinkable. "The cure is a clear, colorless liquid with a faint, medicinal smell. It looks like it might be able to neutralize the poison."

Before examining the fox:
	if the player is poisoned:
		say "Hello smart fox, I am poisoned and need the cure. Can you help me?.[line break]Fox says: [italic type] Yes, but you need to answer this riddle.[roman type] [line break]What invention lets you look right through a wall? ";
		now the command prompt is "Enter the answer: ";
		stop the action;
	otherwise:
		say "Fox says: [italic type]Do you need something?[roman type]";
	
After reading a command when the command prompt is "Enter the answer: ":
	if the player's command matches "a window":
		say "The fox says: [italic type]You are right, here is cure[roman type]";
		now the player is carrying the cure;
		now the command prompt is ">";
		reject the player's command;
	otherwise:
		say "The fox says: [italic type]That's wrong, can't give you cure[roman type]";
		now the command prompt is ">";
		reject the player's command.

To drink is a verb.
		
Instead of drinking cure when the player carries the cure:
	say “You slurp down [the noun]. Refreshing!”;
	now the cure is nowhere;
	now the player is unpoisoned;
	stop the action.
	
The garden is a room. It is west of the castle. The description of the garden is "You are now in the garden.".
The box is here. "Here is a huge box made of wood with a hinged lid. It is well-worn, with scratches and dents on its surface. It looks like it has been used for storing things for a long time. You can open it and see what is inside."

The box, bag and wallet are openable closed.
The bag is in the box.
The wallet is in the bag.
In the wallet is 20 dollar bills.

A dollar bill is a kind of thing. The description of a dollar bill is "It's an ordinary greenback."
Understand "dollars" as the plural of dollar bill. Understand "greenback" as a dollar bill.

After taking the wallet when player is in the garden:
	say "Amazing, you have money. You can buy items in the old house.";
	stop the action.

The hallway is a room. Outside from hallway is the castle.

Door 1 is an easydoor in the hallway. It leads to kitchen. Understand "kitchen" as door 1.
The description of kitchen is "You are in the castle's kitchen. It is a large, well-equipped space with a fireplace, a fridge, and a table in the center. The smell of cooking food fills the air."
The fridge is in kitchen."The old fridge is a large, white appliance with a dented surface and a handle on the door. It has three cakes inside."
The cake is kind of edible thing.
The chocolate cake is a cake. 
The cheesecake is a cake. 
The dobosica is a cake.

The cake has a time called the aggravate period. The aggravate period of a cake is usually 10 minutes. The aggravate period of a dobosica is 4 minutes. The aggravate period of a cheesecake is 8 minutes. 

Carry out eating dobosica:
	now the player is replete;
	say "You are poisoned and have to find a cure if you want to live. The fox has the cure.";
	now the player is poisoned;
	the player eats dobosica in the aggravate period of the noun from now.

Carry out eating cheesecake:
	now the player is replete;
	say "You are poisoned and have to find a cure if you want to live. The fox has the cure.";
	now the player is poisoned;
	the player eats cheesecake in the aggravate period of the noun from now;
	stop the action.

At the time when the player eats dobosica:
	say "You eaten poisonous cake, you will die in 4 minutes from now if you do not find cure";
	poison occurs in 4 minutes from now.
	
At the time when the player eats cheesecake:
	say "You eaten poisonous cake, you will die in 8 minutes from now if you do not find cure";
	poison occurs in 8 minutes from now.

At the time when poison occurs:
	if player is poisoned, end the story saying "You have been posioned".
	
Toxicity is a kind of value. The toxicities are poisonous. The dobosica and cheesecake have a toxicity.
The chocolate cake is in the fridge.
The cheesecake is in the fridge.
The dobosica is in the fridge.

After opening the fridge:
	say "I am very hungry. I want to eat dobosica".
	
After eating chocolate cake:
	say "Wow, this is so delicious.";
	stop the action.
	
Instead of taking cheesecake:
	if the fridge is open:
		now the player is carrying the cheesecake;
		stop the action.

The fridge is openable. It is closed.
The fridge is fixed in place.
Outside from kitchen is the hallway.

Door 2 is an easydoor in the hallway. It leads to Princesses Room. Understand "princesses room" as door 2.
The description of princesses room is "You entered her room, but there is enormous dragon that is very hungry. Feed it with a poisonus cake and save princess".

the dragon is an animal.  It is in the princesses room. "The dragon is a massive, fearsome beast. It has wings that stretch out wide, and its eyes are glowing, fiery orbs. It looks like it is full of hatred and malice, and it seems to relish the thought of causing destruction and chaos."

The Princess is a person in the princesses room. "The princess is standing in the back of the room, she is looking scared."

Feeding the cake is an action applying to one visible thing. 
Understand "feed [somebody] with cake" as feeding the cake.

Check feeding the cake:
	if the noun is not an animal, say "You can only feed creatures." instead.
	
Instead of feeding the cake when the player is carrying cake:
	if the the player is carrying poisonous cake:
		if the noun is the dragon:
			say "You feed [the noun] with cake. It is munching it down.";
			end the story saying "You killed dragon with poisonous cake and saved princess. YOU WON";
	otherwise:
		end the story saying "Dragon ate the cake you brought him, but he is still hungry, so you are his food. GAME OVER".

Before opening door 2:
	say "You are in Princesses room, but you can see enormous dragon that is very hungry.";
	if the player is not carrying cake:
		end the story saying "Dragon ate you, because you did not bring him any food. GAME OVER".

Outside from Princesses room is the hallway.

Instead of going inside when the location is the hallway: say "You'll need to be more specific. There are two of doors here."


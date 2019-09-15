#Pencil Durability Kata

##Installation
Assumptions: You downloaded this from my github account. The program was developed with ruby 2.5.3p105 and Rspec 3.8 and was intended to be used though interacting with a command line, versus a double-click GUI option.


##Usage


To run the program (on a command line)  
ruby lib/pencil.rb  

I have added commented 'main' section that can be used to play with the functions. I'm assuming the proofs provided by tests would remove the need to run the code.
Essentially you create a pencil object, with the three parameters: Point length, eraser length, and pencil length. The idea of a piece of paper is represented by strings, so Pencils can only interact with string objects. You use the pencil object you have created like this  

numbertwo = Pencil.new(100,25,4)  

and you have a piece of paper like this  

paper = "Lady"  

and then you use a method of the pencil. There are methods like use_eraser,write, edit that can be used to alter the paper.  
numbertwo.write("    bird",paper)  

would return "Lady    bird", for example. There are also methods that are used to implement an aspect of the those other methods, like replace_with_ws, set_eraser_durability etc. You will probably not explicitly use these methods, but you are welcome to break them, or use them in other methods you imagine. The methods you are most likely to use, and how they should be used is below.


Write:

numbertwo = Pencil.new(150,50,3)  
paper = "The quick brown fox"  
numbertwo.write("jumps over the lazy dog",paper) #"The quick brown fox jumps over the lazy dog"  

Edit paper:  Only works if there is a whitespace block.  
paper = paper = "An       a day keeps the doctor away"  
numbertwo.edit_paper("apple", paper)  

Use eraser:  
paper = "How much wood would a woodchuck chuck if a woodchuck could chuck wood?"  
numbertwo.use_eraser("chuck",paper) # "How much wood would a woodchuck chuck if a woodchuck could       wood?"  

Sharpen:  
numbertwo.sharpen() #this will change point durability to the original value used when created. Needed when point durability is low  

You cannot use the eraser once eraser_durability is 0 nor can you used the pencil when pencil_length is 0.  

To run the tests (on a command line)  
rspec spec/pencil_spec.rb  

##thoughts throughout kata development

Pencil object  
paper object  

edit text on paper with eraser(pencil)  
eraser and pencil point have durability  
sharpen resets pencil point durability  
writing spends durability  

overlapping letters are replaced with @


pencil object (set_eraser_durability, set_permanent_point_durability, set_)  
paper object (with_text, without_text)  


durability at 0  
eraser - last occurrence of that text on the paper will be replaced with empty spaces.  

~

how would I describe the edit function? In the real world, editing is erase and write over and over sometimes there are issues of the finite size of a paper

here, I feel like the edit function only applies after something has been erased OR there is sizeable whitespace. Therefore I am applying the rule that in order to edit there must be whitespace on each side.



~

realising an 'issue' with Ruby mutability  
technically I am not altering the original value of paper  
I am making new references of the paper as something is done to it  



ruby seems to be against mutating objects overall  

options?  

Indexed Assignment is mutating  
concat is mutating  
setters are mutating  

I could reset the idea of paper to be an array instead of a string.
Then all the words would have an index (or chars) force it to mutate the variable  
BUT I don't know if I really like the representation of paper as an array.  
Am i still using the array version as a tool to change my strings?  
yes  

I think that arrays are fixed, and a piece of paper does not have to fixed with a pencil  

~~

changing edit to work. Also realized with the way I am using @on_paper, I don't think I need to make it an instance variable because I set the instance variable to whatever the input string was.. will test the change after edit is complete.

thought on edit - currently this would replace any whitespace larger than 2, and sub with the string to add, so if there are multiple erased chunks, the added string is put everywhere.

that means if there were multiple edits you would have to erase and then change one word at a time.

..

changing to sub should fix the issue of replacing all of the white space  

~~

need to finish the tests. Originally I wanted a paper object,  
but I don't think that that is necessary anymore  
a pencil in this case is a sort of string editor, I think  


~~

and so here I am considering how to handle point durability when the point is smaller than the character amount is every unavailable character a space? Because in a way, that seems incorrect to me. Doing so would mean that you could end up with a large array, of emptiness there is a data cost to that at some point. Do i add one additional space to say "you're out of pencil, but heres one little space where the rest of your string was supposed to be" or why put whitespace at all? in a way, if you have a large whitespace then you have the option of editing the paper, which might not have been true if i gave 1 or less whitespaces. That would encourage people to use my string editor in a way non-intended, with no disregard to the amounts left in your point

anyways set it to replace all extra chars with whitespace

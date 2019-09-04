Pencil object
paper object


edit text on paper with eraser(pencil)
eraser and pencil point have durability
sharpen resets pencil point durability
writing spends durability

overlapping letters are replaced with @


tests/functions in order?

pencil object (set_eraser_durability, set_permanent_point_durability, set_)
paper object (with_text, without_text)


durability at 0
eraser - last occurrence of that text on the paper will be replaced with empty spaces.

~

how would I describe the edit function?
In the real world, editting is erase and write over and over
sometimes there are issues of the finite size of a paper

here, I feel like the dit function only applies after something has been erased
OR there is sizeable whitespace. Therefore I am applying the rule that in order to edit
there must be whitespace on each side.



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
Then all the words would have an index (or chars)
force it to mutate the variable
BUT I don't know if I really like the representation of paper as an array.
Am i still using the array version as a tool to change my strings?
yes

I think that arrays are fixed, and a piece of paper does not have to fixed with a pencil

~~

changing edit to work. Also realized with the way I am using @on_paper, I don't think I need
to make it an instance variable because I set the instance variable to whatever the
input string was.. will test the change after edit is complete.

thought on edit - currently this would replace any whitespace larger than 2, and sub with
the string to add, so if there are multiple erased chunks, the added string is
put everywhere.

that means if there were multiple edits you would have to erase and then change
one word at a time.

..

changing to sub should fix the issue of replacing all of the white space

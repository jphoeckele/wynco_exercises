#The Cats in Hats Problem

# You have 100 cats in a row that are all wearing hats. 
# You make 100 passes by the cats. The first time through, 
# you visit every cat and remove its hat if it’s on, and 
# put it on if it’s off. The second time you only visit 
# every 2nd cat (cat #2, #4, #6, …). The third time, every
# 3rd cat (cat #3, #6, #9, …), etc, until you only visit 
# the 100th cat. After the last pass, which cats aren’t
# wearing hats? Show the code you wrote to get this answer.



cats = Array (1..100)      #Creates an array 1-100
i = 1
cats.map do |x| x +=i      #Maps array with increasing value 1-100
end

t = 1 					   
while (t <= cats.length)   #Loop through 't' array while 't' is less than array length
    i = t - 1			   #Subtract 1 from array total
    while i < cats.length  #Loop through 'i' array while 'i' is less than array length
        cats[i] *= -1      #Multiplies each array by -1 on each iteration (Reverses cats from either positive or negative)
        i += t  		   
    end
        
    t += 1                 #Adds 1 to 't' inside 1st while loop (Increases 't' until 't' value equals cat.length)
end

No_Hats = cats.delete_if {|x| x >= 0 }            #Throws out all integers > 0 (All positive integers)
Cats_No_Hats = No_Hats.map { |i| i * -1 }         #Multiplies negative integers by -1 (Turns them positive)
puts "The cats with no hats are #{Cats_No_Hats}!" #puts value of now positive integers (Cats with Hats)





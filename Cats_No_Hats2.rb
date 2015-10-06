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





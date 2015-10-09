
class World
	attr_accessor :politicians, :voters

	def initialize
		@politicians = []
		@voters = []
	end

	#Intro
	def intro
		puts "Please ensure that the keyboard's caps lock is turned on."
		sleep(2)
		puts "\nThank you!"
		sleep(2)
		puts "\nNow we may begin."
		sleep(2)
	end



	#Main Menu
	def main_menu
		puts "\nWhat would you like to do?\n(C)reate, (L)ist, (U)pdate, or (V)ote"
		option = gets.chomp.upcase
		case option
		when "C"
			create
		when "L"
			list
		when "U"
		when "V"
			run_election
		else
			puts "\nSomething went wrong. Please select again"
		end
	end


	#Create Choice of Politician or Voter
	def create
		puts "\nWhat would you like to create? (P)olitician or (V)oter"
		politics = gets.chomp.upcase
		case politics
		when "V"
			voter_creation
		when "P"
			politician_creation
		else
			puts "\nSomething went wrong. Please select again"
			create
		end
		main_menu
	end

	#List
	def list
		puts "Voters:"
		puts @voters
		puts "Politicians:"
		puts @politicians
	end
	# voters.each do |voter|
	# 	puts "Voter: #{voter.name.capitalize}, #{voter.politics.capitalize}"
	# end
	# politicians.each do |politicians|
	# 	puts "Politician: #{politicians.name.capitalize}, #{politicians.politics.capitalize}"
	# end



#Update
# def update
# end
# #Vote
# def vote
# end


#Create = V or P Creation Options
def voter_creation
	puts "\nPlease enter your name."
	name = gets.chomp.upcase
	puts "\nWhat party do you currently belong to?\n(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
	politics = gets.chomp.upcase
	voter_view = voter_party_value(politics)
	@voters << Voter.new(name, voter_view)
end

def voter_party_value(politics)
	case politics
	when "L"
		"Liberal"
	when "C"
		"Conservative"
	when "T"
		"Tea Party"
	when "S"
		"Socialist"
	when "N"
		"Neutral"
	else
		puts "Something isn't right, please try again"
		voter_party_value
	end
end
end

def politician_creation
	puts "\nPlease enter your name."
	name = gets.chomp
	puts "\nAre you a (D)emocrat or a (R)epublican?"
	politics = gets.chomp.upcase
	pview = politician_party_value(politics)
	@politicians << Politician.new(name, pview)
end

def politician_party_value(politics)
	case politics
	when "D"
		"Democrat"
	when "R"
		"Republican"
	else
		puts "Something isn't right, please try again"
		politician_party_creation
	end
end


def run_election
	population = @politicians + @voters

	score_board = {}

	@politicians.each do |politician|
		score_board[politician.name] = 0
	end

	population.each do |person|
		politician = person.vote(@politicians)
		score_board[politician.name] += 1
	end

	score_board
end





class Voter
	attr_accessor :name, :politics

	def initialize (name, politics)
		@name = name
		@politics = politics
	end

	def to_s
		"#{@name.capitalize}, #{@politics.capitalize}"
	end

	@@chance_of_republican = {
		"Tea Party" => 90,
		"Conservative" => 75,
		"Neutral" => 50,
		"Lliberal" => 25,
		"Socialist" => 10
	}
end

class Politician 
	attr_accessor :name, :politics

	def initialize(name, politics)
		@name = name
		@politics = politics
	end
	def to_s
		"#{@name.capitalize}, #{@politics.capitalize}"
	end
end



# world = World.new
# world.politicians << Politician.new("Trump", "R") << Politician.new("Hillary", "D")
# world.voters << Voter.new("Jake", "T") << Voter.new("Mary", "L") << Voter.new("Bill", "C")

# p world.run_election

# def test
	# p Voter.new("John", "Liberal")
	# p Voter.new("Jake", "Liberal")
	# p Voter.new("Jimmy", "Liberal")
	# p Voter.new("Phil", "Liberal")
# 	p Politician.new("Oksana", "Tea Party")
# end

# test

world.intro
world.main_menu




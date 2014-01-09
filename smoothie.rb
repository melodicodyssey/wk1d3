$smoothie_ingredients = {
'flax seeds' => '1 tbsp',
'chia seeds' => '1 tbsp',
'coconut flakes' => '1 tbsp',
'spirulina' => '1 tsp',
'pumpkin seeds' => '1 tbsp',
'oatmeal' => '1/4 cup',
'coco powder' => '1 tbsp',
'peanut butter' => '1 tbsp',
'almonds' => '1/4 cup',
'walnuts' => '1/4 cup',
'spinach' => '1/4 cup',
'greek yogurt' => '1/4 cup',
'nutrional yeast' => '1 tbsp',
'brussel sprouts' => '1/4 cup',
'asparagus' => '1/4 cup',
'kale' => '1/4 cup',
'brocoli rabe' => '1/4 cup',
'blue berries' => '1/4 cup',
'chopped banana' => '1/2 cup',
'straw berries' => '1/4 cup',
'mango' => '1/4 cup',
'hemp milk' => '1 cup'
}



class Blender

	def initialize(power_switch=false,ingredients_hash)
		@ingredients_hash = ingredients_hash
		@power_switch = power_switch
	end

	def on()
		@power_switch = true
	end

	def off()
		@power_switch = false
	end


	#width of glass = 20 chars
	# number of lines in glass = ingredients.size/20 -1
	# left over "bits" in glass= ingredients.size%20
	# puts * + first 20 chars of liquid + *
	# puts * + next 20 chars of liquid + *
	# etc

	def blend(ingredients_hash)
		# turn array of strings into big array of 1 char per element
		# call "shuffle" on this big array
		ingredients = ingredients_hash.keys
		liquid = ingredients.join("").split("").delete_if{|char| char == " "}.shuffle.join("")
		n = 0
		if @power_switch == true
			#sides of glass + the "liquid" that was blended
			puts ""
			for i in (1..liquid.size/20)
				print "**"
				print liquid.slice(0+n,20)
				print "**\n"
				n += 20
			end
			#bottom of glass + the remaining "liquid" spilled over
			print "#{"*"*24}\n#{"*"*24}"
			sleep 1
			puts "#{liquid.slice((-1 - liquid.size%20), liquid.size%20)}"
		else
			puts "The blender is not on!  Please call the .on method!"
		end
	end

	@@continue = true

	def use()
		while @@continue == true
		puts "\n\n"
		puts "What would you like to do?"
		puts ".........................."
		puts "-turn on?"
		puts "-turn off?"
		puts "-blend?"
		puts "-put away?"
		answer = gets.chomp.downcase
		case answer
			when "turn on"
				if @power_switch == false
					on()
					puts "\nThe blender is now turned on!   [OFF |] ON]\n----------\n\n"
					sleep 1
				else 
					puts "\nThe blender is already on!   [OFF |] ON]\n----------\n\n"
					sleep 1
				end
			when "turn off"
				if @power_switch == true
					off()
					puts "\nThe blender is now turned off!   [OFF [| ON]\n----------\n\n"
					sleep 1
				else
					puts "\nThe blender is already off!   [OFF [\ ON]\n----------\n\n"
					sleep 1
				end

			when "blend"
				if @power_switch == true
					puts "\nBleennnnddddiiiinnnnnggggg!\n----------\n"
					sleep 1
					blend(@ingredients_hash)
					puts "\n----------\n"
					sleep 1
				else
					puts "\nThe blender isn't even on!..... ya know\n---------\n\n"
					sleep 1
				end
			when "put away"
				puts "\nPutting the blender away\n----------\n"
				@@continue = false
			else
				puts "\nI don't understand that\n----------\n"
			end
		end
	end

end

$blender = Blender.new($smoothie_ingredients)
# blender.on()
# blender.blend(smoothie_ingredients)
$blender.use()

#USE GLOBAL VARIABLES
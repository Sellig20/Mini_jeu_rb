require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

	puts 
	puts"               * * * *B*I*E*N*V*E*N*U*E* * * *"
	puts"               *                             *"
	puts"               *    AU SUPER JEU 'MORT/VIF'  *"
	puts"               *    Il n'en restera qu'un... *"
	puts"               *                             *"
	puts"               * * * *B*Y* *S*E*L*L*I*G* * * *"
	puts " "

	puts "Bonjour, quel est votre pseudo pour cette partie ?"
	print "> "
	@human = HumanPlayer.new(gets.chomp)

	player1 = Player.new("Mario")
	player2 = Player.new("Browser")
	array = [player1, player2]

 while @human.life_points > 0 || array.life_points > 0
		puts " "
		@human.show_state
		puts "\n"
		puts "🔹 " * 25
		puts "Veux-tu derouler le menu ? oui/oui"
		print "> "
		answer = gets.chomp
		if answer == "oui"
			puts "Serieux, parce que t'as cru que t'avais le choix ??"
			puts "\n"
			puts "**********M**E**N**U**********"
			puts "\n"
			puts "		a- Chercher une meilleure arme"
			puts "		s- Chercher a se soigner"
			puts "\n"
			puts "Pour attaquer un joueur en vue :"
			puts "\n"
			print "		0- "
			player1.show_state
			print "		1- "
			player2.show_state
			puts "\n "
			puts "**********M**E**N**U**********"
			puts "\n"
			puts "Quelle action veux-tu donc effectuer ?"
			print "> "
			
			result = gets.chomp

			if result == "a"
				@human.search_weapon
			elsif result == "s"
				@human.search_health_pack
			elsif result == "0"
				@human.attacks(player1)
			elsif result == "1"
				@human.attacks(player2)
			else
				puts "Vous vous etes trompe de commande."
			end
		puts " ‼️  ‼️  ‼️ Attention a la riposte moussaillon ! Les autres joueurs attaquent 💥"
		puts "\n"
			array.each do |ennemy|
				if ennemy.life_points <= 0
					next
				else 
					ennemy.attacks(@human)
				end
			end
		elsif answer != "oui"
				puts "Ca, c'est vraiment pas drole moussaillon. Teste mon jeu wsh!!! De toute maniere t'as pas le choix <3 :"
		end
 end
 puts "E**N**D****O**F****G**A**M**E"
		if @human.life_points > 0 
			puts "🏆 Bravo !! tu as gagne ce jeu !! 🥇"
		else
			"Looooooseeeeeer !! Tu es mort et enterre mon pote ⚰️ "
		end

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Maximus")
player2 = Player.new("Crixus")

	while player1.life_points > 0 && player2.life_points > 0
		puts "Bienvenue dans l'arene sanguinaire des gladiateurs ! Voici l'etat des deux joueurs selectionnes pour ce combat epique: #{player1.name} demarre le jeu avec #{player1.life_points} points de vie... #{player2.name} demarre sans surprise avec #{player2.life_points} points de vie..."
		puts "Passons a l'attaque ! Que les jeux demarrent !"
		puts "++++++++++++++ Debut de l'arene +++++++++++++"
		puts "Et l'honneur revient au premier joueur d'attaquer son adversaire ! #{player1.name} a toi de jouer !"
		player1.attacks(player2)
		if player2.life_points <= 0
			puts "Bravo #{player1.name}, vous remportez le combat ! puisque "
			break
		end
		player1.show_state
		puts "Attention la riposte va faire mal !! #{player2.name} ne se laisse pas faire !"
		player2.attacks(player1)
		player2.show_state
		puts "++++++++++++++ Fin de l'arene +++++++++++"
		puts " "
	end

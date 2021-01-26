class Player
	attr_accessor :name, :life_points

	def initialize(name)
	@name = name
	@life_points = 10
	end

	def show_state
		if life_points > 0
			puts "#{@name} a #{@life_points} points de vie"
		elsif life_points <= 0
			puts "#{@name} est actuellement aux Urgences a cause du ko monumental qu'il s'est pris dans la tronche...🏥"
		end
	end

	def gets_damage(points)
	@life_points = @life_points - points.to_i 
		if @life_points <= 0
			puts "Le joueur #{@name} a ete tue !"
		end
	end

	def attacks(player)
		damage_inflicted = compute_damage
		puts "🧨 BAM ! Le joueur #{name} attaque le joueur #{player.name} !"
		puts "💣 Il lui inflige #{damage_inflicted} coups donc #{damage_inflicted} points en moins ..."
		puts "\n"
		player.gets_damage(damage_inflicted)
	end

	def compute_damage
		return rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@weapon_level = 1
		super(name)
		@life_points = 100
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et possede une arme de level #{@weapon_level}"

	end

	def compute_damage
		super * weapon_level
	end

	def search_weapon
		new_weapon = rand(1..6)
		puts "Tu viens de trouver une arme 🔫 de niveau #{new_weapon}"
		if new_weapon < weapon_level || new_weapon == weapon_level
			puts "Cette arme pue la merde 💩 Garde ton arme actuelle"
		else 
			puts "Yeah 🔥🔥🔥 !! Elle est meilleure que ton arme actuelle : tu la prends !!"
			weapon_level = new_weapon
		end
	end

	def search_health_pack
		health_pack = rand(1..6)
		if health_pack == 1
			puts "Bouhouououuuuu t'es nuuuul 👎 et t'as rien trouve"
		elsif health_pack >= 2 && health_pack <= 5
			puts "Bravo ! Tu viens de trouver un pack de +50 points de vie !"
				health_pack = 50 
				@life_points = @life_points + health_pack
				if @life_points > 100
					@life_points = 100
				end
		else
			puts "Felicitations ! Tu viens de trouver un pack de +80 points de vie !"
				health_pack = 80 
				@life_points = @life_points + health_pack
				if @life_points > 100
					@life_points = 100
				end
		end
	end 
end

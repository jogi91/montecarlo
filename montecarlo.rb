#Klasse zum Berechnen eines Integrals einer gegebenen Funktion
class Montecarlo
	#Die Variablen werden gesetzt
	def initialize (function="sin(x)*x", lowerBound=0, upperBound=(Math::PI)/2, steps=10)
		@function,@lowerBound,@upperBound,@steps = function, lowerBound, upperBound, steps
	end
	#Ausgabe
	def to_s
	end
	
	private
	def getheight
	end
	def shoot
	end
	def inArea?
	end
end

Montecarlo.new
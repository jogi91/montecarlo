require "gsl"
include Math

#Klasse zum Berechnen eines Integrals einer gegebenen Funktion
#Für das Integral soll die Ruby-Library RubyGSL verwendet werden, im Moment berechnet sie aber nur die Funktionswerte.
class Montecarlo
	attr_accessor :function, :lowerBound, :upperBound, :steps
	#Die Variablen werden gesetzt
	#
	#function ist vom Typ GSL::Function
	#
	#alle anderen Werte sind Integers
	def initialize (function, lowerBound=0, upperBound=(Math::PI)/2, steps=10)
		@function,@lowerBound,@upperBound,@steps = function, lowerBound, upperBound, steps
	end
	#Ausgabe, Montecarlo wird ausgeführt und dann als String ausgegeben
	def to_s
	  height = getheight
	  puts height
	  hitcounter = 0
	  for i in 0..steps do
	    hitcounter += inArea?(height)
	  end
	  area = height*(@upperBound-@lowerBound)
	  return (area*hitcounter/steps).to_s
	end
	
	private
	#berechnet die Höhe der Fläche, in die geschossen wird, funktioniert im moment nur für sin(x)*x und die grenzen 0 und Pi/2
	def getheight
		if @lowerBound == 0 and upperBound == (Math::PI)/2 and @function = GSL::Function.alloc {|x| sin(x)*x} then
		  #maximum bei x=PI/2, f(x)= PI/2
		  return PI/2
	  else
	    raise "Das programm ist dafür noch nicht fertig Programmiert"
		end
	end
	def shoot(height)
	  result = [rand()*(@upperBound-@lowerBound), rand*height]
	  return result
	end
	def inArea?(height)
	    coordinates = shoot(height)
	  if coordinates[1] < @function.eval(coordinates[0]) then #.eval berechnet den Funktionswert
	    return 1 #innerhalb
    else
      return 0
    end
	end
end

#Nutzung von RubyGSL um die FUnktion zu definieren
f = GSL::Function.alloc {|x|
  sin(x)*x
}

a = Montecarlo.new(f,0,PI/3,10 )
a.steps = 10
puts a.to_s
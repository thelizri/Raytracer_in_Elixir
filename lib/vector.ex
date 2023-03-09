defmodule Vector do

	# Needs to handle these vector operations for 3-dimensional vectors
	# scalar multiplication
	# subtraction
	# addition
	# norm of a vector
	# dot product
	# normalized vector

	def scalarMul(scalar, {a, b, c}) do
		{scalar*a, scalar*b, scalar*c}
	end

	def dot({x, y, z}, {a, b, c}) do
		x*a + y*b + z*c
	end

	def sub({x, y, z}, {a, b, c}) do
		{x-a, y-b, z-c}
	end

	def add({x, y, z}, {a, b, c}) do
		{x+a, y+b, z+c}
	end

	#Gets the length of the vector
	def norm({a, b, c}) do
		normSquared = a*a + b*b + c*c
		:math.sqrt(normSquared)
	end

	#Returns the vector with length 1
	def normalize({a, b, c}) do
		norm = norm({a, b, c})
		{a/norm, b/norm, c/norm}
	end

end
defmodule Vector do

	# Needs to handle these vector operations for 3-dimensional vectors
	# scalar multiplication
	# subtraction
	# addition
	# norm of a vector
	# dot product
	# normalized vector

	def scalarMultiplication(scalar, {a, b, c}) do
		{scalar*a, scalar*b, scalar*c}
	end

	def dotProduct({x, y, z}, {a, b, c}) do
		x*a + y*b + z*c
	end

	def subtraction({x, y, z}, {a, b, c}) do
		{x-a, y-b, z-c}
	end

	def addition({x, y, z}, {a, b, c}) do
		{x+a, y+b, z+c}
	end

	def norm({a, b, c}) do
		normSquared = a*a + b*b + c*c
		:math.sqrt(normSquared)
	end

	def normalized({a, b, c}) do
		norm = norm({a, b, c})
		{a/norm, b/norm, c/norm}
	end

end
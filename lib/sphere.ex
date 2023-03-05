defmodule Sphere do

	defstruct(pos: {0, 0, 0}, radius: 2)

	defimpl Object do

		def intersect(sphere, ray) do
			Sphere.intersect(sphere, ray)
		end

	end
	#Returns either :no or {:ok, d}, where d is the closest distance
	# If t2 is negative, the ray does not intersect the sphere
	def intersect(%Sphere{pos: spherePos, radius: radius},  %Ray{pos: rayPos, dir: dir}) do
		k = Vector.subtraction(spherePos, rayPos)
	    a = Vector.dotProduct(dir, k)
	    a2 = a*a
	    normK = Vector.norm(k)
	    k2 = normK*normK
	    r2 = radius*radius
	    h2 = k2 - a2
	    t2 = r2 - h2
	    #closest(t2, a)
	end

end
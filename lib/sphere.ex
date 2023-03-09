defmodule Sphere do

	defstruct(pos: {0, 0, 0}, radius: 2, color: {255, 255, 255})

	defimpl Object do
		def intersect(sphere, ray) do
			Sphere.intersect(sphere, ray)
		end
		def normal(sphere, ray, pos) do
			Sphere.normal(sphere, ray, pos)
		end
	end

	#Returns either :no or {:ok, d}, where d is the closest distance
	# If t2 is negative, the ray does not intersect the sphere
	def intersect(%Sphere{pos: spherePos, radius: radius},  %Ray{pos: rayPos, dir: dir}) do
		k = Vector.sub(spherePos, rayPos)
	    a = Vector.dot(dir, k)
	    a2 = a*a
	    normK = Vector.norm(k)
	    k2 = normK*normK
	    r2 = radius*radius
	    h2 = k2 - a2
	    t2 = r2 - h2
	    cond do
	    	t2 >= 0 -> closest(t2, a)
	    	true -> :no
	    end
	end

	#Returns the closest distance if t2 is positive
	def closest(t2, a) do
		t = :math.sqrt(t2)
		d1 = a+t
		d2 = a-t
		cond do
			d1 < 0 and d2 < 0 -> :no
			d1 < 0 -> {:ok, d2}
			d2 < 0 -> {:ok, d1}
			d1 < d2 -> {:ok, d1}
			true -> {:ok, d2}
		end
	end

	#Returns the normal of where the ray intersects with the sphere
	def normal(%Sphere{pos: spherePos, radius: radius},  _, pos) do
		Vector.sub(spherePos, pos)
		|> Vector.normalize()
	end

end
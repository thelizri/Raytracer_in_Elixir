defmodule Tracer do

	@delta 0.001
	@black {0, 0, 0}
	@white {255, 255, 255}
	@red {255, 0, 0}
	@lime {0, 255, 0}
	@blue {0, 0, 255}
	@yellow {255, 255, 0}
	@cyan {0, 255, 255}
	@magenta {255, 0, 255}

	#Will return a list of lists with tuples inside. Or, in other words, the matrix of the image
	def tracer(camera, objects) do
		{width, height} = camera.size
		for y <- 1..height, do: for(x <- 1..width, do: trace(x, y, camera, objects))
	end

	#Finds the ray that points to that pixel and returns the color
	def trace(x, y, camera, objects) do
		ray = Camera.ray(camera, x, y)
		trace(ray, objects)
	end

	#Looks at the distance and returns a color
	def trace(ray, objects) do
		case intersect(ray, objects) do
			{:inf, _} -> @black
			{dist, object} -> object.color
		end
	end

	#Sends a ray out and returns the closest distance and object
	def intersect(ray, objects) do
		Enum.reduce(objects, {:inf, nil},
		fn (object, acc) ->
			{dist, _} = acc
			case Object.intersect(object, ray) do
				{:ok, d} when d < dist -> {d, object}
				_ -> acc
			end
		end)
	end

end
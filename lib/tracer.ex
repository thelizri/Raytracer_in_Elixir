defmodule Tracer do

	@delta 0.001
	@black {0, 0, 0}
	@white {1.0, 1.0, 1.0}

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

	#More complicated version
	# def trace(ray, %World{}=world) do
	#     case intersect(ray, world.objects) do
	# 		{:inf, _} -> world.background
	# 		{dist, obj} ->
	# 			i = Vector.add(ray.pos, Vector.scalarMul(dist - @delta, ray.dir))
	# 			normal = Object.normal(obj,ray,i)
	# 			visible = visible(i, world.lights, world.objects)
	# 			illumination = Light.combine(i, normal, visible)
	# 			Light.illuminate(obj, illumination, world)
	#     end
  	# end

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


	#Returns the visible light sources
	def visible(point, lights, objs) do
		Enum.filter(lights, fn light -> clear(point, light.pos, objs) end)
	end


	#Determines if a certain point is visible by a certain ligth
	def clear(point, origin, objs) do
		#Vector between point and light origin
		dir = Vector.normalize(Vector.sub(origin, point))
		Enum.reduce(objs, true, fn (obj, acc) ->
			case acc do
				false -> false
				true ->
					case Object.intersect(obj, %Ray{pos: point, dir: dir}) do
						:no -> true 
						_ -> false #If light ray is intersected by any object, it's not visible
					end
			end
		end)
	end

end
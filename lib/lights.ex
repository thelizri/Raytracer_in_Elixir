defmodule Light do

	defstruct(pos: nil, color: {255, 255, 255})

	def illuminate(obj, ill, world) do
		color = obj.color |> encode()
		ill(color, mul(ill, world.ambient)) |> decode()
	end

	#Encode color to 0 <= rgb < 1
	def encode({r, g, b}) do
		{r/255, g/255, b/255}
	end

	#Decode color to 0 <= rgb < 256
	def decode({r, g, b}) do
		r = round(r*255)
		g = round(g*255)
		b = round(b*255)
		{r, g, b}
	end

	## combine the two lights 
	def mul({r1, g1, b1}, {r2, g2, b2}) do
		{1 - (1 - r1) * (1 - r2), 1 - (1 - g1) * (1 - g2), 1 - (1 - b1) * (1 - b2)}
	end

	## illuminate a surface of a given color
	def ill({r1, g1, b1}, {r2, g2, b2}) do
		{r1 * r2, g1 * g2, b1 * b2}
	end

	def combine(point, normal, lights) do
		Enum.reduce(lights, {0, 0, 0},
			fn(light, contr) ->
				contribute(point, normal, light.pos, light.color)
				|> mul(contr)
		end)
	end

	def contribute(point, normal, source, {r, g, b}) do
		direction = Vector.normalize(Vector.sub(source, point))
		cos = Vector.dot(direction, normal)
		if cos >= 0 do
			{r * cos, g * cos, b * cos}
		else
		# this can happen around edges of planes
			{0,0,0}
		end
	end
	
end
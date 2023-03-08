defmodule Camera do

	defstruct(pos: nil, corner: nil, right: nil, down: nil, size: nil)

	#Gives us a standard camera
	def normal(size) do
		{width, height} = size
		depth = width*1.2
		vertical = height / 2
		horizontal = width / 2
		corner = {-horizontal, vertical, depth}
	    right = {1, 0, 0}
	    down = {0, -1, 0}
	    %Camera{pos: pos, corner: corner, right: right, down: down, size: size}
	end

	#Gives back the ray that goes through given pixel
	def ray(camera, x, y) do

	end

end
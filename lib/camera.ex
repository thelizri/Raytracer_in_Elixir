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
	    %Camera{pos: {0, 0, 0}, corner: corner, right: right, down: down, size: size}
	end

	#Gives back the ray that goes through given pixel
	def ray(%Camera{pos: cameraPos, corner: corner, right: right, down: down, size: size}, column, row) do
		x = Vector.scalarMul(column, right)
		y = Vector.scalarMul(row, down)
		v = Vector.add(x, y)
		pos = Vector.add(corner, v)
		dir = Vector.normalize(pos)
		%Ray{pos: cameraPos, dir: dir}
	end

end
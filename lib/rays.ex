defmodule Ray do

	defstruct(pos: {0, 0, 0}, dir: {1, 1, 1})

	#r = %Ray{pos: {0,0,0}, dir: {0,0,1}} 		-> create a new ray
	#p = ray.pos 								-> extract the position
	#d = ray.dir 								-> extract the direction

end
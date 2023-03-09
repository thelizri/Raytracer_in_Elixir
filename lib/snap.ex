defmodule Snap do

	#Should create a black and white picture
	def snap(0) do
		camera = Camera.normal({800, 600})
		obj1 = %Sphere{radius: 140, pos: {0, 0, 700}}
		obj2 = %Sphere{radius: 50, pos: {200, 0, 600}}
		obj3 = %Sphere{radius: 50, pos: {-80, 0, 400}}
		image = Tracer.tracer(camera, [obj1, obj2, obj3])
		PPM.write("snap0.ppm", image)
	end
end
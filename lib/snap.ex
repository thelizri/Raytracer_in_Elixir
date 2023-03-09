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

	#Should create a picture with 3 colored circles
	def snap(1) do
		camera = Camera.normal({800, 600})
		obj1 = %Sphere{radius: 140, pos: {0, 0, 700}, color: Color.get(:lime)}
		obj2 = %Sphere{radius: 50, pos: {200, 0, 600}, color: Color.get(:red)}
		obj3 = %Sphere{radius: 50, pos: {-80, 0, 400}, color: Color.get(:blue)}
		image = Tracer.tracer(camera, [obj1, obj2, obj3])
		PPM.write("snap1.ppm", image)
	end

	#Should create a picture with 3 spheres, that have some shading and shadows to them
	def snap(2) do
		camera = Camera.normal({800, 600})
		obj1 = %Sphere{radius: 140, pos: {0, 0, 700}, color: Color.get(:lime)}
		obj2 = %Sphere{radius: 50, pos: {200, 0, 600}, color: Color.get(:red)}
		obj3 = %Sphere{radius: 50, pos: {-80, 0, 400}, color: Color.get(:blue)}

		light1 = %Light{pos: {-1000, 1000, 700}, color: {50, 100, 100}}
		light2 = %Light{pos: {800, 800, 0}, color: {76, 255, 76}}
		light3 = %Light{pos: {800, -800, 0}, color: {76, 76, 255}}

		world = %World{
		objects: [obj1, obj2, obj3],
		lights: [light1, light2, light3],
		background: {0, 0, 0},
		ambient: {0.6, 0.6, 0.6}}
		image = Tracer.tracer(camera, world)
		PPM.write("snap2.ppm", image)
	end

end
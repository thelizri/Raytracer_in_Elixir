defmodule Color do

	@black {0, 0, 0}
	@white {255, 255, 255}
	@red {255, 0, 0}
	@lime {0, 255, 0}
	@blue {0, 0, 255}
	@yellow {255, 255, 0}
	@cyan {0, 255, 255}
	@magenta {255, 0, 255}

	def get(color) do
		case color do
			:black -> @black
			:white -> @white
			:red -> @red
			:lime -> @lime
			:blue -> @blue
			:yellow -> @yellow
			:cyan -> @cyan
			:magenta -> @magenta
			_ -> @white
		end
	end
end
#ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
#РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.

function krest(r::Robot)
   for side in (Nord, Sud, West, Ost)
    moves(side)
    reverse(side)
  end
  putmarker!(r)
end

function moves(side)
  while isborder(r,side) == false 
    move!(r,side)
    putmarker!(r)
  end
end

function reverse(side)
  while ismarker(r)
    move!(r,inverse(side))
  end
end

function inverse(side)
  side = HorizonSide(mod(Int(side) + 2, 4))
end




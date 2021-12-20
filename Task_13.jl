#ДАНО: Робот - в произвольной клетке ограниченного прямоугольной рамкой поля без внутренних перегородок и маркеров.
#РЕЗУЛЬТАТ: Робот - в исходном положении в центре косого креста (в форме X) из маркеров.

include("roblib.jl")

function diagonal!(r::Robot)
    stor = West
    for s in [Nord, Sud]
        draw!(r, stor, s)
        back!(r, inverse(stor), inverse(s))
    end
    stor = Ost
    for s in [Nord, Sud]
        draw!(r, stor, s)
        back!(r, inverse(stor), inverse(s))
    end
    putmarker!(r)
end

function draw!(r::Robot, side1::HorizonSide, side2::HorizonSide)
    while (isborder(r, side1) || isborder(r, side2)) == false
        move!(r, side1)
        move!(r, side2)
        putmarker!(r)
    end
end

function back!(r::Robot, side1::HorizonSide, side2::HorizonSide)
    while ismarker(r)
        move!(r, side1)
        move!(r, side2)
    end
end

diagonal!(r)
#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
#РЕЗУЛЬТАТ: Робот - в исходном положении и в углах поля стоят маркеры
include("roblib.jl")

function stavit_corner!(x::Robot)
    for side in (Nord, Ost, Sud, West)
        moves!(x, side)
        putmarker!(x)
    end
end


function post_mark_corner!(rob::Robot)
    arr = []
    go_to_corner!(rob, arr, West, Sud)
    stavit_corner!(rob)
    return_back!(rob, arr)
end

post_mark_corner!(r)
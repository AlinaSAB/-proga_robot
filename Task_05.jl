#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
#РЕЗУЛЬТАТ: Робот - в исходном положении и в углах поля стоят маркеры
include("roblib.jl")

function post_mark_corner!(r::Robot)
    koord = []
    go_to_corner!(r, koord, West, Sud)
    stavit_corner!(r)
    return_back!(r, koord)
end

function stavit_corner!(r::Robot)
    for side in (Nord, Ost, Sud, West)
        moves!(r, side)
        putmarker!(r)
    end
end
post_mark_corner!(r)

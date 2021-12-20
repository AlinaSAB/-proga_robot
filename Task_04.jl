#ДАНО: Робот - Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, следующий - весь, за исключением одной последней клетки на Востоке, следующий - за исключением двух последних клеток на Востоке, и т.д.

include("roblib.jl")

function lesenka!(r::Robot)
    koord = []
    go_to_corner!(r, koord , Ost, Sud)
    stup_leng = moves!(r, West)

    while stup_leng != 0
        idti!(r, Nord, stup_leng)
        if isborder(r, Nord)
            break
        end
        move!(r, Nord)
        moves!(r, West)
        stup_leng -= 1
    end
    moves!(r, Ost)
    moves!(r, Sud)
    return_back!(r, koord)
end

function idti!(r::Robot, side::HorizonSide, leng::Int)
    putmarker!(r)
    for i in 1:leng
        move!(r, Ost)
        putmarker!(r)
    end
end

lesenka!(r)

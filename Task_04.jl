#ДАНО: Робот - Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, следующий - весь, за исключением одной последней клетки на Востоке, следующий - за исключением двух последних клеток на Востоке, и т.д.

include("roblib.jl")

function idti!(x::Robot, side::HorizonSide, leng::Int)
    putmarker!(x)
    for i in 1:leng
        move!(x, Ost)
        putmarker!(x)
    end
end


function lesenka!(rob::Robot)
    arr = []
    go_to_corner!(rob, arr, Ost, Sud)
    leng_step = moves!(rob, West)

    while leng_step != 0
        idti!(rob, Nord, leng_step)
        if isborder(rob, Nord)
            break
        end
        move!(rob, Nord)
        moves!(rob, West)
        leng_step -= 1
    end

    moves!(rob, Ost)
    moves!(rob, Sud)

    return_back!(rob, arr)
end

lesenka!(r)
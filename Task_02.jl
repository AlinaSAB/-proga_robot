#ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы 
#https://github.com/pelmenman/mirea_julia
#https://vk.com/away.php?to=https%3A%2F%2Fgithub.com%2FKMBO-07%2FKMBO-07-20%2Ftree%2Fmain%2FKarpov%2520D.S&cc_key=

include("roblib.jl")

function idti!(x::Robot, side::HorizonSide)
    while !isborder(x, side)
        move!(x, side)
        putmarker!(x)
    end
end


function po_perimetery!(rob::Robot)
    arr = []
    go_to_corner!(rob, arr, West, Sud)

    for s in [Nord,Ost, Sud, West]
        idti!(rob, s)
    end

    return_back!(rob, arr)
end

po_perimetery!(r)
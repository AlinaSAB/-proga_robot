#ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы 

include("roblib.jl")

function po_perimetery!(r::Robot)
    koord = []
    go_to_corner!(r, koord, West, Sud)
    for stor in [Nord,Ost, Sud, West]
        idti!(r, stor)
    end
    return_back!(r, koord)
end

function idti!(r::Robot, side::HorizonSide)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end

po_perimetery!(r)

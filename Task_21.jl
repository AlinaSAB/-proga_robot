#Подсчитать число и вертикальных и горизонтальных прямолинейных перегородок (прямоугольных - нет)

include("roblib.jl")

function Task_21(r::Robot)
    side = Nord
    num=0
    while isborder(r,Ost)==false
        while isborder(r,side)==false
            if pass_borders(r,side) == true
                num += 1
                walk(r,side)
            end
        end
        move!(r,Ost)
        side = inverse(side)
    end
    return num
end
function pass_borders(r::Robot,side::HorizonSide) 
    while isborder(r,Ost)==false 
        if isborder(r,side) == true
            return false
        end
        move!(r,side) 
    end
    return true
end
function walk(r::Robot,side::HorizonSide) 
  while isborder(r,Ost)==true 
    move!(r,side)
  end
end
Task_21(r)
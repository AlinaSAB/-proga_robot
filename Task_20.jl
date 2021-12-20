#Посчитать число всех горизонтальных прямолинейных перегородок (вертикальных - нет)

include("roblib.jl")

function Task_20(r::Robot)
    side = Ost
    num = 0
    while isborder(r,Nord)== false
        while isborder(r,side)== false
            if pass_borders(r,side) == true
                num += 1
                walk(r,side)
            end
        end
        move!(r,Nord)
        side = inverse(side)
    end
    return num
end

function pass_borders(r::Robot,side::HorizonSide) 
    while isborder(r,Nord)==false 
        if isborder(r,side) == true
            return false
        end
        move!(r,side) 
    end
    return true
end

function walk(r::Robot,side::HorizonSide)
  while isborder(r,Nord) == true 
    move!(r,side) 
  end
end
Task_20(r)

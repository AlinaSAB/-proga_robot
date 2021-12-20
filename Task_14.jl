include("roblib.jl")

function Task_14(r::Robot)
    for side in (Nord,West,Sud,Ost)
        count = 1
        while count != 0
            count = obhod(r,side)
            putmarker!(r)
        end
        while ismarker(r)
            obhod(r,inverse(side))
        end
        side = inverse(next(side))
    end
putmarker!(r)
end
            
function obhod(r::Robot, side::HorizonSide)
    num_steps = 0
    while isborder(r,side) && !isborder(r,next(side))
        move!(r,next(side))
        num_steps += 1
    end
    count = 0 
    if isborder(r,side) == false
        move!(r,side)
        count += 1 
    end
    if num_steps != 0
        while isborder(r,inverse(next(side)))
            move!(r,side)
            count += 1
        end
        for s in 1:num_steps
        move!(r,inverse(next(side)))
        end
    end
    return count
end

function next(side::HorizonSide)
    return HorizonSide(mod(Int(side)+3,4))
end

Task_14(r)
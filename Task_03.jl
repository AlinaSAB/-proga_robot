#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

function Task_03(r::Robot)
    vverh = 0
    vlevo = 0
    for side in (Nord,West)
        while !isborder(r,side)
            move!(r,side)
            if side==West
                vlevo += 1
            elseif side==Nord
                vverh += 1
            end
        end 
    end
    while !isborder(r,Sud)
        right(r)
        left(r)
    end
    while !isborder(r,Ost)
        putmarker!(r)
        move!(r,Ost)
    end
    putmarker!(r)
    go(r)
    k = 0
    while k < vlevo
        move!(r,Ost)
        k +=1
    end
    k = 0
    while k < vverh
        move!(r,Sud)
        k +=1
    end
end
 
function go(r::Robot)
    for side in (Nord,West)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end

function right(r::Robot)
    while !isborder(r,Ost)
        putmarker!(r)
        move!(r,Ost)
    end
    putmarker!(r)
    move!(r,Sud)
end
    
    function left(r::Robot)
        while !isborder(r,West)
            putmarker!(r)
            move!(r,West)
        end
        putmarker!(r)
        move!(r,Sud)
    end

Task_03(r)
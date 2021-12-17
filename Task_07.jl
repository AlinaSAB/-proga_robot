#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля (без внутренних перегородок)
#РЕЗУЛЬТАТ: Робот - в исходном положении, в клетке с роботом стоит маркер, и все остальные клетки поля промаркированы в шахматном порядке

function Task_07(r)
    putmarker!(r)

    check(r, Nord)

    #пойдем налево, потом направо и начнем заполнять змейкой
    check(r, West)

    dir = Ost
    while !isborder(r, Sud) || !isborder(r, Ost)
        check(r, dir)
        marked = false
        if ismarker(r)
            marked = true
        end
        if !isborder(r, Sud)
            moveStep(r, Sud, !marked, true)
        end
        dir = inverseSide(dir)
    end
end

function check(r, side)
    marked = false
    while !isborder(r, side)
        if ismarker(r)
            marked = true
        end
        moveStep(r, side, !marked, true)
        marked = false
    end 
end

function moveStep(r, side, needMark, check=false)
    move!(r, side)
    if needMark
        if check
            if ismarker(r)
                return 0
            end
        end
        putmarker!(r)
    end
end

function inverseSide(side)
    return HorizonSide(mod(Int(side)+2, 4))
end
Task_07(r)
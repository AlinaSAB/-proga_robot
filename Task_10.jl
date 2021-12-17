#ДАНО: Робот - в юго-западном углу поля, на котором расставлено некоторое количество маркеров
#РЕЗУЛЬТАТ: Функция вернула значение средней температуры всех замаркированных клеток
function Task_10(r::Robot)
    sum = 0 
    kolvo = 0
    side = Ost
    while isborder(r,Nord) == false
        s, c =moves!(r,side)
        sum+=s
        kolvo +=c
        side = inverse(side)
    end
    s, c=moves!(r,side)
    sum+=s
    kolvo +=c
    return (sum/kolvo)
end
function moves!(r::Robot,side::HorizonSide)
    sum = 0 
    kolvo = 0
    while isborder(r,side) == false
        if ismarker(r) == true
            kolvo+=1
            sum+= temperature(r)
        end
        move!(r,side)
    end
    if isborder(r,Nord) == false
        move!(r,Nord)
    end
    return sum, kolvo
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
Task_10(r)
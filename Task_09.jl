#ДАНО: Где-то на неограниченном со всех сторон поле и без внутренних перегородок имеется единственный маркер. Робот - в произвольной клетке поля.
#РЕЗУЛЬТАТ: Робот - в клетке с тем маркером.
function Task_09(r)
    Steps = 1
    while !ismarker(r)
        for side in (Nord, Ost)
            i = 0
            while i != Steps
                if ismarker(r)
                    break
                end
                move!(r, side)
                i += 1
                
            end
        end

        Steps += 1
        for side in (Sud, West)
            i = 0
            while i != Steps
                if ismarker(r)
                    break
                end
                move!(r, side)
                i += 1
                
            end
        end

        Steps += 1
    end
end

Task_09(r)
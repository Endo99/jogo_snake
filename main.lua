require('game')
--VARIAVEL DE VELOCIDADE UTILIZADA EM MAIN.LUA
speedSnake = 60

function love.load()
    

    love.mouse.setVisible(false)
    --intervalo de moviment -- velocidade de movimento
    interval = speedSnake
    add_apple()

end


function love.keypressed(key)

    if key == 'up' then
        up=true; down=false; right=false; left=false; 
    elseif key == 'down' then
        up=false; down=true; right=false; left=false;    
    elseif key == 'right' then
        up=false; down=false; right=true; left=false;    
    elseif key == 'left' then
        up=false; down=false; right=false; left=true;

    elseif key == 'escape' then
        love.event.quit()
    end
end

function love.update()
    interval = interval -1
    if interval < 0 then
        game_update()
        interval = speedSnake
    end
end



function love.draw()
    game_draw()
end

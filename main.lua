
-- Largura do personagem
w = 15

-- ALtura do personagem
h = 15

--Pega a largura total da Tela
larguraTela = love.graphics.getWidth()

--Pega a altura total da Tela
alturaTela = love.graphics.getHeight()

function love.load()
    love.mouse.setVisible(false)
    -- Personagem
    snake = {
        posX = larguraTela / 2, 
        posY = alturaTela / 2,
        speedSnake = 100
    }
    -- Personagem

    -- Maça
    apple = love.graphics.newImage("Imagens/Maca.jpg")
    delayAppear = 0.1
    timerAppearApple = delayAppear
    apples = {}
    getApple = true
    
    -- Maça



end

function love.update(dt)
    
end

--controle dos movimentos do personagem
function moveSnake(dt)

    if love.keyboard.isDown("down") then
        if snake.posY < (alturaTela - h / 2) then 
            snake.posY = snake.posY + snake.speedSnake * dt
        end
    end

    if love.keyboard.isDown("up") then
        if snake.posY > (0 + h / 2) then
            snake.posY = snake.posY - snake.speedSnake * dt
        end
    end

    if love.keyboard.isDown("left") then
        if snake.posX > (0 + w / 2) then
            snake.posX = snake.posX - snake.speedSnake * dt
        end
    end

    if love.keyboard.isDown("right") then
        if snake.posX < (larguraTela - w / 2) then
        snake.posX = snake.posX + snake.speedSnake * dt
        end
    end

end

-- Método que faz para ele ficar em movimento
function movimentarSnake(dt)

end

-- Método que faz para pegar a maçã
function pegarMaca(dt)

end

-- Aparecer a maçã aleatoriamente na tela
function randomMaca(dt)
    timerAppearApple = timerAppearApple - (1 * dt)
    if timerAppearApple < 0 then
        getApple = true
    end

    newApple = {xMac = love.math.random(50, 700),yMac = love.math.random(50, 500),
    newImageApple = apple }
    table.insert(apples, newImageApple)
    getApple = false
    timerAppearApple = delayAppear

    for i, mace in ipairs (apples) do
        apple.yMac = apple.yMac - (500 * dt)
        if apple.yMac < 0 then
            table.remove(apples, i)
        end
    end
end

-- Fila, acrescenta o tamanho da cauda
function aumentarTamanhoSnake(dt)

end

function love.draw()
    love.graphics.setBackgroundColor(255, 255, 255)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(apple, xMac, yMac)
    love.graphics.setColor(0, 255, 255)
    love.graphics.circle("fill", snake.posX, snake.posY, w, h)
    
end

--[[
function love.keypressed(key)
    if key ~= "start" then
        love.graphics.setColor(255, 0, 0)
        love.graphics.print("Press start for begin", x, y)
    elseif key == "start" then
        love.graphics.circle("fill", x, y, w, h, rot, origem, origem)
    end
end
--]]

--[[
function love.keypressed(key, unicode)
    if key ~= "escape" then
        texto = "A tecla " .. key .. " foi pressionada."
    elseif key == "escape" then
        love.quit()
    end
end
--]]

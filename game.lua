--Pega a largura total da Tela
local larguraTela = love.graphics.getWidth()
--Pega a altura total da Tela
local alturaTela = love.graphics.getHeight()

SIZE = 30

local snake = {
    posX = 15, 
    posY = 15,
    tail_lenght = 0
}

local tail = {}

local apple = {
    posX = 0,
    posY = 0,
}



-- Variáveis globais para saber para onde a cobra está andando
up = false
down = false
right = false
left = false

-- Variáveis utilizadas para movimentar a cobra
local dirX = 0
local dirY = 0


function game_draw()
    -- for i, mace in ipairs (apples)
    -- do
    --     love.graphics.draw(mace.apple, mace.xMac, mace.yMac, 0, 1, 1,
    --     apple:getWidth() / 2, apple.getHeight())
    -- end

    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(0.5, 2.05, 0.5)
    --CABEÇA DA COBRA
    love.graphics.circle("fill", snake.posX*SIZE, snake.posY*SIZE, 15,15, 30, 10)    
    --RABO DA COBRA
    for _, v in ipairs(tail) do
        love.graphics.circle("fill", v[1]*SIZE, v[2]*SIZE, 15,15, 30, 10)
    end

    love.graphics.setColor(1.0,0.35,0.4,1.0)
    love.graphics.circle("fill", apple.posX*SIZE, apple.posY*SIZE, 15,15, 30, 10)
    
end


function add_apple()
    math.randomseed(os.time())
    apple.posX = math.random(SIZE-5)
    apple.posY = math.random(SIZE-5)
end


-- --controle dos movimentos do personagem
function game_update()

    -- movimenta a cobra sozinha para a direção encolhida
    if up then
        dirX, dirY = 0, -1
    elseif down then
        dirX, dirY = 0, 1
    elseif left then
        dirX, dirY = -1, 0
    elseif right then
        dirX, dirY = 1, 0
    end

    local oldX = snake.posX 
    local oldY = snake.posY


    snake.posX = snake.posX + dirX
    snake.posY = snake.posY + dirY


    --GERA OUTRA MAÇA E AUMENTA O RABO
    if snake.posX == apple.posX and snake.posY == apple.posY then
        add_apple()
        snake.tail_lenght = snake.tail_lenght + 1
        table.insert(tail,{0,0})
    end

    -- VOLTA NO OUTRO CANTO DA TELA QUANDO ENCOSTA
    if snake.posX < 0 then
        snake.posX = SIZE - 1
    elseif snake.posX > SIZE-1 then
        snake.posX = 0    
    elseif snake.posY < 0 then
        snake.posY = SIZE - 1 
    elseif snake.posY > SIZE-1 then
        snake.posY = 0
    end

    if snake.tail_lenght > 0 then
        for _, v in ipairs(tail) do
            local x,y = v[1], v[2]
            v[1],v[2] = oldX, oldY
            oldX, oldY = x,y
        end
    end

    -- for _, v in ipairs(tail) do
    --     if snake.posX == v[1] and snake.posY == v[2] then
    --     state = 


end


function game_restart()
end




-- Método que faz para ele ficar em movimento
function movimentarSnake(dt)

end

-- Método que faz para pegar a maçã
function pegarMaca(dt)

end

-- Aparecer a maçã aleatoriamente na tela
-- Não aparece a maçã, acho que fiz algo de errado.
-- function randomMaca(dt)
--     timerAppearApple = timerAppearApple - (1 * dt)
--     if timerAppearApple < 0 then
--         getApple = true
--     end

--     if love.keyboard.isDown("space") and getApple then
--         newApple = { xMac = x,yMac = y,
--         newImageApple = apple }
--         table.insert(apples, newImageApple)
--         getApple = false
--         timerAppearApple = delayAppear
--     end

--     for i, mace in ipairs (apples) 
--     do
--         apple.yMac = apple.yMac - (500 * dt)
--         if apple.yMac < 0 then
--             table.remove(apples, i)
--         end
--     end
-- end
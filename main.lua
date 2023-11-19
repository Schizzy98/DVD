--[[
    @Author Madeline
    @Title DVD Bounce thingy
    @Description - First program I made using love2d
    @Version 0.1.0
]]

local pos_x = 0
local pos_y = 0
local pos_w = 100
local pos_h = 50

local velocity = {1, 1}

function love.load()
    love.window.setTitle("DVD")
end

function love.update(dt)
    pos_x, pos_y = pos_x + velocity[1], pos_y + velocity[2]
    if pos_x + pos_w > love.graphics.getWidth() then --If the right side of the rectangle collides with the right side of the screen
        velocity[1] = -1 --Go left
    end
    if pos_y + pos_h > love.graphics.getHeight() then --Same as above but with bottom of both the rectangle and the screen
        velocity[2] = -1 --Go up
    end

    if pos_y < 0 then --If the top of the rectangle goes below zero (aka the top of the screen)
        velocity[2] = 1 --Go down
    end

    if pos_x < 0 then --If the left part of the rectangle collides with the left side of the screen
        velocity[1] = 1 --Go right
    end
end

function love.draw()
    love.graphics.rectangle("fill", pos_x, pos_y, pos_w, pos_h)
end
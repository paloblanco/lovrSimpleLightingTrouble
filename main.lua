shader = require 'shader'

function lovr.load()
      
    camx, camy, camz = 0,2,5
    tx,ty,tz = 0,0,0
    lx,ly,lz = 0,-0.5,3
    ldist=2
    angle = 0
    anglel = 0

    local camfrom = lovr.math.vec3(camx,camy,camz)
    local camto = lovr.math.vec3(tx,ty,tz)
    local camup = lovr.math.vec3(0,1,0)

    local cammat = lovr.math.mat4()
    cammat:lookAt(camfrom,camto,camup)  
    local camme = lovr.math.mat4()
    camme:target(camfrom,camto,camup)
    lovr.graphics.setViewPose(1,cammat,true)
    shader:send('lightPos', {camx,camy,camz})
    matrix = camme

    keypress = false
end

function lovr.keypressed(key)
    if key=='space' then keypress = true end
end
function lovr.keyreleased(key)
    if key=='space' then keypress = false end
end


function lovr.update(dt)
    
    
    if keypress then
        angle = angle + dt
    end

    anglel = anglel + dt

    lz = ldist * math.sin(anglel) * -1.0
    ly = -.5
    lx = ldist * math.cos(anglel)

    shader:send('lightPos', {lx,ly,lz})
    shader:send('viewPos',{camx,camy,camz})

end

function lovr.draw()
    lovr.graphics.setShader(shader)
    lovr.graphics.setColor(1,1,1,1)
    lovr.graphics.cube('fill',
                        tx,ty,tz,
                        2,
                        angle,0,1,0)
    lovr.graphics.setColor(0.5,0.5,1,1)
                        lovr.graphics.cube('fill',
                        tx,ty-6,tz-3,
                        8,
                        0,0,1,0)
    lovr.graphics.setColor(1,1,1,1)
    lovr.graphics.cube('fill',
                        lx,ly,lz,
                        .25,
                        anglel,0,1,0)
                    

end
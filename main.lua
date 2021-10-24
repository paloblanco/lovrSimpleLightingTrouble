shader = require 'shader'

function lovr.load()
      
    camx, camy, camz = 0,2,5
    tx,ty,tz = 0,0,0
    angle = 0

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
end
  
function lovr.update(dt)
    angle = angle + dt
end

function lovr.draw()
    lovr.graphics.setShader(shader)
    lovr.graphics.setColor(1,1,1,1)
    lovr.graphics.cube('fill',
                        tx,ty,tz,
                        2,
                        angle,0,1,0)
end
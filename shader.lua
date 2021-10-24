defaultVertex = lovr.filesystem.read("shaderv.vs")
defaultFragment = lovr.filesystem.read("shaderf.fs")

shader = lovr.graphics.newShader(defaultVertex, defaultFragment, {})

shader:send('ambience', { 0.2, 0.2, 0.2, 1.0 })
shader:send('liteColor', {1.0,1.0,1.0,1.0})
shader:send('lightPos', {0.0,2.0,5.0})

shader:send('specularStrength', 0.5)
shader:send('metallic',32.0)
shader:send('viewPos',{0.0,2.0,5.0})


return shader


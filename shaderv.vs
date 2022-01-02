
    out vec3 FragmentPos;
    out vec3 Normal;

    vec4 position(mat4 projection, mat4 transform, vec4 vertex) 
    { 
        Normal = lovrNormalMatrix * lovrNormal;
        FragmentPos = vec3(lovrModel * vertex);
        
        return projection * transform * vertex; 
    }

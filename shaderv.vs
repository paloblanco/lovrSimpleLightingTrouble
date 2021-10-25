out vec3 lightDirection; // A vector from the vertex to the light
out vec3 normalDirection;
out vec3 vertexPosition;
out vec3 FragmentPos;
out vec3 LightPos;

uniform vec3 lightPos;

vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
    vec4 vVertex = transform * vec4(lovrPosition, 1.);
    vec4 vLight = lovrView * vec4(lightPos, 1.);
    lightDirection = normalize(vec3(vLight - vVertex));
    normalDirection = normalize(lovrNormalMatrix * lovrNormal);
    vertexPosition = vVertex.xyz;
    
    FragmentPos = vec3(lovrModel * vertex);
    LightPos = lightPos;

    return projection * transform * vertex;
}
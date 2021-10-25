uniform vec3 lightPos;

out vec3 lightDirection; // A vector from the vertex to the light
out vec3 normalDirection;
out vec3 vertexPosition;

vec4 position(mat4 projection, mat4 transform, vec4 vertex) {
    // vec3 lightPosition = vec3(0., 10., 3.);
    vec4 vVertex = transform * vec4(lovrPosition, 1.);
    vec4 vLight = lovrView * vec4(lightPos, 1.);
    lightDirection = normalize(vec3(vLight - vVertex));
    normalDirection = normalize(lovrNormalMatrix * lovrNormal);
    vertexPosition = vVertex.xyz;
    return projection * transform * vertex;
}
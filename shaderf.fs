in vec3 lightDirection;
in vec3 normalDirection;
in vec3 vertexPosition;
in vec3 FragmentPos;

uniform vec4 ambience;
uniform vec4 liteColor;
in vec3 LightPos;

uniform vec3 viewPos;
uniform float specularStrength;
uniform float metallic;

vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) {
    
    
    //diffuse    
    float diff = max(dot(normalDirection, lightDirection), 0.);
    vec4 diffuse = diff * liteColor;


    // specular
    vec3 viewDirection = normalize(viewPos - FragmentPos);
    vec3 lightDir2 = normalize(LightPos - FragmentPos);
    vec3 r = reflect(-lightDir2, normalDirection);
    float specularAngle = max(dot(r, viewDirection), 0.);
    float spec = pow(specularAngle, metallic);
    vec4 specular = spec * liteColor * specularStrength;
  
    vec4 baseColor = graphicsColor * texture(image, uv);            
    return baseColor * (ambience + diffuse + specular);
}
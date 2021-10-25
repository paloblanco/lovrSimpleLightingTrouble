uniform vec4 ambience;

uniform vec4 liteColor;
uniform vec3 lightPos;

in vec3 Normal;
in vec3 FragmentPos;

uniform vec3 viewPos;
uniform float specularStrength;
uniform int metallic;

vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) 
{    
    //diffuse
    vec3 norm = normalize(Normal);
    vec3 lightDir = normalize(lightPos - FragmentPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec4 diffuse = diff * liteColor;

    //specular
    vec3 viewDir = normalize(viewPos - FragmentPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), metallic);
    vec4 specular = specularStrength * spec * liteColor;
                    
    vec4 baseColor = graphicsColor * texture(image, uv);            
    return baseColor * (ambience + diffuse +specular);
}
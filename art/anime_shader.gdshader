shader_type spatial; // It just declares the shader that it's 3D.
render_mode ambient_light_disabled; //Stop the influence of the ambient light from affecting the shader

// All input values for the shader, when working with colors always set to source_color to convert to Linear colorspace.

uniform float fresnelThreshold : hint_range(0,1) = 0.8; // Hint range sets the the range of values in this 0.0 - 1.0 and the default is 0.8;
uniform float lightThreshold : hint_range(0,1) = 0.4;
uniform float lightIntensity : hint_range(0,10) = 1.0;
uniform vec3 sunColor: source_color = vec3(1.0);
uniform vec3 fresnelColor: source_color = vec3(0.6);

//Declares the textures that need to have an input in the shader

uniform sampler2D BASE: source_color;
uniform sampler2D SSS: source_color;

// Blend mode for 'Color Dodge'.

vec3 colorDodge(vec3 BASE_BLEND, vec3 BLEND) {
  vec3 RESULT;

  for (int i = 0; i <= 2; i++)
    if (BLEND[i] == 1.0) {
      RESULT[i] = 1.0;
    } else {
      RESULT[i] = BASE_BLEND[i] / (1.0 - BLEND[i]);
    }

  return RESULT;
}

void light() {
  // Initializes the texture for use.

  vec4 baseColor = texture(BASE, UV);
  vec4 sssColor = texture(SSS, UV);

  // The 3 lighting models used in this shader; PHONG, BLINN PHONG, FRESNEL

  // The actual light vector for the sun and the model!
  float NDotL = dot(NORMAL,LIGHT);
  // The specular model used in metal or shiny stuff!
  float NDotHV = dot(NORMAL, normalize(VIEW + LIGHT));
  // The fresnel you would see around the model!
  float NDotV = dot(NORMAL, VIEW);


  // Makes the light result from -1 to 1 -> 0 - 1, so you can read and use math easier.
  float lightResult = (NDotL + 1.0) * 0.5;
  // Mixes NdotV * NDotHV for a mixed lighting for fresnel with sun influence then inverts.
  float fresnelResult = (1.0 - (NDotV * NDotHV));
  // Filters out the alpha of the BASE texture for the fresnel mask
  float fresnelMask = (baseColor.a > .95) ? 1.0 : 0.0;

  // Combines the result of fresnelMask and fresnelResult to get the filtered out fresnel for the character.
  fresnelResult = fresnelMask * fresnelResult;
  // Makes the binary (toon) shading possible using the threshold to see whether the light is > than it.
  lightResult = (NDotL > lightThreshold) ? 1.0 : 0.0; 
  // Finally makes the toon shading for the fresnel
  fresnelResult = ( fresnelResult > fresnelThreshold) ? 1.0 : 0.0;


  // Filters the BASE and SSS for the light.
  vec3 finalColor = mix(sssColor.rgb, baseColor.rgb, lightResult);
  // Filters the final color and decides what gets the blendmode via fresnel result.
  finalColor = mix(finalColor, colorDodge(finalColor,fresnelColor), fresnelResult);

  //Changes the color of sun and intensity of it.
  finalColor = finalColor * sunColor * lightIntensity;

  // Final Color Output
  DIFFUSE_LIGHT = finalColor;

}

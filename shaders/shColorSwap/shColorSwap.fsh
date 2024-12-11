//
// Simple color swapper
//

// Base init
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Color From (Tol)erance
uniform float tol;
// Change Pixel (C)olor (From)...
uniform vec4  cFrom;
// Change Pixel (C)olor (To)...
uniform vec4  cTo;
// (Over)ride Discard...
uniform bool  over;

void main() {
	
	// Inits
	// Get Current Pixel (C)olor
	vec4 c = v_vColour*texture2D(gm_BaseTexture,v_vTexcoord);
	// Color From (Tol)erance as Percentile(pct)
	float tolPct = tol/255.0;
	bool success = false;
	
	// Check for match; Make Change
	// Red
	if(abs(c.r - cFrom.r) <= tolPct) {
		
		// Green
		if(abs(c.g - cFrom.g) <= tolPct) {
			
			// Blue
			if(abs(c.b - cFrom.b) <= tolPct) {
				
				// Change Color
				c.rgb = cTo.rgb;
				success = true;
				
			}
			
		}
		
	}
	
	// Apply
	if(success && !over) gl_FragColor = c;
	else discard;
	
}

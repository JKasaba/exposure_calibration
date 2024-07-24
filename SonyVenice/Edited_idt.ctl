
// <ACEStransformID>urn:ampas:aces:transformId:v1.5:ACEScsc.Academy.SLog3_Venice_SGamut3_to_ACES.a1.1.0</ACEStransformID>
// <ACESuserName>Sony S-Log3 VENICE S-Gamut3 to ACES2065-1</ACESuserName>

//
// ACES Color Space Conversion - Sony S-Log3 VENICE S-Gamut3 to ACES
//
// converts Sony S-Log3 VENICE S-Gamut3 to
//          ACES2065-1 (AP0 w/ linear encoding)
//



import "ACESlib.Utilities_Color";


const float VENICE_SGAMUT3_2_AP0_MAT[3][3] =
                        calculate_rgb_to_rgb_matrix( SONY_VENICE_SGAMUT3_PRI,
                                                     AP0, 
                                                     CONE_RESP_MAT_CAT02);


float SLog3_to_lin( input varying float in)
{
    float out;
    if ( in >= 171.2102946929 / 1023.0 )
    {
        out = pow(10.0, (in * 1023.0 - 420.0) / 261.5) * (0.18 + 0.01) - 0.01;
    }
    else
    {
        out = (in * 1023.0 - 95.0) * 0.01125000 / (171.2102946929 - 95.0);
    }
    return out;
}



void main
(   
    input varying float rIn,
    input varying float gIn,
    input varying float bIn,
    output varying float rOut,
    output varying float gOut,
    output varying float bOut,
    output varying float aOut,
    input varying float aIn = 1.0
)
{
    float lin_SGamut3[3];
    lin_SGamut3[0] = SLog3_to_lin( rIn) * (.18/.179);
    lin_SGamut3[1] = SLog3_to_lin( gIn) * (.18/.179);
    lin_SGamut3[2] = SLog3_to_lin( bIn) * (.18/.179);

    float ACES[3] = mult_f3_f33( lin_SGamut3, VENICE_SGAMUT3_2_AP0_MAT);
  
    rOut = ACES[0];
    gOut = ACES[1];
    bOut = ACES[2];
    aOut = aIn;
}
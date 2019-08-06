#version 3.7;
#include "textures.inc"
#include "math.inc"
#include "woods.inc"
global_settings {
	assumed_gamma 1.0
}

//For easy debugging
#declare T=clock;

//Default camera
camera {
	perspective
	angle 75
	right x*image_width/image_height
	location  <-6.0+T, 25.0 ,-25.0>
	look_at   <0.0 , 2.0 , 0.0>
	//rotate <0,T*360,0>
}

//Sun
light_source{ <1500,2500,-2500>
	color rgb<1,1,1>
}

sky_sphere{ pigment{color rgb<0.4,0.6,1>}}

//Bouncing ball
sphere{ <0,1.5,0>, 0.5
	texture {
		pigment{ rgb<1,1,1> }
		finish {
			reflection 0 
			diffuse 1
			phong 0.1
		}
	}
	translate <20*abs(T)-10,9*abs(cos(abs(T)*20/pi)), 0>
	//translate <0,5*abs(cos(abs(T)*pi/10)), 0>
}

//Blue platform
box { <-10,0,-5>,<10,1,5>
	pigment{
		color rgb<0,0,0.2>
	}
	finish{
		ambient 0.3
		diffuse 1
		reflection 0.1
		phong 1
	}
}


//White stripes on perimeter of blue platform
box { <-10,1,-5>,<-9,1.1,5>
	pigment{
		color rgb<1,1,1>
	}
	finish{
		reflection 0.2
	}
}
box { <10,1,-5>,<9,1.1,5>
	pigment{
		color rgb<1,1,1>
	}
	finish{
		reflection 0.2
	}
}
box { <-10,1,-5>,<10,1.1,-4>
	pigment{
		color rgb<1,1,1>
	}
	finish{
		reflection 0.2
	}
}
box { <-10,1,5>,<10,1.1,4>
	pigment{
		color rgb<1,1,1>
	}
	finish{
		reflection 0.2
	}
}
//White net
box { <-0.05,1,-6>,<0.05,3,6>
	pigment{
		color rgb<1,1,1>
	}
	finish{
		reflection 0.1
	}
}
//White thin center line
box{ <-10,1,-0.01>,<10,1.1,0.01>
	pigment{
		color rgb<1,1,1>
	}
	finish{
		reflection 0.1
	}
}
 
//Red glass paddle/circle
cylinder{ <-10.5,10.5,0>,<-10.6,10.5,0>, 3  
	texture{Ruby_Glass}
	pigment{
		color rgb<1,0,0>
	}
}
cylinder{ <10.5,10.5,0>,<10.6,10.5,0>, 3
	texture{Ruby_Glass}
	pigment{
		color rgb<1,0,0>
	}
}

//Glass wall
box{<-10.6,0,-5>,<-10.7,13.5,5>
	texture{Glass}
}
box{<10.6,0,-5>,<10.7,13.5,5>
	texture{Glass}
}

//Wood floor
box{<-15,0,-10>,<15,-1,10>
	texture{T_Wood15}
}

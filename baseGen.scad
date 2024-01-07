//Wargaming base
//Thomas Garaside 2023 

$fn=100;
//circle or square 
square=true;


//config vars 
height=4; 
bevelOffset=1;
wallThick=2;
//round only 
diameter=32;
//make an oval base 
transform=0;
//square /rect only 
length=25;
width=25;

//make a slotta base 
slot=true;
slotWidth=3; 
slotOfset=6; //space from edge to slot *2 it was not


// base adaptor
adaptorRound=false;
adaptorSquare=false;
squareSize=20; 
adaptorOffset=2;

//add magnet 
magnetCut=false;
magnetRadius=5;
magHeight=3.5;
//base hollow for magnets 
baseHollow=true;
// add corner magnets ?? 

//calculated vars (do not change)
majorRad=diameter/2;
adaptorRad=squareSize/2;

difference(){
union(){ 
    if(!square){
        resize(newsize=[transform,0,0]){
        cylinder(h=height,r1=majorRad,r2=majorRad-1,center=true);
        }
    }
    else{
    lenVal=length/2; 
    widthVal=width/2;
    topLenVal = lenVal - bevelOffset;
    topWidthVal = widthVal - bevelOffset;
    
        //cube([length,width,height],center=true);
        polyhedron([[lenVal,widthVal,0], [-lenVal,widthVal,0],[-lenVal,-widthVal,0],[lenVal,-widthVal,0],
                    [topLenVal,topWidthVal,height],
                    [-topLenVal,topWidthVal,height],[-topLenVal,-topWidthVal,height],[topLenVal,-topWidthVal,height]
                   ],[
                   [0,1,2,3],  // bottom
                   [4,5,1,0],  // front
                   [7,6,5,4],// top
                   [5,6,2,1],  // right
                   [6,7,3,2],  // back
                   [7,4,0,3]] // left]
        );
      
    }
    
     
}
union(){
    if(slot){
    if(!square){
       
            cube([diameter-slotOfset,slotWidth,height+5],center=true);
    }
    else{
             cube([width-slotOfset,slotWidth,height+5],center=true);
    }
    }
    if(adaptorRound){
    translate([0,0,adaptorOffset]){
        cube([squareSize,squareSize,height+1],center=true);
       
        }
      
    }
    if(adaptorSquare){
    translate([0,0,adaptorOffset]){
       cylinder(h=height,r=adaptorRad,center=true);
       
        }
      
    }
    
    if(magnetCut){
        cylinder(h=magHeight,r=magnetRadius, center=true );
    }
    if(baseHollow){
        if(!square){
            translate([0,0,-wallThick]){
                resize(newsize=[transform,0,0]){
                    cylinder(h=height,r1=majorRad,r2=majorRad-wallThick,center=true);;
                }
            }
        }
        else{
        translate([0,0,-wallThick]){
         
            lenVal=length/2-wallThick; 
    widthVal=width/2-wallThick;
    topLenVal = lenVal - bevelOffset;
    topWidthVal = widthVal - bevelOffset;
    
        //cube([length,width,height],center=true);
        polyhedron([[lenVal,widthVal,0], [-lenVal,widthVal,0],[-lenVal,-widthVal,0],[lenVal,-widthVal,0],
                    [topLenVal,topWidthVal,height],
                    [-topLenVal,topWidthVal,height],[-topLenVal,-topWidthVal,height],[topLenVal,-topWidthVal,height]
                   ],[
                   [0,1,2,3],  // bottom
                   [4,5,1,0],  // front
                   [7,6,5,4],// top
                   [5,6,2,1],  // right
                   [6,7,3,2],  // back
                   [7,4,0,3]] // left]
        );
      
        
        }}
    
    }

}

}
{
  dia = diameter + thick;
  for(j = [0:1:2]) {
    translate([0,j*( sqrt(  dia*dia - dia*dia/4  ) ),0]) {
      for(i = [0:dia:dia*5+(j%2)*dia]) {
        translate([i + (j%2)*(-dia/2),0,0]){
          difference() {
            linear_extrude(height = 2) circle(diameter/2+thick);
            linear_extrude(height = 2) circle(diameter/2);
          }
        }
      }
    }
  }
}

module stand(diameter, h, thick) {
  difference(){
    union(){
      difference(){
        linear_extrude(height = h) circle(diameter/2+thick);
        linear_extrude(height = h) circle(diameter/2);
      }
      translate([0,0,h-2]){
        linear_extrude(height = 5) circle(diameter/2);
      }
    }
    translate([0,0,h-2]){
      linear_extrude(height = 5) circle(diameter/2-1);
    }
  }
}


thick = 3;
internal_diameter = 25;

top_layer(internal_diameter, thick);
translate([-internal_diameter,-internal_diameter,0])
    stand(25, 40, thick);
translate([-internal_diameter,-(2*internal_diameter + 3*thick),0])
    stand(25, 40, thick);


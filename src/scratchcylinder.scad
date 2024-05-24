use <modules.scad>
use <util-func.scad>

$fn=100;
spike_hight = 3;
spike_bottom_radius = 1.2;
roller_l=50;
roller_r=10;
//single_spike(spike_hight, spike_bottom_radius);


module sigle_spike_ring()
{
    spike_r=cos(asin(spike_bottom_radius/roller_r))*spike_bottom_radius;
    num=floor(360/asin(spike_bottom_radius/roller_r));
    echo(num);
    angle=floor(360/num*2);
    echo(angle);
    //1layer,last layer = spike_bottom_radius;
    //2layer =+ cos(30)*spike_bottom_radius*2;
    //etc...
    layer=floor((50-2*(spike_bottom_radius))/(cos(30)*spike_bottom_radius));
//    echo(layer+2);
//    rotate([0,90,0]) 
//        single_spike(spike_hight , spike_bottom_radius );
    for(round=[0:angle:360])
    {
        point=pointXYZ([roller_r,90,round]);
//        echo(spike_r,round,point);
        translate(point)
        {
            rotate([0,90,round]) 
            single_spike(spike_hight, spike_bottom_radius);
        }
    }
    
}

cylinder(roller_l, roller_r,roller_r);
translate([0,0,spike_bottom_radius]) 
    sigle_spike_ring();
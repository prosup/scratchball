use <modules.scad>
use <util-func.scad>

$fn=100;
spike_hight = 3;
spike_bottom_radius = 1.2;
roller_l=50;
roller_r=10;
//single_spike(spike_hight, spike_bottom_radius);
//number of spike per layer
num=floor(360/asin(spike_bottom_radius/roller_r));
//    echo(num);
//
angle=(360/num*2);

module sigle_spike_ring()
{
    spike_r=cos(asin(spike_bottom_radius/roller_r))*spike_bottom_radius;

//    echo(angle);
    //1layer,last layer = spike_bottom_radius;
    //2layer =+ cos(30)*spike_bottom_radius*2;
    //etc...

    for(round=[0:1:num])
    {
        point=pointXYZ([roller_r,90,round*angle]);
//        echo(spike_r,round,point);
        translate(point)
        {
            rotate([0,90,round*angle]) 
            single_spike(spike_hight, spike_bottom_radius);
        }
    }
    
}

cylinder(roller_l, roller_r,roller_r);
//translate([0,0,spike_bottom_radius]) 
//    sigle_spike_ring();
module piller_of_spike()
{
    layer=floor((roller_l-4*(spike_bottom_radius))/(sin(60)*spike_bottom_radius*2));
    echo(sin(60));
    echo("",(sin(60)*spike_bottom_radius*2));
    echo("layer",layer);
    step=(roller_l-spike_bottom_radius*4)/layer;
    echo("step",step);
    for(l=[1:1:layer])
    {
        layer_h=step*l+spike_bottom_radius;
        translate([0,0,layer_h])
        {
//            echo(l*angle);
            angle_l=l*asin(spike_bottom_radius/roller_r);
            rotate([0,0,angle_l]) 
            {
                sigle_spike_ring();
            }
        } 
    }
}

piller_of_spike();
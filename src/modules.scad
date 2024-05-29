use <util-func.scad>

//滚状模型只需要尖刺，其他删除，其他删除
module single_spike(spike_hight,spike_bottom_radius)
{
    cylinder(h = spike_hight, r1=spike_bottom_radius,r2=0);
}
use <util-func.scad>
module sigle_spike_ring(ring_radius,spike_hight,spike_bottom_radius)
{
    spike_r=cos(asin(spike_bottom_radius/ring_radius))*spike_bottom_radius;
    num=floor(360/asin(spike_bottom_radius/ring_radius));
    angle=(360/num*2);

//    echo(angle);
    //1layer,last layer = spike_bottom_radius;
    //2layer =+ cos(30)*spike_bottom_radius*2;
    //etc...

    for(round=[0:1:num])
    {
        point=pointXYZ([ring_radius,90,round*angle]);
//        echo(spike_r,round,point);
        translate(point)
        {
            rotate([0,90,round*angle]) 
            single_spike(spike_hight, spike_bottom_radius);
        }
    }
    
}

module piller_of_spike(layer,piller_radius,spike_hight,spike_bottom_radius)
{
//    roller_l=piller_hight;
    roller_r=piller_radius;
//    layer=floor((roller_l-4*(spike_bottom_radius))/(sin(60)*spike_bottom_radius*2));
    echo(sin(60));
    echo("",(sin(60)*spike_bottom_radius*2));
    echo("layer",layer);
//    step=(roller_l-spike_bottom_radius*4)/layer;
    step=(sin(60)*spike_bottom_radius*2);
    echo("step",step);
    for(l=[0:1:layer])
    {
        layer_h=step*l+spike_bottom_radius;
        translate([0,0,layer_h])
        {
//            echo(l*angle);
            angle_l=l*asin(spike_bottom_radius/roller_r);
            rotate([0,0,angle_l]) 
            {
                sigle_spike_ring(roller_r,spike_hight,spike_bottom_radius);
            }
        } 
    }
}

module joint(joint_radius,joint_hight) {
    cylinder(joint_hight, joint_radius,joint_radius);
  
}
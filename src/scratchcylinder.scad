use <modules.scad>
use <util-func.scad>

$fn=100;
spike_hight = 3;
spike_bottom_radius = 1.2;
roller_l=20*(sin(60)*spike_bottom_radius*2)+2*spike_bottom_radius;
roller_r=10;
joint_hight=spike_bottom_radius*2;
joint_radius=5;
layer=20;
//single_spike(spike_hight, spike_bottom_radius);
//number of spike per layer
//    echo(num);
//



//cylinder(roller_l, roller_r,roller_r);
//translate([0,0,spike_bottom_radius]) 
//    sigle_spike_ring();
joint(joint_radius, joint_hight);
translate([0,0,roller_l+2*spike_bottom_radius]) 
    joint(joint_radius, joint_hight);
translate([0,0,2*spike_bottom_radius]) 
cylinder(roller_l, roller_r,roller_r);
translate([0,0,2*spike_bottom_radius]) 
piller_of_spike(layer,roller_r,spike_hight,spike_bottom_radius);
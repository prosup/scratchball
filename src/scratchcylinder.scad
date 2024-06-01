use <modules.scad>
use <util-func.scad>
//use <definition.scad>
$fn=100;

spike_hight = 3;
roller_r=10;
//外壳要比滚轮大，露出垂直方向完整的齿
shell_thick=1.5;

spike_bottom_radius = 1.2;
shell_inner_radius=roller_r+spike_hight+0.3;
roller_l=20*(sin(60)*spike_bottom_radius*2)+2*spike_bottom_radius;
joint_hight=spike_bottom_radius*2;
joint_radius=5;
layer=20; 
//single_spike(spike_hight, spike_bottom_radius);
//number of spike per layer
//    echo(num);
//

module shell()
{
//shell 
difference() {
difference() {
    translate([0,0,0.1]) 
    {
    cylinder(roller_l+2*(joint_hight-0.1), shell_inner_radius+shell_thick,shell_inner_radius+shell_thick);
    }
    translate([0,0,(joint_hight)/2]) 
    cylinder(roller_l+joint_hight, shell_inner_radius,shell_inner_radius);
}


translate([0,spike_hight+roller_r,roller_l/2+joint_hight]) 
    cube([shell_inner_radius*2,spike_hight*2,roller_l+2*joint_hight+2],true);
}
}
//cylinder(roller_l, roller_r,roller_r);
//translate([0,0,spike_bottom_radius]) 
//    sigle_spike_ring();

module roller()
{
union() 
{
joint(joint_radius, joint_hight);
translate([0,0,roller_l+2*spike_bottom_radius]) 
    joint(joint_radius, joint_hight);
translate([0,0,2*spike_bottom_radius]) 
cylinder(roller_l, roller_r,roller_r);
translate([0,0,2*spike_bottom_radius]) 
piller_of_spike(layer,roller_r,spike_hight,spike_bottom_radius); 
}
}

shell();
roller();
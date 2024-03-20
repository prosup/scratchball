//坐标系变换
use <util-func.scad>
use <modules.scad>
//螺纹
use <NopSCADlib/utils/thread.scad>

//一些全局变量

$fn=30;
//球外径
ball_outer_radius=22;
//球内径，在挖空和内径之间，为了方便挖槽控制厚度
ball_inner_radius=21;
//挖空内径
ball_hollow_radius=20;
//挖槽的宽度
slot_width=2;
//
spike_bottom_radius=1.2;
spike_hight=5;


difference() 
{
spike_around_ball(ball_outer_radius, spike_bottom_radius,spike_hight);
joint_inside(ball_hollow_radius = ball_hollow_radius, ball_outer_radius = ball_outer_radius, spike_hight = spike_hight);
}


//joint_inside(ball_hollow_radius = ball_hollow_radius-0.2, ball_outer_radius = ball_outer_radius, spike_hight = spike_hight);

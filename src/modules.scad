module single_spike(spike_hight,spike_bottom_radius)
{
    cylinder(h = spike_hight, r1=spike_bottom_radius,r2=0);
}


module spike_around_ball(ball_outer_radius,spike_bottom_radius,spike_hight)
{
//calculate how may layer should we have
//caculate layer ring R from the angle
    hight=ball_outer_radius*cos(asin(spike_bottom_radius/ball_outer_radius));//高度是定值
    layer_max=54;
    layer_angle=180/layer_max;
    for(layer_idx=[1:2:layer_max])
    {
        layer_radius=abs(hight*sin(layer_angle*layer_idx));
        layer_round=2*PI*layer_radius;
        layer_round_num=floor(layer_round/2/spike_bottom_radius);
        echo("a:",layer_angle,layer_max,":",layer_idx,"",layer_radius,"round",layer_round,"num",layer_round_num);

        for(layer_jdx=[1:1:layer_round_num])
        {
//            echo(layer_jdx);
            pos_x=hight*sin(layer_angle*layer_idx);
//配合下方的translate,这里的z轴位置需要加上ball_outer_radius
            pos_z=-hight*cos(layer_angle*layer_idx);
            rotate([0,0,360/layer_round_num*layer_jdx])
            {
                translate([-pos_x,0,pos_z])
                {
                    rotate([0,layer_angle*layer_idx+180,0]) 
                        single_spike(spike_hight,spike_bottom_radius);
                }
            }
        }
    }
//保持圆心在原点，后续便于使用极坐标系
//    translate([0,0,ball_outer_radius]) 
        sphere(ball_outer_radius);

}

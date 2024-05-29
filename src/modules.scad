//滚状模型只需要尖刺，其他删除
module single_spike(spike_hight,spike_bottom_radius)
{
    cylinder(h = spike_hight, r1=spike_bottom_radius,r2=0);
}

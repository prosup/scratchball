/**
    绘制的时候考虑直角座标与极坐标的转换
    定义:
    a为点与原点与z轴夹角
    b为上述直线在0水平面投影与x轴夹角
    下面两个函数提供直角坐标点与角坐标点之间的转换
*/
function pointXYZ(rab) =
    let(
        r=rab[0],
        a=rab[1],
        b=rab[2],
        x = r*sin(a)*cos(b), 
        y = r*sin(a)*sin(b), 
        z = r*cos(a),
        xyz=[x,y,z]
    )xyz;

function pointRAB(xyz) = 
    let(
        x=xyz[0],
        y=xyz[1],
        z=xyz[2],
        r=(x^2+y^2+z^2)^0.5,
        b=atan(y/x),
        a=acos(z/r),
        rab=[r,a,b]
    )rab;
    
// rab=pointRAB([1,1,1]);
// xyz=pointXYZ(rab);
// echo(xyz[0],xyz[1],xyz[2]);
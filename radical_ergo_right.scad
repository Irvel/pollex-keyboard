difference(){
    union(){
        hull(){
            union(){
                translate(v=[-35.0, -42.0, 60]){
                    rotate(a=[30, 0, 0]){
                        translate(v=[41.83, 18.915, 0]){
                            rotate(a=[8, -18, 0]){
                                translate(v=[-9.4575, 8.6075, -1.5]){
                                    cube(size=[18.915, 0.6, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 110]){
                    rotate(a=[-20, 65, -26]){
                        translate(v=[22.415, 0.0, 0]){
                            rotate(a=[0, 0, 0]){
                                translate(v=[-9.4575, -9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        union(){
            cube(size=0);
            translate(v=[-35.0, -42.0, 60]){
                rotate(a=[30, 0, 0]){
                    translate(v=[0.0, 0.0, 0]){
                        rotate(a=[-8, 18, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                difference(){
                                    cube(size=[14.4, 14.4, 3], center=true);
                                    mirror(-1){
                                        union(){
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, 90, 90]){
                                                    cylinder(h=2.75, r=1, $fn=60);
                                                };
                                            };
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, -30, 0]){
                                                    cube(size=[1, 2.75, 3]);
                                                };
                                            };
                                        };
                                    };
                                    union(){
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, 90, 90]){
                                                cylinder(h=2.75, r=1, $fn=60);
                                            };
                                        };
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, -30, 0]){
                                                cube(size=[1, 2.75, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[0.0, 0.0, 0]){
                                        rotate(a=[-8, 18, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-8, 18, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-8, 18, 0]){
                                                translate(v=[9.4475, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[20.915, 0.0, -3.6]){
                                            rotate(a=[-8, 0, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[0.0, 0.0, 0]){
                                                    rotate(a=[-8, 18, 0]){
                                                        translate(v=[9.4475, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[20.915, 0.0, -3.6]){
                                                    rotate(a=[-8, 0, 0]){
                                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[0.0, 0.0, 0]){
                                        rotate(a=[-8, 18, 0]){
                                            translate(v=[-12.4575, -12.2075, -1.5]){
                                                cube(size=[3, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-8, 18, 0]){
                                                translate(v=[-12.4575, -12.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[0.0, 0.0, 0]){
                                        rotate(a=[-8, 18, 0]){
                                            translate(v=[-12.4575, -9.2075, -1.5]){
                                                cube(size=[3, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-8, 18, 0]){
                                                translate(v=[-12.4575, -9.2075, -1.5]){
                                                    cube(size=[3, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            hull(){
                                union(){
                                    translate(v=[-35.0, -42.0, 60]){
                                        rotate(a=[30, 0, 0]){
                                            translate(v=[0.0, 0.0, 0]){
                                                rotate(a=[-8, 18, 0]){
                                                    translate(v=[-12.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-35.0, -42.0, 60]){
                                        rotate(a=[30, 0, 0]){
                                            translate(v=[0.0, 18.915, 0]){
                                                rotate(a=[8, 18, 0]){
                                                    translate(v=[-12.4575, -9.2075, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                hull(){
                                    union(){
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[0.0, 0.0, 0]){
                                                    rotate(a=[-8, 18, 0]){
                                                        translate(v=[-12.4575, 9.1975, -1.5]){
                                                            cube(size=[3, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[0.0, 18.915, 0]){
                                                    rotate(a=[8, 18, 0]){
                                                        translate(v=[-12.4575, -9.2075, -1.5]){
                                                            cube(size=[3, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[0.0, 0.0, 0]){
                                rotate(a=[-8, 18, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[0.0, 18.915, 0]){
                                rotate(a=[8, 18, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[0.0, 0.0, 0]){
                                rotate(a=[-8, 18, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 0.0, -3.6]){
                                rotate(a=[-8, 0, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[0.0, 18.915, 0]){
                                rotate(a=[8, 18, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 18.915, -3.6]){
                                rotate(a=[8, 0, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[0.0, 0.0, 0]){
                                rotate(a=[-8, 18, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 0.0, -3.6]){
                                rotate(a=[-8, 0, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[-35.0, -42.0, 60]){
                rotate(a=[30, 0, 0]){
                    translate(v=[0.0, 18.915, 0]){
                        rotate(a=[8, 18, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                difference(){
                                    cube(size=[14.4, 14.4, 3], center=true);
                                    mirror(-1){
                                        union(){
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, 90, 90]){
                                                    cylinder(h=2.75, r=1, $fn=60);
                                                };
                                            };
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, -30, 0]){
                                                    cube(size=[1, 2.75, 3]);
                                                };
                                            };
                                        };
                                    };
                                    union(){
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, 90, 90]){
                                                cylinder(h=2.75, r=1, $fn=60);
                                            };
                                        };
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, -30, 0]){
                                                cube(size=[1, 2.75, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[0.0, 18.915, 0]){
                                        rotate(a=[8, 18, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 18.915, 0]){
                                            rotate(a=[8, 18, 0]){
                                                translate(v=[-9.4575, 9.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 18.915, 0]){
                                            rotate(a=[8, 18, 0]){
                                                translate(v=[9.4475, 9.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[20.915, 18.915, -3.6]){
                                            rotate(a=[8, 0, 0]){
                                                translate(v=[-9.4575, 9.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[0.0, 18.915, 0]){
                                                    rotate(a=[8, 18, 0]){
                                                        translate(v=[9.4475, 9.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[20.915, 18.915, -3.6]){
                                                    rotate(a=[8, 0, 0]){
                                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[0.0, 18.915, 0]){
                                        rotate(a=[8, 18, 0]){
                                            translate(v=[-12.4575, 9.2075, -1.5]){
                                                cube(size=[3, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 18.915, 0]){
                                            rotate(a=[8, 18, 0]){
                                                translate(v=[-12.4575, 9.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[0.0, 18.915, 0]){
                                        rotate(a=[8, 18, 0]){
                                            translate(v=[-12.4575, -9.2075, -1.5]){
                                                cube(size=[3, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[0.0, 18.915, 0]){
                                            rotate(a=[8, 18, 0]){
                                                translate(v=[-12.4575, -9.2075, -1.5]){
                                                    cube(size=[3, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[0.0, 18.915, 0]){
                                rotate(a=[8, 18, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 18.915, -3.6]){
                                rotate(a=[8, 0, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[-35.0, -42.0, 60]){
                rotate(a=[30, 0, 0]){
                    translate(v=[20.915, 0.0, -3.6]){
                        rotate(a=[-8, 0, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                difference(){
                                    cube(size=[14.4, 14.4, 3], center=true);
                                    mirror(-1){
                                        union(){
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, 90, 90]){
                                                    cylinder(h=2.75, r=1, $fn=60);
                                                };
                                            };
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, -30, 0]){
                                                    cube(size=[1, 2.75, 3]);
                                                };
                                            };
                                        };
                                    };
                                    union(){
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, 90, 90]){
                                                cylinder(h=2.75, r=1, $fn=60);
                                            };
                                        };
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, -30, 0]){
                                                cube(size=[1, 2.75, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[20.915, 0.0, -3.6]){
                                        rotate(a=[-8, 0, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[20.915, 0.0, -3.6]){
                                            rotate(a=[-8, 0, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[20.915, 0.0, -3.6]){
                                            rotate(a=[-8, 0, 0]){
                                                translate(v=[9.4475, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 0.0, 0]){
                                            rotate(a=[-8, -18, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[20.915, 0.0, -3.6]){
                                                    rotate(a=[-8, 0, 0]){
                                                        translate(v=[9.4475, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[41.83, 0.0, 0]){
                                                    rotate(a=[-8, -18, 0]){
                                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 0.0, -3.6]){
                                rotate(a=[-8, 0, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 18.915, -3.6]){
                                rotate(a=[8, 0, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 0.0, -3.6]){
                                rotate(a=[-8, 0, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[41.83, 0.0, 0]){
                                rotate(a=[-8, -18, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 18.915, -3.6]){
                                rotate(a=[8, 0, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[41.83, 18.915, 0]){
                                rotate(a=[8, -18, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 0.0, -3.6]){
                                rotate(a=[-8, 0, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[41.83, 0.0, 0]){
                                rotate(a=[-8, -18, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[-35.0, -42.0, 60]){
                rotate(a=[30, 0, 0]){
                    translate(v=[20.915, 18.915, -3.6]){
                        rotate(a=[8, 0, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                difference(){
                                    cube(size=[14.4, 14.4, 3], center=true);
                                    mirror(-1){
                                        union(){
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, 90, 90]){
                                                    cylinder(h=2.75, r=1, $fn=60);
                                                };
                                            };
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, -30, 0]){
                                                    cube(size=[1, 2.75, 3]);
                                                };
                                            };
                                        };
                                    };
                                    union(){
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, 90, 90]){
                                                cylinder(h=2.75, r=1, $fn=60);
                                            };
                                        };
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, -30, 0]){
                                                cube(size=[1, 2.75, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[20.915, 18.915, -3.6]){
                                        rotate(a=[8, 0, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[20.915, 18.915, -3.6]){
                                            rotate(a=[8, 0, 0]){
                                                translate(v=[-9.4575, 9.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[20.915, 18.915, -3.6]){
                                            rotate(a=[8, 0, 0]){
                                                translate(v=[9.4475, 9.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 18.915, 0]){
                                            rotate(a=[8, -18, 0]){
                                                translate(v=[-9.4575, 9.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[20.915, 18.915, -3.6]){
                                                    rotate(a=[8, 0, 0]){
                                                        translate(v=[9.4475, 9.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[41.83, 18.915, 0]){
                                                    rotate(a=[8, -18, 0]){
                                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[20.915, 18.915, -3.6]){
                                rotate(a=[8, 0, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[41.83, 18.915, 0]){
                                rotate(a=[8, -18, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[-35.0, -42.0, 60]){
                rotate(a=[30, 0, 0]){
                    translate(v=[41.83, 0.0, 0]){
                        rotate(a=[-8, -18, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                difference(){
                                    cube(size=[14.4, 14.4, 3], center=true);
                                    mirror(-1){
                                        union(){
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, 90, 90]){
                                                    cylinder(h=2.75, r=1, $fn=60);
                                                };
                                            };
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, -30, 0]){
                                                    cube(size=[1, 2.75, 3]);
                                                };
                                            };
                                        };
                                    };
                                    union(){
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, 90, 90]){
                                                cylinder(h=2.75, r=1, $fn=60);
                                            };
                                        };
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, -30, 0]){
                                                cube(size=[1, 2.75, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[41.83, 0.0, 0]){
                                        rotate(a=[-8, -18, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 0.0, 0]){
                                            rotate(a=[-8, -18, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[41.83, 0.0, 0]){
                                        rotate(a=[-8, -18, 0]){
                                            translate(v=[9.4575, -12.2075, -1.5]){
                                                cube(size=[3, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 0.0, 0]){
                                            rotate(a=[-8, -18, 0]){
                                                translate(v=[9.4575, -12.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[41.83, 0.0, 0]){
                                        rotate(a=[-8, -18, 0]){
                                            translate(v=[9.4575, -9.2075, -1.5]){
                                                cube(size=[3, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 0.0, 0]){
                                            rotate(a=[-8, -18, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[3, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            hull(){
                                union(){
                                    translate(v=[-35.0, -42.0, 60]){
                                        rotate(a=[30, 0, 0]){
                                            translate(v=[41.83, 0.0, 0]){
                                                rotate(a=[-8, -18, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-35.0, -42.0, 60]){
                                        rotate(a=[30, 0, 0]){
                                            translate(v=[41.83, 18.915, 0]){
                                                rotate(a=[8, -18, 0]){
                                                    translate(v=[9.4575, -9.2075, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                hull(){
                                    union(){
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[41.83, 0.0, 0]){
                                                    rotate(a=[-8, -18, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[3, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-35.0, -42.0, 60]){
                                            rotate(a=[30, 0, 0]){
                                                translate(v=[41.83, 18.915, 0]){
                                                    rotate(a=[8, -18, 0]){
                                                        translate(v=[9.4575, -9.2075, -1.5]){
                                                            cube(size=[3, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                union(){
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[41.83, 0.0, 0]){
                                rotate(a=[-8, -18, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[-35.0, -42.0, 60]){
                        rotate(a=[30, 0, 0]){
                            translate(v=[41.83, 18.915, 0]){
                                rotate(a=[8, -18, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[-35.0, -42.0, 60]){
                rotate(a=[30, 0, 0]){
                    translate(v=[41.83, 18.915, 0]){
                        rotate(a=[8, -18, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                difference(){
                                    cube(size=[14.4, 14.4, 3], center=true);
                                    mirror(-1){
                                        union(){
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, 90, 90]){
                                                    cylinder(h=2.75, r=1, $fn=60);
                                                };
                                            };
                                            translate(v=[-7.2, -1.475, -0.5]){
                                                rotate(a=[0, -30, 0]){
                                                    cube(size=[1, 2.75, 3]);
                                                };
                                            };
                                        };
                                    };
                                    union(){
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, 90, 90]){
                                                cylinder(h=2.75, r=1, $fn=60);
                                            };
                                        };
                                        translate(v=[-7.2, -1.475, -0.5]){
                                            rotate(a=[0, -30, 0]){
                                                cube(size=[1, 2.75, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[41.83, 18.915, 0]){
                                        rotate(a=[8, -18, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 18.915, 0]){
                                            rotate(a=[8, -18, 0]){
                                                translate(v=[-9.4575, 9.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[41.83, 18.915, 0]){
                                        rotate(a=[8, -18, 0]){
                                            translate(v=[9.4575, 9.2075, -1.5]){
                                                cube(size=[3, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 18.915, 0]){
                                            rotate(a=[8, -18, 0]){
                                                translate(v=[9.4575, 9.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[-35.0, -42.0, 60]){
                                rotate(a=[30, 0, 0]){
                                    translate(v=[41.83, 18.915, 0]){
                                        rotate(a=[8, -18, 0]){
                                            translate(v=[9.4575, -9.2075, -1.5]){
                                                cube(size=[3, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[-35.0, -42.0, 60]){
                                    rotate(a=[30, 0, 0]){
                                        translate(v=[41.83, 18.915, 0]){
                                            rotate(a=[8, -18, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[3, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
        };
        union(){
            cube(size=0);
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 0.0, 0.30000000000000004]){
                        rotate(a=[-36, 8.399999999999999, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[0.0, 0.0, 0.30000000000000004]){
                                        rotate(a=[-36, 8.399999999999999, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[0.0, 0.0, 0.30000000000000004]){
                                            rotate(a=[-36, 8.399999999999999, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[0.0, 0.0, 0.30000000000000004]){
                                            rotate(a=[-36, 8.399999999999999, 0]){
                                                translate(v=[9.4475, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[22.415, 0.0, -2.4000000000000004]){
                                            rotate(a=[-36, 6, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[0.0, 0.0, 0.30000000000000004]){
                                                    rotate(a=[-36, 8.399999999999999, 0]){
                                                        translate(v=[9.4475, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[22.415, 0.0, -2.4000000000000004]){
                                                    rotate(a=[-36, 6, 0]){
                                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 0.0, 0.30000000000000004]){
                        rotate(a=[-36, 8.399999999999999, 0]){
                            translate(v=[-13.4575, -13.2075, -1.5]){
                                cube(size=[4, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 0.0, 0.30000000000000004]){
                        rotate(a=[-36, 8.399999999999999, 0]){
                            translate(v=[-13.4575, -9.2075, -1.5]){
                                cube(size=[4, 18.415, 3]);
                            };
                        };
                    };
                };
            };
            #hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 0.0, 0.30000000000000004]){
                                rotate(a=[-36, 8.399999999999999, 0]){
                                    translate(v=[-13.4575, 9.1975, -1.5]){
                                        cube(size=[4, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[-13.4575, -9.2075, -1.5]){
                                        cube(size=[4, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 0.0, 0.30000000000000004]){
                                rotate(a=[-36, 8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 0.0, 0.30000000000000004]){
                                rotate(a=[-36, 8.399999999999999, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 0.0, -2.4000000000000004]){
                                rotate(a=[-36, 6, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 0.0, 0.30000000000000004]){
                                rotate(a=[-36, 8.399999999999999, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 0.0, -2.4000000000000004]){
                                rotate(a=[-36, 6, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[-1.0, 24.915, -8.899999999999999]){
                        rotate(a=[0, 8.399999999999999, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[-1.0, 24.915, -8.899999999999999]){
                        rotate(a=[0, 8.399999999999999, 0]){
                            translate(v=[-13.4575, -9.2075, -1.5]){
                                cube(size=[4, 18.415, 3]);
                            };
                        };
                    };
                };
            };
            #hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[-13.4575, 9.1975, -1.5]){
                                        cube(size=[4, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 49.83, 0.30000000000000004]){
                                rotate(a=[36, 8.399999999999999, 0]){
                                    translate(v=[-13.4575, -9.2075, -1.5]){
                                        cube(size=[4, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 49.83, 0.30000000000000004]){
                                rotate(a=[36, 8.399999999999999, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 49.83, 0.30000000000000004]){
                                rotate(a=[36, 8.399999999999999, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[-1.0, 24.915, -8.899999999999999]){
                                rotate(a=[0, 8.399999999999999, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 49.83, 0.30000000000000004]){
                        rotate(a=[36, 8.399999999999999, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 49.83, 0.30000000000000004]){
                        rotate(a=[36, 8.399999999999999, 0]){
                            translate(v=[-13.4575, 9.2075, -1.5]){
                                cube(size=[4, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 49.83, 0.30000000000000004]){
                        rotate(a=[36, 8.399999999999999, 0]){
                            translate(v=[-13.4575, -9.2075, -1.5]){
                                cube(size=[4, 18.415, 3]);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 49.83, 0.30000000000000004]){
                                rotate(a=[36, 8.399999999999999, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[22.415, 0.0, -2.4000000000000004]){
                        rotate(a=[-36, 6, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[22.415, 0.0, -2.4000000000000004]){
                                        rotate(a=[-36, 6, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[22.415, 0.0, -2.4000000000000004]){
                                            rotate(a=[-36, 6, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[22.415, 0.0, -2.4000000000000004]){
                                            rotate(a=[-36, 6, 0]){
                                                translate(v=[9.4475, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[44.83, 4.0, -10.6]){
                                            rotate(a=[-36, 0, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[22.415, 0.0, -2.4000000000000004]){
                                                    rotate(a=[-36, 6, 0]){
                                                        translate(v=[9.4475, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[44.83, 4.0, -10.6]){
                                                    rotate(a=[-36, 0, 0]){
                                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 0.0, -2.4000000000000004]){
                                rotate(a=[-36, 6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 0.0, -2.4000000000000004]){
                                rotate(a=[-36, 6, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 4.0, -10.6]){
                                rotate(a=[-36, 0, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 0.0, -2.4000000000000004]){
                                rotate(a=[-36, 6, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 4.0, -10.6]){
                                rotate(a=[-36, 0, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[21.415, 24.915, -11.6]){
                        rotate(a=[0, 6, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[21.415, 24.915, -11.6]){
                                rotate(a=[0, 6, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[22.415, 49.83, -2.4000000000000004]){
                        rotate(a=[36, 6, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[44.83, 4.0, -10.6]){
                        rotate(a=[-36, 0, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[44.83, 4.0, -10.6]){
                                        rotate(a=[-36, 0, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[44.83, 4.0, -10.6]){
                                            rotate(a=[-36, 0, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[44.83, 4.0, -10.6]){
                                            rotate(a=[-36, 0, 0]){
                                                translate(v=[9.4475, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[67.245, 2.0, -9.4]){
                                            rotate(a=[-36, -6, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[44.83, 4.0, -10.6]){
                                                    rotate(a=[-36, 0, 0]){
                                                        translate(v=[9.4475, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[67.245, 2.0, -9.4]){
                                                    rotate(a=[-36, -6, 0]){
                                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 4.0, -10.6]){
                                rotate(a=[-36, 0, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 4.0, -10.6]){
                                rotate(a=[-36, 0, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 2.0, -9.4]){
                                rotate(a=[-36, -6, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 4.0, -10.6]){
                                rotate(a=[-36, 0, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 2.0, -9.4]){
                                rotate(a=[-36, -6, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[44.83, 28.915, -19.799999999999997]){
                        rotate(a=[0, 0, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 28.915, -19.799999999999997]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[44.83, 53.83, -10.6]){
                        rotate(a=[36, 0, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[67.245, 2.0, -9.4]){
                        rotate(a=[-36, -6, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[67.245, 2.0, -9.4]){
                                        rotate(a=[-36, -6, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[67.245, 2.0, -9.4]){
                                            rotate(a=[-36, -6, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                difference(){
                    union(){
                        hull(){
                            union(){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[67.245, 2.0, -9.4]){
                                            rotate(a=[-36, -6, 0]){
                                                translate(v=[9.4475, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[90.16, -4.0, 0.30000000000000004]){
                                            rotate(a=[-36, -8.399999999999999, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[0.01, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    union(){
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[67.245, 2.0, -9.4]){
                                                    rotate(a=[-36, -6, 0]){
                                                        translate(v=[9.4475, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[90.16, -4.0, 0.30000000000000004]){
                                                    rotate(a=[-36, -8.399999999999999, 0]){
                                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                                            cube(size=[0.01, 3, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        cube(size=0);
                    };
                    translate(v=[0, 0, -125]){
                        cube(size=[500, 500, 250], center=true);
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 2.0, -9.4]){
                                rotate(a=[-36, -6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 2.0, -9.4]){
                                rotate(a=[-36, -6, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, -4.0, 0.30000000000000004]){
                                rotate(a=[-36, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                rotate(a=[0, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 2.0, -9.4]){
                                rotate(a=[-36, -6, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, -4.0, 0.30000000000000004]){
                                rotate(a=[-36, -8.399999999999999, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[68.245, 26.915, -18.6]){
                        rotate(a=[0, -6, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                rotate(a=[0, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, 45.83, 0.30000000000000004]){
                                rotate(a=[36, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[68.245, 26.915, -18.6]){
                                rotate(a=[0, -6, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                rotate(a=[0, -8.399999999999999, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[67.245, 51.83, -9.4]){
                        rotate(a=[36, -6, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, 45.83, 0.30000000000000004]){
                                rotate(a=[36, -8.399999999999999, 0]){
                                    translate(v=[-9.4675, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[90.16, -4.0, 0.30000000000000004]){
                        rotate(a=[-36, -8.399999999999999, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[90.16, -4.0, 0.30000000000000004]){
                                        rotate(a=[-36, -8.399999999999999, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[18.915, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[90.16, -4.0, 0.30000000000000004]){
                                            rotate(a=[-36, -8.399999999999999, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[90.16, -4.0, 0.30000000000000004]){
                                        rotate(a=[-36, -8.399999999999999, 0]){
                                            translate(v=[9.4575, -12.2075, -1.5]){
                                                cube(size=[4, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[90.16, -4.0, 0.30000000000000004]){
                                            rotate(a=[-36, -8.399999999999999, 0]){
                                                translate(v=[9.4575, -12.2075, -1.5]){
                                                    cube(size=[4, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[90.16, -4.0, 0.30000000000000004]){
                                        rotate(a=[-36, -8.399999999999999, 0]){
                                            translate(v=[9.4575, -9.2075, -1.5]){
                                                cube(size=[4, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[90.16, -4.0, 0.30000000000000004]){
                                            rotate(a=[-36, -8.399999999999999, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[4, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            hull(){
                                union(){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[-20, 65, -26]){
                                            translate(v=[90.16, -4.0, 0.30000000000000004]){
                                                rotate(a=[-36, -8.399999999999999, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[4, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[-20, 65, -26]){
                                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                                rotate(a=[0, -8.399999999999999, 0]){
                                                    translate(v=[9.4575, -9.2075, -1.5]){
                                                        cube(size=[4, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                hull(){
                                    union(){
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[90.16, -4.0, 0.30000000000000004]){
                                                    rotate(a=[-36, -8.399999999999999, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[91.16, 20.915, -8.899999999999999]){
                                                    rotate(a=[0, -8.399999999999999, 0]){
                                                        translate(v=[9.4575, -9.2075, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, -4.0, 0.30000000000000004]){
                                rotate(a=[-36, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                rotate(a=[0, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[91.16, 20.915, -8.899999999999999]){
                        rotate(a=[0, -8.399999999999999, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[91.16, 20.915, -8.899999999999999]){
                                        rotate(a=[0, -8.399999999999999, 0]){
                                            translate(v=[9.4575, -9.2075, -1.5]){
                                                cube(size=[4, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[91.16, 20.915, -8.899999999999999]){
                                            rotate(a=[0, -8.399999999999999, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[4, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            hull(){
                                union(){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[-20, 65, -26]){
                                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                                rotate(a=[0, -8.399999999999999, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[4, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[-20, 65, -26]){
                                            translate(v=[90.16, 45.83, 0.30000000000000004]){
                                                rotate(a=[36, -8.399999999999999, 0]){
                                                    translate(v=[9.4575, -9.2075, -1.5]){
                                                        cube(size=[4, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                hull(){
                                    union(){
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[91.16, 20.915, -8.899999999999999]){
                                                    rotate(a=[0, -8.399999999999999, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[-20, 65, -26]){
                                                translate(v=[90.16, 45.83, 0.30000000000000004]){
                                                    rotate(a=[36, -8.399999999999999, 0]){
                                                        translate(v=[9.4575, -9.2075, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[91.16, 20.915, -8.899999999999999]){
                                rotate(a=[0, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, 45.83, 0.30000000000000004]){
                                rotate(a=[36, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, -9.2175, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[90.16, 45.83, 0.30000000000000004]){
                        rotate(a=[36, -8.399999999999999, 0]){
                            difference(){
                                cube(size=[18.915, 18.415, 3], center=true);
                                cube(size=[14.4, 14.4, 3], center=true);
                            };
                        };
                    };
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[90.16, 45.83, 0.30000000000000004]){
                                        rotate(a=[36, -8.399999999999999, 0]){
                                            translate(v=[9.4575, 9.2075, -1.5]){
                                                cube(size=[4, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[90.16, 45.83, 0.30000000000000004]){
                                            rotate(a=[36, -8.399999999999999, 0]){
                                                translate(v=[9.4575, 9.2075, -1.5]){
                                                    cube(size=[4, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
            difference(){
                union(){
                    hull(){
                        union(){
                            translate(v=[0, 0, 110]){
                                rotate(a=[-20, 65, -26]){
                                    translate(v=[90.16, 45.83, 0.30000000000000004]){
                                        rotate(a=[36, -8.399999999999999, 0]){
                                            translate(v=[9.4575, -9.2075, -1.5]){
                                                cube(size=[4, 18.415, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                translate(v=[0, 0, 110]){
                                    rotate(a=[-20, 65, -26]){
                                        translate(v=[90.16, 45.83, 0.30000000000000004]){
                                            rotate(a=[36, -8.399999999999999, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[4, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                    cube(size=0);
                };
                translate(v=[0, 0, -125]){
                    cube(size=[500, 500, 250], center=true);
                };
            };
        };
        union(){
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 49.83, 0.30000000000000004]){
                        rotate(a=[36, 8.399999999999999, 0]){
                            translate(v=[-9.4575, 9.2075, -1.5]){
                                cube(size=[18.915, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[0.0, 49.83, 0.30000000000000004]){
                        rotate(a=[36, 8.399999999999999, 0]){
                            translate(v=[-9.4575, 9.2075, -1.5]){
                                cube(size=[18.915, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[22.415, 49.83, -2.4000000000000004]){
                        rotate(a=[36, 6, 0]){
                            translate(v=[-9.4575, 9.2075, -1.5]){
                                cube(size=[18.915, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[44.83, 53.83, -10.6]){
                        rotate(a=[36, 0, 0]){
                            translate(v=[-9.4575, 9.2075, -1.5]){
                                cube(size=[18.915, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[67.245, 51.83, -9.4]){
                        rotate(a=[36, -6, 0]){
                            translate(v=[-9.4575, 9.2075, -1.5]){
                                cube(size=[18.915, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[-20, 65, -26]){
                    translate(v=[90.16, 45.83, 0.30000000000000004]){
                        rotate(a=[36, -8.399999999999999, 0]){
                            translate(v=[-9.4575, 9.2075, -1.5]){
                                cube(size=[18.915, 4, 3]);
                            };
                        };
                    };
                };
            };
            #hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[0.0, 49.83, 0.30000000000000004]){
                                rotate(a=[36, 8.399999999999999, 0]){
                                    translate(v=[9.4475, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            #hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[22.415, 49.83, -2.4000000000000004]){
                                rotate(a=[36, 6, 0]){
                                    translate(v=[9.4475, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            #hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[44.83, 53.83, -10.6]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[9.4475, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            #hull(){
                union(){
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[67.245, 51.83, -9.4]){
                                rotate(a=[36, -6, 0]){
                                    translate(v=[9.4475, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[-20, 65, -26]){
                            translate(v=[90.16, 45.83, 0.30000000000000004]){
                                rotate(a=[36, -8.399999999999999, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    union(){
        color("Blue"){
            translate(v=[-20, -25, 12]){
                hull(){
                    union(){
                        rotate(a=[90, 0, 0]){
                            cylinder(h=100, r=17, center=true);
                        };
                        translate(v=[12, -1, 0]){
                            rotate(a=[90, 0, 0]){
                                cylinder(h=100, r=17, center=true);
                            };
                        };
                    };
                };
            };
        };
        color("Blue"){
            translate(v=[-20, -25, 28]){
                hull(){
                    union(){
                        rotate(a=[90, 0, 0]){
                            cylinder(h=100, r=17, center=true);
                        };
                        translate(v=[12, -1, 0]){
                            rotate(a=[90, 0, 0]){
                                cylinder(h=100, r=17, center=true);
                            };
                        };
                    };
                };
            };
        };
    };
};

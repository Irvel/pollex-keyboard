union(){
    hull(){
        union(){
            translate(v=[-40.0, -44.0, 50.7]){
                rotate(a=[40, 0, 0]){
                    translate(v=[41.83, 18.915, 0]){
                        rotate(a=[8, -18, 0]){
                            translate(v=[-9.4575, 8.6075, -1.5]){
                                cube(size=[18.915, 0.6, 3]);
                            };
                        };
                    };
                };
            };
            translate(v=[0, 0, 75]){
                rotate(a=[-35, 30, -40]){
                    translate(v=[0.0, 0.0, 0.7000000000000001]){
                        rotate(a=[-20, 19.599999999999998, 0]){
                            translate(v=[-9.4575, -9.2075, -1.5]){
                                cube(size=[18.915, 0.01, 3]);
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
                    hull(){
                        union(){
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
                                    translate(v=[20.915, 18.915, -3.6]){
                                        rotate(a=[8, 0, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[1.6, 9, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, 19.599999999999998, 0]){
                                            translate(v=[-12.4575, -12.2075, -1.5]){
                                                cube(size=[3, 3, 3]);
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
                                translate(v=[-40.0, -44.0, 50.7]){
                                    rotate(a=[40, 0, 0]){
                                        translate(v=[20.915, 18.915, -3.6]){
                                            rotate(a=[8, 0, 0]){
                                                translate(v=[-9.4575, 9.2075, -1.5]){
                                                    cube(size=[1.6, 9, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[0.0, 0.0, 0.7000000000000001]){
                                            rotate(a=[-20, 19.599999999999998, 0]){
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
                };
            };
            cube(size=0);
        };
        translate(v=[0, 0, -125]){
            cube(size=[500, 500, 250], center=true);
        };
    };
    union(){
        cube(size=0);
        translate(v=[-40.0, -44.0, 50.7]){
            rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
                                    translate(v=[0.0, 0.0, 0]){
                                        rotate(a=[-8, 18, 0]){
                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
                                            translate(v=[0.0, 0.0, 0]){
                                                rotate(a=[-8, 18, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                                translate(v=[-40.0, -44.0, 50.7]){
                                    rotate(a=[40, 0, 0]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-8, 18, 0]){
                                                translate(v=[-12.4575, 9.1975, -1.5]){
                                                    cube(size=[3, 0.01, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[-40.0, -44.0, 50.7]){
                                    rotate(a=[40, 0, 0]){
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
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
                                            translate(v=[0.0, 0.0, 0]){
                                                rotate(a=[-8, 18, 0]){
                                                    translate(v=[-12.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[0.0, 0.0, 0]){
                            rotate(a=[-8, 18, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[0.0, 0.0, 0]){
                            rotate(a=[-8, 18, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[20.915, 0.0, -3.6]){
                            rotate(a=[-8, 0, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[0.0, 18.915, 0]){
                            rotate(a=[8, 18, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[0.0, 0.0, 0]){
                            rotate(a=[-8, 18, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
        translate(v=[-40.0, -44.0, 50.7]){
            rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
                                    translate(v=[0.0, 18.915, 0]){
                                        rotate(a=[8, 18, 0]){
                                            translate(v=[9.4475, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
                                            translate(v=[0.0, 18.915, 0]){
                                                rotate(a=[8, 18, 0]){
                                                    translate(v=[9.4475, 9.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[0.0, 18.915, 0]){
                            rotate(a=[8, 18, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
        translate(v=[-40.0, -44.0, 50.7]){
            rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
                                    translate(v=[20.915, 0.0, -3.6]){
                                        rotate(a=[-8, 0, 0]){
                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
                                            translate(v=[20.915, 0.0, -3.6]){
                                                rotate(a=[-8, 0, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[20.915, 0.0, -3.6]){
                            rotate(a=[-8, 0, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[20.915, 0.0, -3.6]){
                            rotate(a=[-8, 0, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[41.83, 0.0, 0]){
                            rotate(a=[-8, -18, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[20.915, 18.915, -3.6]){
                            rotate(a=[8, 0, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[20.915, 0.0, -3.6]){
                            rotate(a=[-8, 0, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
        translate(v=[-40.0, -44.0, 50.7]){
            rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
                                    translate(v=[20.915, 18.915, -3.6]){
                                        rotate(a=[8, 0, 0]){
                                            translate(v=[9.4475, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
                                            translate(v=[20.915, 18.915, -3.6]){
                                                rotate(a=[8, 0, 0]){
                                                    translate(v=[9.4475, 9.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[20.915, 18.915, -3.6]){
                            rotate(a=[8, 0, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
        translate(v=[-40.0, -44.0, 50.7]){
            rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                                translate(v=[-40.0, -44.0, 50.7]){
                                    rotate(a=[40, 0, 0]){
                                        translate(v=[41.83, 0.0, 0]){
                                            rotate(a=[-8, -18, 0]){
                                                translate(v=[9.4575, 9.1975, -1.5]){
                                                    cube(size=[3, 0.01, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[-40.0, -44.0, 50.7]){
                                    rotate(a=[40, 0, 0]){
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
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
                                            translate(v=[41.83, 0.0, 0]){
                                                rotate(a=[-8, -18, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-40.0, -44.0, 50.7]){
                                        rotate(a=[40, 0, 0]){
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
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
                        translate(v=[41.83, 0.0, 0]){
                            rotate(a=[-8, -18, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-40.0, -44.0, 50.7]){
                    rotate(a=[40, 0, 0]){
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
        translate(v=[-40.0, -44.0, 50.7]){
            rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
                        translate(v=[-40.0, -44.0, 50.7]){
                            rotate(a=[40, 0, 0]){
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
                            translate(v=[-40.0, -44.0, 50.7]){
                                rotate(a=[40, 0, 0]){
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
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[0.0, 0.0, 0.7000000000000001]){
                    rotate(a=[-20, 19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[0.0, 0.0, 0.7000000000000001]){
                                    rotate(a=[-20, 19.599999999999998, 0]){
                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, 19.599999999999998, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, 19.599999999999998, 0]){
                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[20.915, 0.0, -5.6000000000000005]){
                                        rotate(a=[-20, 14, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[0.0, 0.0, 0.7000000000000001]){
                                                rotate(a=[-20, 19.599999999999998, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[20.915, 0.0, -5.6000000000000005]){
                                                rotate(a=[-20, 14, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[0.0, 0.0, 0.7000000000000001]){
                                    rotate(a=[-20, 19.599999999999998, 0]){
                                        translate(v=[-12.4575, -12.2075, -1.5]){
                                            cube(size=[3, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, 19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[0.0, 0.0, 0.7000000000000001]){
                                    rotate(a=[-20, 19.599999999999998, 0]){
                                        translate(v=[-12.4575, -9.2075, -1.5]){
                                            cube(size=[3, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, 19.599999999999998, 0]){
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
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[0.0, 0.0, 0.7000000000000001]){
                                            rotate(a=[-20, 19.599999999999998, 0]){
                                                translate(v=[-12.4575, 9.1975, -1.5]){
                                                    cube(size=[3, 0.01, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[-1.0, 21.415, -3.3]){
                                            rotate(a=[0, 19.599999999999998, 0]){
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
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[0.0, 0.0, 0.7000000000000001]){
                                                rotate(a=[-20, 19.599999999999998, 0]){
                                                    translate(v=[-12.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[-1.0, 21.415, -3.3]){
                                                rotate(a=[0, 19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[0.0, 0.0, 0.7000000000000001]){
                            rotate(a=[-20, 19.599999999999998, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[-1.0, 21.415, -3.3]){
                            rotate(a=[0, 19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[0.0, 0.0, 0.7000000000000001]){
                            rotate(a=[-20, 19.599999999999998, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, 14, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[-1.0, 21.415, -3.3]){
                            rotate(a=[0, 19.599999999999998, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[0.0, 0.0, 0.7000000000000001]){
                            rotate(a=[-20, 19.599999999999998, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, 14, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[-1.0, 21.415, -3.3]){
                    rotate(a=[0, 19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[-1.0, 21.415, -3.3]){
                                    rotate(a=[0, 19.599999999999998, 0]){
                                        translate(v=[-12.4575, -9.2075, -1.5]){
                                            cube(size=[3, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[-1.0, 21.415, -3.3]){
                                        rotate(a=[0, 19.599999999999998, 0]){
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
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[-1.0, 21.415, -3.3]){
                                            rotate(a=[0, 19.599999999999998, 0]){
                                                translate(v=[-12.4575, 9.1975, -1.5]){
                                                    cube(size=[3, 0.01, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[0.0, 42.83, 0.7000000000000001]){
                                            rotate(a=[20, 19.599999999999998, 0]){
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
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[-1.0, 21.415, -3.3]){
                                                rotate(a=[0, 19.599999999999998, 0]){
                                                    translate(v=[-12.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[0.0, 42.83, 0.7000000000000001]){
                                                rotate(a=[20, 19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[-1.0, 21.415, -3.3]){
                            rotate(a=[0, 19.599999999999998, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[0.0, 42.83, 0.7000000000000001]){
                            rotate(a=[20, 19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[-1.0, 21.415, -3.3]){
                            rotate(a=[0, 19.599999999999998, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[0.0, 42.83, 0.7000000000000001]){
                            rotate(a=[20, 19.599999999999998, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 42.83, -5.6000000000000005]){
                            rotate(a=[20, 14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[-1.0, 21.415, -3.3]){
                            rotate(a=[0, 19.599999999999998, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[0.0, 42.83, 0.7000000000000001]){
                    rotate(a=[20, 19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[0.0, 42.83, 0.7000000000000001]){
                                    rotate(a=[20, 19.599999999999998, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, 19.599999999999998, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, 19.599999999999998, 0]){
                                            translate(v=[9.4475, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[20.915, 42.83, -5.6000000000000005]){
                                        rotate(a=[20, 14, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[0.0, 42.83, 0.7000000000000001]){
                                                rotate(a=[20, 19.599999999999998, 0]){
                                                    translate(v=[9.4475, 9.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[20.915, 42.83, -5.6000000000000005]){
                                                rotate(a=[20, 14, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[0.0, 42.83, 0.7000000000000001]){
                                    rotate(a=[20, 19.599999999999998, 0]){
                                        translate(v=[-12.4575, 9.2075, -1.5]){
                                            cube(size=[3, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, 19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[0.0, 42.83, 0.7000000000000001]){
                                    rotate(a=[20, 19.599999999999998, 0]){
                                        translate(v=[-12.4575, -9.2075, -1.5]){
                                            cube(size=[3, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[0.0, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, 19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[0.0, 42.83, 0.7000000000000001]){
                            rotate(a=[20, 19.599999999999998, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 42.83, -5.6000000000000005]){
                            rotate(a=[20, 14, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[20.915, 0.0, -5.6000000000000005]){
                    rotate(a=[-20, 14, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[20.915, 0.0, -5.6000000000000005]){
                                    rotate(a=[-20, 14, 0]){
                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[20.915, 0.0, -5.6000000000000005]){
                                        rotate(a=[-20, 14, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[20.915, 0.0, -5.6000000000000005]){
                                        rotate(a=[-20, 14, 0]){
                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[41.83, 0.0, -8.4]){
                                        rotate(a=[-20, 0, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[20.915, 0.0, -5.6000000000000005]){
                                                rotate(a=[-20, 14, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[41.83, 0.0, -8.4]){
                                                rotate(a=[-20, 0, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, 14, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, 14, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 0.0, -8.4]){
                            rotate(a=[-20, 0, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, 14, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 0.0, -8.4]){
                            rotate(a=[-20, 0, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[19.915, 21.415, -9.600000000000001]){
                    rotate(a=[0, 14, 0]){
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
        hull(){
            union(){
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 42.83, -5.6000000000000005]){
                            rotate(a=[20, 14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
                            rotate(a=[0, 0, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 42.83, -5.6000000000000005]){
                            rotate(a=[20, 14, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 42.83, -8.4]){
                            rotate(a=[20, 0, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[19.915, 21.415, -9.600000000000001]){
                            rotate(a=[0, 14, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
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
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[20.915, 42.83, -5.6000000000000005]){
                    rotate(a=[20, 14, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[20.915, 42.83, -5.6000000000000005]){
                                    rotate(a=[20, 14, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[20.915, 42.83, -5.6000000000000005]){
                                        rotate(a=[20, 14, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[20.915, 42.83, -5.6000000000000005]){
                                        rotate(a=[20, 14, 0]){
                                            translate(v=[9.4475, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[41.83, 42.83, -8.4]){
                                        rotate(a=[20, 0, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[20.915, 42.83, -5.6000000000000005]){
                                                rotate(a=[20, 14, 0]){
                                                    translate(v=[9.4475, 9.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[41.83, 42.83, -8.4]){
                                                rotate(a=[20, 0, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[20.915, 42.83, -5.6000000000000005]){
                            rotate(a=[20, 14, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 42.83, -8.4]){
                            rotate(a=[20, 0, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[41.83, 0.0, -8.4]){
                    rotate(a=[-20, 0, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[41.83, 0.0, -8.4]){
                                    rotate(a=[-20, 0, 0]){
                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[41.83, 0.0, -8.4]){
                                        rotate(a=[-20, 0, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[41.83, 0.0, -8.4]){
                                        rotate(a=[-20, 0, 0]){
                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[62.745, 0.0, -5.6000000000000005]){
                                        rotate(a=[-20, -14, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[41.83, 0.0, -8.4]){
                                                rotate(a=[-20, 0, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[62.745, 0.0, -5.6000000000000005]){
                                                rotate(a=[-20, -14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 0.0, -8.4]){
                            rotate(a=[-20, 0, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 0.0, -8.4]){
                            rotate(a=[-20, 0, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, -14, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
                            rotate(a=[0, 0, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 0.0, -8.4]){
                            rotate(a=[-20, 0, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, -14, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[41.83, 21.415, -12.4]){
                    rotate(a=[0, 0, 0]){
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
        hull(){
            union(){
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
                            rotate(a=[0, 0, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 42.83, -8.4]){
                            rotate(a=[20, 0, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
                            rotate(a=[0, 0, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 42.83, -8.4]){
                            rotate(a=[20, 0, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 42.83, -5.6000000000000005]){
                            rotate(a=[20, -14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 21.415, -12.4]){
                            rotate(a=[0, 0, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[41.83, 42.83, -8.4]){
                    rotate(a=[20, 0, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[41.83, 42.83, -8.4]){
                                    rotate(a=[20, 0, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[41.83, 42.83, -8.4]){
                                        rotate(a=[20, 0, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[41.83, 42.83, -8.4]){
                                        rotate(a=[20, 0, 0]){
                                            translate(v=[9.4475, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[62.745, 42.83, -5.6000000000000005]){
                                        rotate(a=[20, -14, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[41.83, 42.83, -8.4]){
                                                rotate(a=[20, 0, 0]){
                                                    translate(v=[9.4475, 9.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[62.745, 42.83, -5.6000000000000005]){
                                                rotate(a=[20, -14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[41.83, 42.83, -8.4]){
                            rotate(a=[20, 0, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 42.83, -5.6000000000000005]){
                            rotate(a=[20, -14, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[62.745, 0.0, -5.6000000000000005]){
                    rotate(a=[-20, -14, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[62.745, 0.0, -5.6000000000000005]){
                                    rotate(a=[-20, -14, 0]){
                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[62.745, 0.0, -5.6000000000000005]){
                                        rotate(a=[-20, -14, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[62.745, 0.0, -5.6000000000000005]){
                                        rotate(a=[-20, -14, 0]){
                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, -19.599999999999998, 0]){
                                            translate(v=[-9.4575, -12.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[62.745, 0.0, -5.6000000000000005]){
                                                rotate(a=[-20, -14, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[83.66, 0.0, 0.7000000000000001]){
                                                rotate(a=[-20, -19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, -14, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, -14, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[83.66, 0.0, 0.7000000000000001]){
                            rotate(a=[-20, -19.599999999999998, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[84.66, 21.415, -3.3]){
                            rotate(a=[0, -19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 0.0, -5.6000000000000005]){
                            rotate(a=[-20, -14, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[83.66, 0.0, 0.7000000000000001]){
                            rotate(a=[-20, -19.599999999999998, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[63.745, 21.415, -9.600000000000001]){
                    rotate(a=[0, -14, 0]){
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
        hull(){
            union(){
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 42.83, -5.6000000000000005]){
                            rotate(a=[20, -14, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
                                translate(v=[9.4475, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[84.66, 21.415, -3.3]){
                            rotate(a=[0, -19.599999999999998, 0]){
                                translate(v=[-9.4575, 9.1975, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 42.83, -5.6000000000000005]){
                            rotate(a=[20, -14, 0]){
                                translate(v=[9.4475, -9.2075, -1.5]){
                                    cube(size=[0.01, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[83.66, 42.83, 0.7000000000000001]){
                            rotate(a=[20, -19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[63.745, 21.415, -9.600000000000001]){
                            rotate(a=[0, -14, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[84.66, 21.415, -3.3]){
                            rotate(a=[0, -19.599999999999998, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[62.745, 42.83, -5.6000000000000005]){
                    rotate(a=[20, -14, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[62.745, 42.83, -5.6000000000000005]){
                                    rotate(a=[20, -14, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[62.745, 42.83, -5.6000000000000005]){
                                        rotate(a=[20, -14, 0]){
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
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[62.745, 42.83, -5.6000000000000005]){
                                        rotate(a=[20, -14, 0]){
                                            translate(v=[9.4475, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, -19.599999999999998, 0]){
                                            translate(v=[-9.4575, 9.2075, -1.5]){
                                                cube(size=[0.01, 3, 3]);
                                            };
                                        };
                                    };
                                };
                            };
                            translate(v=[0, 0, -100]){
                                union(){
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[62.745, 42.83, -5.6000000000000005]){
                                                rotate(a=[20, -14, 0]){
                                                    translate(v=[9.4475, 9.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[83.66, 42.83, 0.7000000000000001]){
                                                rotate(a=[20, -19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[62.745, 42.83, -5.6000000000000005]){
                            rotate(a=[20, -14, 0]){
                                translate(v=[9.4575, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[83.66, 42.83, 0.7000000000000001]){
                            rotate(a=[20, -19.599999999999998, 0]){
                                translate(v=[-9.4675, -9.2075, -1.5]){
                                    cube(size=[0.01, 18.415, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[83.66, 0.0, 0.7000000000000001]){
                    rotate(a=[-20, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[83.66, 0.0, 0.7000000000000001]){
                                    rotate(a=[-20, -19.599999999999998, 0]){
                                        translate(v=[-9.4575, -12.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[83.66, 0.0, 0.7000000000000001]){
                                    rotate(a=[-20, -19.599999999999998, 0]){
                                        translate(v=[9.4575, -12.2075, -1.5]){
                                            cube(size=[3, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[83.66, 0.0, 0.7000000000000001]){
                                    rotate(a=[-20, -19.599999999999998, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[3, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 0.0, 0.7000000000000001]){
                                        rotate(a=[-20, -19.599999999999998, 0]){
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
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[83.66, 0.0, 0.7000000000000001]){
                                            rotate(a=[-20, -19.599999999999998, 0]){
                                                translate(v=[9.4575, 9.1975, -1.5]){
                                                    cube(size=[3, 0.01, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[84.66, 21.415, -3.3]){
                                            rotate(a=[0, -19.599999999999998, 0]){
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
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[83.66, 0.0, 0.7000000000000001]){
                                                rotate(a=[-20, -19.599999999999998, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[84.66, 21.415, -3.3]){
                                                rotate(a=[0, -19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[83.66, 0.0, 0.7000000000000001]){
                            rotate(a=[-20, -19.599999999999998, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[84.66, 21.415, -3.3]){
                            rotate(a=[0, -19.599999999999998, 0]){
                                translate(v=[-9.4575, -9.2175, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[84.66, 21.415, -3.3]){
                    rotate(a=[0, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[84.66, 21.415, -3.3]){
                                    rotate(a=[0, -19.599999999999998, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[3, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[84.66, 21.415, -3.3]){
                                        rotate(a=[0, -19.599999999999998, 0]){
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
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[84.66, 21.415, -3.3]){
                                            rotate(a=[0, -19.599999999999998, 0]){
                                                translate(v=[9.4575, 9.1975, -1.5]){
                                                    cube(size=[3, 0.01, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, 75]){
                                    rotate(a=[-35, 30, -40]){
                                        translate(v=[83.66, 42.83, 0.7000000000000001]){
                                            rotate(a=[20, -19.599999999999998, 0]){
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
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[84.66, 21.415, -3.3]){
                                                rotate(a=[0, -19.599999999999998, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[3, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 75]){
                                        rotate(a=[-35, 30, -40]){
                                            translate(v=[83.66, 42.83, 0.7000000000000001]){
                                                rotate(a=[20, -19.599999999999998, 0]){
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
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[84.66, 21.415, -3.3]){
                            rotate(a=[0, -19.599999999999998, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[0, 0, 75]){
                    rotate(a=[-35, 30, -40]){
                        translate(v=[83.66, 42.83, 0.7000000000000001]){
                            rotate(a=[20, -19.599999999999998, 0]){
                                translate(v=[-9.4575, -9.2175, -1.5]){
                                    cube(size=[18.915, 0.01, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        translate(v=[0, 0, 75]){
            rotate(a=[-35, 30, -40]){
                translate(v=[83.66, 42.83, 0.7000000000000001]){
                    rotate(a=[20, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[83.66, 42.83, 0.7000000000000001]){
                                    rotate(a=[20, -19.599999999999998, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[83.66, 42.83, 0.7000000000000001]){
                                    rotate(a=[20, -19.599999999999998, 0]){
                                        translate(v=[9.4575, 9.2075, -1.5]){
                                            cube(size=[3, 3, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, -19.599999999999998, 0]){
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
                        translate(v=[0, 0, 75]){
                            rotate(a=[-35, 30, -40]){
                                translate(v=[83.66, 42.83, 0.7000000000000001]){
                                    rotate(a=[20, -19.599999999999998, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[3, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, -100]){
                            translate(v=[0, 0, 75]){
                                rotate(a=[-35, 30, -40]){
                                    translate(v=[83.66, 42.83, 0.7000000000000001]){
                                        rotate(a=[20, -19.599999999999998, 0]){
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
};

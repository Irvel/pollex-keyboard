mirror([1, 0, 0]){
    difference(){
        union(){
            hull(){
                union(){
                    translate(v=[-3, 0, 0]){
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4575, -12.2075, -1.5]){
                                            cube(size=[3, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[86.86, -16.0, -2.0]){
                                rotate(a=[-26, -2, 0]){
                                    translate(v=[-13.4575, -9.2075, -1.5]){
                                        cube(size=[7, 2, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    translate(v=[-54.0, 6.8, 48.1]){
                        rotate(a=[35, -25, -42]){
                            translate(v=[0.0, 43.03, 0]){
                                rotate(a=[12, 18, 0]){
                                    translate(v=[-12.4575, 6.2075, -1.5]){
                                        cube(size=[3, 6, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[0.0, 53.23, 0.1]){
                                rotate(a=[36, 2.4, 0]){
                                    translate(v=[-12.4575, -9.2075, -1.5]){
                                        cube(size=[8, 1.2, 3]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            hull(){
                union(){
                    minkowski(){
                        translate(v=[-55, 70, 0]){
                            cube(size=[10, 10, 0.1]);
                        };
                        cylinder(h=0.001, r=5);
                        sphere(r=1);
                    };
                    translate(v=[-3.5, -8, 0]){
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 53.23, 0.1]){
                                    rotate(a=[36, 2.4, 0]){
                                        translate(v=[-12.4575, -9.2075, -1.5]){
                                            cube(size=[18, 5, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            union(){
                cube(size=0);
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[0.0, 0.0, 0]){
                            rotate(a=[-12, 18, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-12, 18, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[0.0, 0.0, 0]){
                                                rotate(a=[-12, 18, 0]){
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
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[0.0, 0.0, 0]){
                                                rotate(a=[-12, 18, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[21.314999999999998, 0.0, -3.6]){
                                                rotate(a=[-12, 0, 0]){
                                                    translate(v=[-9.4575, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, -100]){
                                        union(){
                                            translate(v=[-54.0, 6.8, 48.1]){
                                                rotate(a=[35, -25, -42]){
                                                    translate(v=[0.0, 0.0, 0]){
                                                        rotate(a=[-12, 18, 0]){
                                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                                cube(size=[0.01, 3, 3]);
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                            translate(v=[-54.0, 6.8, 48.1]){
                                                rotate(a=[35, -25, -42]){
                                                    translate(v=[21.314999999999998, 0.0, -3.6]){
                                                        rotate(a=[-12, 0, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[0.0, 0.0, 0]){
                                            rotate(a=[-12, 18, 0]){
                                                translate(v=[-12.4575, -12.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[0.0, 0.0, 0]){
                                                rotate(a=[-12, 18, 0]){
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
                hull(){
                    union(){
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 0.0, 0]){
                                    rotate(a=[-12, 18, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 21.515, -2.4]){
                                    rotate(a=[0, 18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 0.0, 0]){
                                    rotate(a=[-12, 18, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 0.0, -3.6]){
                                    rotate(a=[-12, 0, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 21.515, -2.4]){
                                    rotate(a=[0, 18, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 0.0, 0]){
                                    rotate(a=[-12, 18, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 0.0, -3.6]){
                                    rotate(a=[-12, 0, 0]){
                                        translate(v=[-9.4675, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[0.0, 21.515, -2.4]){
                            rotate(a=[0, 18, 0]){
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
                                hull(){
                                    union(){
                                        translate(v=[-54.0, 6.8, 48.1]){
                                            rotate(a=[35, -25, -42]){
                                                translate(v=[0.0, 21.515, -2.4]){
                                                    rotate(a=[0, 18, 0]){
                                                        translate(v=[-12.4575, 9.1975, -1.5]){
                                                            cube(size=[3, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[-54.0, 6.8, 48.1]){
                                            rotate(a=[35, -25, -42]){
                                                translate(v=[0.0, 43.03, 0]){
                                                    rotate(a=[12, 18, 0]){
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
                                            translate(v=[-54.0, 6.8, 48.1]){
                                                rotate(a=[35, -25, -42]){
                                                    translate(v=[0.0, 21.515, -2.4]){
                                                        rotate(a=[0, 18, 0]){
                                                            translate(v=[-12.4575, 9.1975, -1.5]){
                                                                cube(size=[3, 0.01, 3]);
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                            translate(v=[-54.0, 6.8, 48.1]){
                                                rotate(a=[35, -25, -42]){
                                                    translate(v=[0.0, 43.03, 0]){
                                                        rotate(a=[12, 18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 21.515, -2.4]){
                                    rotate(a=[0, 18, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 43.03, 0]){
                                    rotate(a=[12, 18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 21.515, -2.4]){
                                    rotate(a=[0, 18, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 43.03, 0]){
                                    rotate(a=[12, 18, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 43.03, -3.6]){
                                    rotate(a=[12, 0, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 21.515, -2.4]){
                                    rotate(a=[0, 18, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
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
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[0.0, 43.03, 0]){
                            rotate(a=[12, 18, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[0.0, 43.03, 0]){
                                            rotate(a=[12, 18, 0]){
                                                translate(v=[-12.4575, 9.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[0.0, 43.03, 0]){
                                                rotate(a=[12, 18, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[0.0, 43.03, 0]){
                                            rotate(a=[12, 18, 0]){
                                                translate(v=[-12.4575, -9.2075, -1.5]){
                                                    cube(size=[3, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[0.0, 43.03, 0]){
                                                rotate(a=[12, 18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[0.0, 43.03, 0]){
                                    rotate(a=[12, 18, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 43.03, -3.6]){
                                    rotate(a=[12, 0, 0]){
                                        translate(v=[-9.4675, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[21.314999999999998, 0.0, -3.6]){
                            rotate(a=[-12, 0, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[21.314999999999998, 0.0, -3.6]){
                                            rotate(a=[-12, 0, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[21.314999999999998, 0.0, -3.6]){
                                                rotate(a=[-12, 0, 0]){
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
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[21.314999999999998, 0.0, -3.6]){
                                                rotate(a=[-12, 0, 0]){
                                                    translate(v=[9.4475, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[42.629999999999995, 0.0, 0]){
                                                rotate(a=[-12, -18, 0]){
                                                    translate(v=[-9.4575, -12.2075, -1.5]){
                                                        cube(size=[0.01, 3, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, -100]){
                                        union(){
                                            translate(v=[-54.0, 6.8, 48.1]){
                                                rotate(a=[35, -25, -42]){
                                                    translate(v=[21.314999999999998, 0.0, -3.6]){
                                                        rotate(a=[-12, 0, 0]){
                                                            translate(v=[9.4475, -12.2075, -1.5]){
                                                                cube(size=[0.01, 3, 3]);
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                            translate(v=[-54.0, 6.8, 48.1]){
                                                rotate(a=[35, -25, -42]){
                                                    translate(v=[42.629999999999995, 0.0, 0]){
                                                        rotate(a=[-12, -18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 0.0, -3.6]){
                                    rotate(a=[-12, 0, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 0.0, -3.6]){
                                    rotate(a=[-12, 0, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 0.0, 0]){
                                    rotate(a=[-12, -18, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 21.515, -2.4]){
                                    rotate(a=[0, -18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 0.0, -3.6]){
                                    rotate(a=[-12, 0, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 0.0, 0]){
                                    rotate(a=[-12, -18, 0]){
                                        translate(v=[-9.4675, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[21.314999999999998, 21.515, -6.0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 43.03, -3.6]){
                                    rotate(a=[12, 0, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 21.515, -2.4]){
                                    rotate(a=[0, -18, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 43.03, -3.6]){
                                    rotate(a=[12, 0, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 43.03, 0]){
                                    rotate(a=[12, -18, 0]){
                                        *translate(v=[-9.4575, -9.2075, -1.5]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 21.515, -6.0]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 21.515, -2.4]){
                                    rotate(a=[0, -18, 0]){
                                        translate(v=[-9.4675, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[21.314999999999998, 43.03, -3.6]){
                            rotate(a=[12, 0, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[21.314999999999998, 43.03, -3.6]){
                                    rotate(a=[12, 0, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 43.03, 0]){
                                    rotate(a=[12, -18, 0]){
                                        *translate(v=[-9.4675, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[42.629999999999995, 0.0, 0]){
                            rotate(a=[-12, -18, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[42.629999999999995, 0.0, 0]){
                                            rotate(a=[-12, -18, 0]){
                                                translate(v=[-9.4575, -12.2075, -1.5]){
                                                    cube(size=[18.915, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[42.629999999999995, 0.0, 0]){
                                                rotate(a=[-12, -18, 0]){
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
                                translate(v=[-54.0, 6.8, 48.1]){
                                    rotate(a=[35, -25, -42]){
                                        translate(v=[42.629999999999995, 0.0, 0]){
                                            rotate(a=[-12, -18, 0]){
                                                translate(v=[9.4575, -12.2075, -1.5]){
                                                    cube(size=[3, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[-54.0, 6.8, 48.1]){
                                        rotate(a=[35, -25, -42]){
                                            translate(v=[42.629999999999995, 0.0, 0]){
                                                rotate(a=[-12, -18, 0]){
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
                hull(){
                    union(){
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 0.0, 0]){
                                    rotate(a=[-12, -18, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 21.515, -2.4]){
                                    rotate(a=[0, -18, 0]){
                                        translate(v=[-9.4575, -9.2175, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                translate(v=[-54.0, 6.8, 48.1]){
                    rotate(a=[35, -25, -42]){
                        translate(v=[42.629999999999995, 21.515, -2.4]){
                            rotate(a=[0, -18, 0]){
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
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 21.515, -2.4]){
                                    rotate(a=[0, -18, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[-54.0, 6.8, 48.1]){
                            rotate(a=[35, -25, -42]){
                                translate(v=[42.629999999999995, 43.03, 0]){
                                    rotate(a=[12, -18, 0]){
                                        *translate(v=[-9.4575, -9.2175, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                *cube(size=0);
            };
            union(){
                cube(size=0);
                translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 0.8, -1.9]){
                            rotate(a=[-26, 2.4, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 0.8, -1.9]){
                            rotate(a=[-26, 2.4, 0]){
                                translate(v=[-9.4575, -13.2075, -1.5]){
                                    cube(size=[18.915, 4, 3]);
                                };
                            };
                        };
                    };
                };
                #hull(){
                    union(){
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 0.8, -1.9]){
                                    rotate(a=[-26, 2.4, 0]){
                                        translate(v=[9.4475, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
                                        translate(v=[-9.4575, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 0.8, -1.9]){
                            rotate(a=[-26, 2.4, 0]){
                                translate(v=[-13.4575, -13.2075, -1.5]){
                                    cube(size=[4, 4, 3]);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 0.8, -1.9]){
                            rotate(a=[-26, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 0.8, -1.9]){
                                    rotate(a=[-26, 2.4, 0]){
                                        translate(v=[-13.4575, 9.1975, -1.5]){
                                            cube(size=[4, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 0.8, -1.9]){
                                    rotate(a=[-26, 2.4, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 0.8, -1.9]){
                                    rotate(a=[-26, 2.4, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 0.8, -1.9]){
                                    rotate(a=[-26, 2.4, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[-0.2, 27.015, -7.1000000000000005]){
                            rotate(a=[0, 2.4, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[-0.2, 27.015, -7.1000000000000005]){
                            rotate(a=[0, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
                                        translate(v=[-13.4575, 9.1975, -1.5]){
                                            cube(size=[4, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 53.23, 0.1]){
                                    rotate(a=[36, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 53.23, 0.1]){
                                    rotate(a=[36, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 53.23, 0.1]){
                                    rotate(a=[36, 2.4, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[-0.2, 27.015, -7.1000000000000005]){
                                    rotate(a=[0, 2.4, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 53.23, 0.1]){
                            rotate(a=[36, 2.4, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 53.23, 0.1]){
                            rotate(a=[36, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 53.23, 0.1]){
                                    rotate(a=[36, 2.4, 0]){
                                        translate(v=[9.4475, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 53.23, 0.1]){
                            rotate(a=[36, 2.4, 0]){
                                translate(v=[-13.4575, 9.2075, -1.5]){
                                    cube(size=[4, 4, 3]);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[0.0, 53.23, 0.1]){
                            rotate(a=[36, 2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[0.0, 53.23, 0.1]){
                                    rotate(a=[36, 2.4, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[21.615, 0.8, -2.8]){
                            rotate(a=[-26, 2, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[21.615, 0.8, -2.8]){
                            rotate(a=[-26, 2, 0]){
                                translate(v=[-9.4575, -13.2075, -1.5]){
                                    cube(size=[18.915, 4, 3]);
                                };
                            };
                        };
                    };
                };
                #hull(){
                    union(){
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
                                        translate(v=[9.4475, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
                                        translate(v=[-9.4575, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 0.8, -2.8]){
                                    rotate(a=[-26, 2, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[21.415, 27.015, -8.0]){
                            rotate(a=[0, 2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.415, 27.015, -8.0]){
                                    rotate(a=[0, 2, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[21.615, 53.23, -0.8]){
                            rotate(a=[36, 2, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[21.615, 53.23, -0.8]){
                            rotate(a=[36, 2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
                                        translate(v=[9.4475, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
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
                hull(){
                    union(){
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[21.615, 53.23, -0.8]){
                                    rotate(a=[36, 2, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[43.23, -3.0, -10.2]){
                            rotate(a=[-26, 0, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[43.23, -3.0, -10.2]){
                            rotate(a=[-26, 0, 0]){
                                translate(v=[-9.4575, -13.2075, -1.5]){
                                    cube(size=[18.915, 4, 3]);
                                };
                            };
                        };
                    };
                };
                #hull(){
                    union(){
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
                                        translate(v=[9.4475, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
                                        translate(v=[-9.4575, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, -3.0, -10.2]){
                                    rotate(a=[-26, 0, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[43.23, 25.215, -15.399999999999999]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
                                    rotate(a=[36, 0, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 25.215, -15.399999999999999]){
                                    rotate(a=[0, 0, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[43.23, 53.43, -8.2]){
                            rotate(a=[36, 0, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[43.23, 53.43, -8.2]){
                            rotate(a=[36, 0, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
                                    rotate(a=[36, 0, 0]){
                                        translate(v=[9.4475, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[43.23, 53.43, -8.2]){
                                    rotate(a=[36, 0, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[64.845, -8.0, -8.8]){
                            rotate(a=[-26, -2.4, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[64.845, -8.0, -8.8]){
                            rotate(a=[-26, -2.4, 0]){
                                translate(v=[-9.4575, -13.2075, -1.5]){
                                    cube(size=[18.915, 4, 3]);
                                };
                            };
                        };
                    };
                };
                #hull(){
                    union(){
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
                                        translate(v=[9.4475, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, -16.0, -2.0]){
                                    rotate(a=[-26, -2, 0]){
                                        translate(v=[-9.4575, -13.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, -16.0, -2.0]){
                                    rotate(a=[-26, -2, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                    rotate(a=[0, -2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, -8.0, -8.8]){
                                    rotate(a=[-26, -2.4, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, -16.0, -2.0]){
                                    rotate(a=[-26, -2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[65.045, 19.015, -14.0]){
                            rotate(a=[0, -2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
                                        translate(v=[9.4475, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                    rotate(a=[0, -2, 0]){
                                        translate(v=[-9.4575, 9.1975, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
                                        translate(v=[9.4475, -9.2075, -1.5]){
                                            cube(size=[0.01, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, 32.03, 0.0]){
                                    rotate(a=[36, -2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[65.045, 19.015, -14.0]){
                                    rotate(a=[0, -2.4, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                    rotate(a=[0, -2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[64.845, 46.03, -6.8]){
                            rotate(a=[36, -2.4, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[64.845, 46.03, -6.8]){
                            rotate(a=[36, -2.4, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
                                        translate(v=[9.4475, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, 32.03, 0.0]){
                                    rotate(a=[36, -2, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[0.01, 4, 3]);
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[64.845, 46.03, -6.8]){
                                    rotate(a=[36, -2.4, 0]){
                                        translate(v=[9.4575, -9.2075, -1.5]){
                                            cube(size=[0.01, 18.415, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, 32.03, 0.0]){
                                    rotate(a=[36, -2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[86.86, -16.0, -2.0]){
                            rotate(a=[-26, -2, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[86.86, -16.0, -2.0]){
                            rotate(a=[-26, -2, 0]){
                                translate(v=[-9.4575, -13.2075, -1.5]){
                                    cube(size=[18.915, 4, 3]);
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
                                    rotate(a=[0, 78, -10]){
                                        translate(v=[86.86, -16.0, -2.0]){
                                            rotate(a=[-26, -2, 0]){
                                                translate(v=[9.4575, -12.2075, -1.5]){
                                                    cube(size=[4, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[86.86, -16.0, -2.0]){
                                                rotate(a=[-26, -2, 0]){
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
                                    rotate(a=[0, 78, -10]){
                                        translate(v=[86.86, -16.0, -2.0]){
                                            rotate(a=[-26, -2, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[4, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[86.86, -16.0, -2.0]){
                                                rotate(a=[-26, -2, 0]){
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
                                            rotate(a=[0, 78, -10]){
                                                translate(v=[86.86, -16.0, -2.0]){
                                                    rotate(a=[-26, -2, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[0, 78, -10]){
                                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                                    rotate(a=[0, -2, 0]){
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
                                                rotate(a=[0, 78, -10]){
                                                    translate(v=[86.86, -16.0, -2.0]){
                                                        rotate(a=[-26, -2, 0]){
                                                            translate(v=[9.4575, 9.1975, -1.5]){
                                                                cube(size=[4, 0.01, 3]);
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                            translate(v=[0, 0, 110]){
                                                rotate(a=[0, 78, -10]){
                                                    translate(v=[87.05999999999999, 8.015, -7.2]){
                                                        rotate(a=[0, -2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, -16.0, -2.0]){
                                    rotate(a=[-26, -2, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                    rotate(a=[0, -2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[87.05999999999999, 8.015, -7.2]){
                            rotate(a=[0, -2, 0]){
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
                                    rotate(a=[0, 78, -10]){
                                        translate(v=[87.05999999999999, 8.015, -7.2]){
                                            rotate(a=[0, -2, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[4, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[87.05999999999999, 8.015, -7.2]){
                                                rotate(a=[0, -2, 0]){
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
                                            rotate(a=[0, 78, -10]){
                                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                                    rotate(a=[0, -2, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[0, 78, -10]){
                                                translate(v=[86.86, 32.03, 0.0]){
                                                    rotate(a=[36, -2, 0]){
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
                                                rotate(a=[0, 78, -10]){
                                                    translate(v=[87.05999999999999, 8.015, -7.2]){
                                                        rotate(a=[0, -2, 0]){
                                                            translate(v=[9.4575, 9.1975, -1.5]){
                                                                cube(size=[4, 0.01, 3]);
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                            translate(v=[0, 0, 110]){
                                                rotate(a=[0, 78, -10]){
                                                    translate(v=[86.86, 32.03, 0.0]){
                                                        rotate(a=[36, -2, 0]){
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
                            rotate(a=[0, 78, -10]){
                                translate(v=[87.05999999999999, 8.015, -7.2]){
                                    rotate(a=[0, -2, 0]){
                                        translate(v=[-9.4575, 9.2075, -1.5]){
                                            cube(size=[18.915, 0.01, 3]);
                                        };
                                    };
                                };
                            };
                        };
                        translate(v=[0, 0, 110]){
                            rotate(a=[0, 78, -10]){
                                translate(v=[86.86, 32.03, 0.0]){
                                    rotate(a=[36, -2, 0]){
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
                    rotate(a=[0, 78, -10]){
                        translate(v=[86.86, 32.03, 0.0]){
                            rotate(a=[36, -2, 0]){
                                difference(){
                                    cube(size=[18.915, 18.415, 3], center=true);
                                    cube(size=[14.4, 14.4, 3], center=true);
                                };
                            };
                        };
                    };
                };
                #translate(v=[0, 0, 110]){
                    rotate(a=[0, 78, -10]){
                        translate(v=[86.86, 32.03, 0.0]){
                            rotate(a=[36, -2, 0]){
                                translate(v=[-9.4575, 9.2075, -1.5]){
                                    cube(size=[18.915, 4, 3]);
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
                                    rotate(a=[0, 78, -10]){
                                        translate(v=[86.86, 32.03, 0.0]){
                                            rotate(a=[36, -2, 0]){
                                                translate(v=[9.4575, 9.2075, -1.5]){
                                                    cube(size=[4, 3, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[86.86, 32.03, 0.0]){
                                                rotate(a=[36, -2, 0]){
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
                                    rotate(a=[0, 78, -10]){
                                        translate(v=[86.86, 32.03, 0.0]){
                                            rotate(a=[36, -2, 0]){
                                                translate(v=[9.4575, -9.2075, -1.5]){
                                                    cube(size=[4, 18.415, 3]);
                                                };
                                            };
                                        };
                                    };
                                };
                                translate(v=[0, 0, -100]){
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[86.86, 32.03, 0.0]){
                                                rotate(a=[36, -2, 0]){
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
        };
        union(){
            color("Blue"){
                translate(v=[-46, -20, 22]){
                    rotate(a=[100, 0, 0]){
                        cylinder(h=38, r=16, center=true);
                    };
                };
            };
            color("Blue"){
                translate(v=[-46, -20, 6]){
                    rotate(a=[100, 0, 0]){
                        cylinder(h=38, r=16, center=true);
                    };
                };
            };
        };
    };
};

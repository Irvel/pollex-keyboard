mirror([1, 0, 0]){
    union(){
        hull(){
            union(){
                translate(v=[-3, 0, 0]){
                    translate(v=[-50.0, 10.8, 90]){
                        rotate(a=[40, -15, -40]){
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
                        translate(v=[84.86, -16.0, -23.28]){
                            rotate(a=[-26, 9.6, 0]){
                                translate(v=[-17.4575, -9.2075, -1.5]){
                                    cube(size=[17, 2, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        hull(){
            union(){
                translate(v=[-3, 0, 0]){
                    translate(v=[-50.0, 10.8, 90]){
                        rotate(a=[40, -15, -40]){
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
                        translate(v=[63.345, -8.0, -13.6]){
                            rotate(a=[-26, 8, 0]){
                                translate(v=[-17.4575, -9.2075, -1.5]){
                                    cube(size=[8, 2, 3]);
                                };
                            };
                        };
                    };
                };
            };
        };
        hull(){
            union(){
                translate(v=[-50.0, 10.8, 90]){
                    rotate(a=[40, -15, -40]){
                        translate(v=[0.0, 43.03, 0]){
                            rotate(a=[12, 18, 0]){
                                translate(v=[-12.4575, 6.2075, -1.5]){
                                    cube(size=[3, 6, 3]);
                                };
                            };
                        };
                    };
                };
                translate(v=[-3, -5, 0]){
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[42.23, 53.43, -7]){
                                rotate(a=[36, 0, 0]){
                                    translate(v=[-12.4575, -9.2075, -1.5]){
                                        cube(size=[12, 3, 3]);
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
                minkowski(){
                    difference(){
                        cube(size=[499.9, 499.9, 499.9], center=true);
                        minkowski(){
                            difference(){
                                cube(size=[500, 500, 500], center=true);
                                minkowski(){
                                    translate(v=[-55, 70, 0]){
                                        cube(size=[10, 10, 0.1]);
                                    };
                                    sphere(r=1);
                                };
                            };
                            sphere(r=2);
                        };
                    };
                    sphere(r=1);
                };
                translate(v=[-3.5, -8, 0]){
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[0.0, 53.23, 0]){
                                rotate(a=[36, 0, 0]){
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
        hull(){
            union(){
                minkowski(){
                    translate(v=[-55, -20, 0]){
                        cube(size=[10, 10, 0.1]);
                    };
                    cylinder(h=0.001, r=5);
                    sphere(r=1);
                };
                translate(v=[-3.5, -8, 0]){
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[42.23, 25.215, -14.2]){
                                rotate(a=[0, 0, 0]){
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
            translate(v=[0, 0, 110]){
                rotate(a=[0, 78, -10]){
                    translate(v=[0.0, 0.8, -2]){
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
                    translate(v=[0.0, 0.8, -2]){
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
                            translate(v=[0.0, 0.8, -2]){
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
                            translate(v=[21.115, 0.8, -2]){
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
            #translate(v=[0, 0, 110]){
                rotate(a=[0, 78, -10]){
                    translate(v=[0.0, 0.8, -2]){
                        rotate(a=[-26, 0, 0]){
                            translate(v=[-13.4575, -13.2075, -1.5]){
                                cube(size=[4, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[0, 78, -10]){
                    translate(v=[0.0, 0.8, -2]){
                        rotate(a=[-26, 0, 0]){
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
                            translate(v=[0.0, 0.8, -2]){
                                rotate(a=[-26, 0, 0]){
                                    translate(v=[-13.4575, 9.1975, -1.5]){
                                        cube(size=[4, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[0.65, 27.015, -7.2]){
                                rotate(a=[0, 0, 0]){
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
                            translate(v=[0.0, 0.8, -2]){
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
                            translate(v=[0.65, 27.015, -7.2]){
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
                            translate(v=[0.0, 0.8, -2]){
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
                            translate(v=[21.115, 0.8, -2]){
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
                            translate(v=[0.65, 27.015, -7.2]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[0.0, 0.8, -2]){
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
                            translate(v=[21.115, 0.8, -2]){
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
                    translate(v=[0.65, 27.015, -7.2]){
                        rotate(a=[0, 0, 0]){
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
                    translate(v=[0.65, 27.015, -7.2]){
                        rotate(a=[0, 0, 0]){
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
                            translate(v=[0.65, 27.015, -7.2]){
                                rotate(a=[0, 0, 0]){
                                    translate(v=[-13.4575, 9.1975, -1.5]){
                                        cube(size=[4, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[0.0, 53.23, 0]){
                                rotate(a=[36, 0, 0]){
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
                            translate(v=[0.65, 27.015, -7.2]){
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
                            translate(v=[0.0, 53.23, 0]){
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
                            translate(v=[0.65, 27.015, -7.2]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[0.0, 53.23, 0]){
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
                            translate(v=[21.115, 53.23, 0]){
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
                            translate(v=[0.65, 27.015, -7.2]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                    translate(v=[0.0, 53.23, 0]){
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
                    translate(v=[0.0, 53.23, 0]){
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
                            translate(v=[0.0, 53.23, 0]){
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
                            translate(v=[21.115, 53.23, 0]){
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
            #translate(v=[0, 0, 110]){
                rotate(a=[0, 78, -10]){
                    translate(v=[0.0, 53.23, 0]){
                        rotate(a=[36, 0, 0]){
                            translate(v=[-13.4575, 9.2075, -1.5]){
                                cube(size=[4, 4, 3]);
                            };
                        };
                    };
                };
            };
            #translate(v=[0, 0, 110]){
                rotate(a=[0, 78, -10]){
                    translate(v=[0.0, 53.23, 0]){
                        rotate(a=[36, 0, 0]){
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
                            translate(v=[0.0, 53.23, 0]){
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
                            translate(v=[21.115, 53.23, 0]){
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
                    translate(v=[21.115, 0.8, -2]){
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
                    translate(v=[21.115, 0.8, -2]){
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
                            translate(v=[21.115, 0.8, -2]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[21.115, 0.8, -2]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[21.115, 0.8, -2]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[21.115, 0.8, -2]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                    translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[21.115, 53.23, 0]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[21.115, 53.23, 0]){
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
                            translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[21.764999999999997, 27.015, -7.2]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                    translate(v=[21.115, 53.23, 0]){
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
                    translate(v=[21.115, 53.23, 0]){
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
                            translate(v=[21.115, 53.23, 0]){
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
                            translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[21.115, 53.23, 0]){
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
                            translate(v=[42.23, 53.43, -7]){
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
                    translate(v=[42.23, -3.0, -9]){
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
                    translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
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
                            translate(v=[42.23, -3.0, -9]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
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
                    translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
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
                            translate(v=[42.23, 25.215, -14.2]){
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
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
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
                    translate(v=[42.23, 53.43, -7]){
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
                    translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
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
                            translate(v=[42.23, 53.43, -7]){
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
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
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
                    translate(v=[63.345, -8.0, -13.6]){
                        rotate(a=[-26, 8, 0]){
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
                    translate(v=[63.345, -8.0, -13.6]){
                        rotate(a=[-26, 8, 0]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
                                    translate(v=[9.4475, -13.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, -16.0, -23.28]){
                                rotate(a=[-26, 9.6, 0]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, -16.0, -23.28]){
                                rotate(a=[-26, 9.6, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                rotate(a=[0, 9.6, 0]){
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
                            translate(v=[63.345, -8.0, -13.6]){
                                rotate(a=[-26, 8, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, -16.0, -23.28]){
                                rotate(a=[-26, 9.6, 0]){
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
                    translate(v=[62.695, 18.915, -18.8]){
                        rotate(a=[0, 8, 0]){
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
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
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
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
                                    translate(v=[9.4475, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                rotate(a=[0, 9.6, 0]){
                                    translate(v=[-9.4575, 9.1975, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
                                    translate(v=[9.4475, -9.2075, -1.5]){
                                        cube(size=[0.01, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, 31.83, -21.28]){
                                rotate(a=[36, 9.6, 0]){
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
                            translate(v=[62.695, 18.915, -18.8]){
                                rotate(a=[0, 8, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                rotate(a=[0, 9.6, 0]){
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
                    translate(v=[63.345, 45.83, -11.6]){
                        rotate(a=[36, 8, 0]){
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
                    translate(v=[63.345, 45.83, -11.6]){
                        rotate(a=[36, 8, 0]){
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
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
                                    translate(v=[9.4475, 9.2075, -1.5]){
                                        cube(size=[0.01, 4, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, 31.83, -21.28]){
                                rotate(a=[36, 9.6, 0]){
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
                            translate(v=[63.345, 45.83, -11.6]){
                                rotate(a=[36, 8, 0]){
                                    translate(v=[9.4575, -9.2075, -1.5]){
                                        cube(size=[0.01, 18.415, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, 31.83, -21.28]){
                                rotate(a=[36, 9.6, 0]){
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
                    translate(v=[84.86, -16.0, -23.28]){
                        rotate(a=[-26, 9.6, 0]){
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
                    translate(v=[84.86, -16.0, -23.28]){
                        rotate(a=[-26, 9.6, 0]){
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
                                    translate(v=[84.86, -16.0, -23.28]){
                                        rotate(a=[-26, 9.6, 0]){
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
                                        translate(v=[84.86, -16.0, -23.28]){
                                            rotate(a=[-26, 9.6, 0]){
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
                                    translate(v=[84.86, -16.0, -23.28]){
                                        rotate(a=[-26, 9.6, 0]){
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
                                        translate(v=[84.86, -16.0, -23.28]){
                                            rotate(a=[-26, 9.6, 0]){
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
                                            translate(v=[84.86, -16.0, -23.28]){
                                                rotate(a=[-26, 9.6, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[4, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                                rotate(a=[0, 9.6, 0]){
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
                                                translate(v=[84.86, -16.0, -23.28]){
                                                    rotate(a=[-26, 9.6, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[0, 78, -10]){
                                                translate(v=[84.21, 7.914999999999999, -28.48]){
                                                    rotate(a=[0, 9.6, 0]){
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
                            translate(v=[84.86, -16.0, -23.28]){
                                rotate(a=[-26, 9.6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                rotate(a=[0, 9.6, 0]){
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
                    translate(v=[84.21, 7.914999999999999, -28.48]){
                        rotate(a=[0, 9.6, 0]){
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
                                    translate(v=[84.21, 7.914999999999999, -28.48]){
                                        rotate(a=[0, 9.6, 0]){
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
                                        translate(v=[84.21, 7.914999999999999, -28.48]){
                                            rotate(a=[0, 9.6, 0]){
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
                                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                                rotate(a=[0, 9.6, 0]){
                                                    translate(v=[9.4575, 9.1975, -1.5]){
                                                        cube(size=[4, 0.01, 3]);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                    translate(v=[0, 0, 110]){
                                        rotate(a=[0, 78, -10]){
                                            translate(v=[84.86, 31.83, -21.28]){
                                                rotate(a=[36, 9.6, 0]){
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
                                                translate(v=[84.21, 7.914999999999999, -28.48]){
                                                    rotate(a=[0, 9.6, 0]){
                                                        translate(v=[9.4575, 9.1975, -1.5]){
                                                            cube(size=[4, 0.01, 3]);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                        translate(v=[0, 0, 110]){
                                            rotate(a=[0, 78, -10]){
                                                translate(v=[84.86, 31.83, -21.28]){
                                                    rotate(a=[36, 9.6, 0]){
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
                            translate(v=[84.21, 7.914999999999999, -28.48]){
                                rotate(a=[0, 9.6, 0]){
                                    translate(v=[-9.4575, 9.2075, -1.5]){
                                        cube(size=[18.915, 0.01, 3]);
                                    };
                                };
                            };
                        };
                    };
                    translate(v=[0, 0, 110]){
                        rotate(a=[0, 78, -10]){
                            translate(v=[84.86, 31.83, -21.28]){
                                rotate(a=[36, 9.6, 0]){
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
                    translate(v=[84.86, 31.83, -21.28]){
                        rotate(a=[36, 9.6, 0]){
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
                    translate(v=[84.86, 31.83, -21.28]){
                        rotate(a=[36, 9.6, 0]){
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
                                    translate(v=[84.86, 31.83, -21.28]){
                                        rotate(a=[36, 9.6, 0]){
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
                                        translate(v=[84.86, 31.83, -21.28]){
                                            rotate(a=[36, 9.6, 0]){
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
                                    translate(v=[84.86, 31.83, -21.28]){
                                        rotate(a=[36, 9.6, 0]){
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
                                        translate(v=[84.86, 31.83, -21.28]){
                                            rotate(a=[36, 9.6, 0]){
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
        color("Blue"){
            translate(v=[-1.7876561394523387, 1.1275532991231774, 109.58417661836448]){
                cube(size=10, center=true);
            };
        };
        color("Blue"){
            translate(v=[2.5357044069728087, 0.36522818745793195, 88.93059002887017]){
                cube(size=10, center=true);
            };
        };
    };
};

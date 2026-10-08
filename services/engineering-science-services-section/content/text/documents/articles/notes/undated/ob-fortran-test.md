---
title: a collection of examples for ob-fortran tests
description: "Should fail (TODO: add input variables for the case with explicit program statement)"
---

# simple programs {#459384e8-1797-4f11-867e-dde0473ea7cc}

``` {#hello .fortran results="silent"}
print *, 'Hello world'
```

``` {#fortran_parameter .fortran results="silent"}
integer, parameter :: i = 10
write (*, '(i2)') i
```

# variable resolution {#d8d1dfd3-5f0c-48fe-b55d-777997e02242}

``` {.fortran var="N = 15" results="silent"}
write (*, '(i2)') N
```

Define for preprocessed fortran

``` {.fortran defines="N 42" results="silent"}
implicit none
write (*, '(i2)') N
```

``` {.fortran var="s=\"word\"" results="silent"}
write (*, '(a4)') s
```

# arrays {#c28569d9-04ce-4cad-ab81-1ea29f691465}

Real array as input

``` {.fortran var="s='(1.0 2.0 3.0)" results="silent"}
write (*, '(3f5.2)'), s
```

|     |
|-----|
| 1.0 |
| 2.0 |

``` {.fortran var="s=test_tbl" results="silent"}
write (*, '(2f5.2)'), s
```

# matrix {#3f73ab19-d25a-428d-8c26-e8c6aa933976}

Real matrix as input

|     |      |
|-----|------|
| 0.0 | 42.0 |
| 0.0 | 0.0  |
| 0.0 | 0.0  |

|     |     |      |
|-----|-----|------|
| 0.0 | 0.0 | 0.0  |
| 0.0 | 0.0 | 42.0 |

``` {.fortran var="s=fortran-input-matrix1" results="silent"}
write (*, '(i2)'), nint(s(1,2))
```

``` {.fortran var="s=fortran-input-matrix2" results="silent"}
write (*, '(i2)'), nint(s(2,3))
```

# failing {#891ead4a-f87a-473c-9ae0-1cf348bcd04f}

Should fail (TODO: add input variables for the case with explicit program statement)

``` {.fortran var="s=\"word\"" results="silent"}
program ex
print *, "output of ex program"
end program ex
```

Fails to compile (TODO: error check in ob-fortran.el)

``` {.fortran var="s='(1 ())" results="silent"}
print *, s
```

Should fail to compile with gfortran

``` {.fortran flags="--std=f95 --pedantic-error" results="silent"}
program ex
integer*8 :: i
end program ex
```

# programs input parameters {#2d5330ea-9934-4737-9ed6-e1d3dae2dfa4}

Pass parameters to the program

``` {.fortran cmdline="\"23\"" results="silent"}
character(len=255) :: cmd
call get_command_argument(1, cmd)
write (*,*) trim(cmd)
```

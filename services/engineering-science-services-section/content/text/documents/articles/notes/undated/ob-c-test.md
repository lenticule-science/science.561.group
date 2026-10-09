---
title: a collection of examples for ob-C tests
---

# Simple tests {#fa6db330-e960-4ea2-ac67-94bb845b8577}

``` {.cpp includes="\"<iostream>\"" results="silent"}
std::cout << 42;
return 0;
```

``` {.cpp includes="<iostream>" results="silent"}
std::cout << 42;
return 0;
```

``` {.D results="silent"}
writefln ("%s", 42);
```

``` {.cpp var="q=12" includes="\"<iostream>\"" results="silent"}
std::cout << q;
return 0;
```

``` {.D var="q=12" results="silent"}
writefln ("%s", q);
```

``` {.cpp var="q=12" var="p=10" includes="\"<iostream>\"" results="silent"}
std::cout << p+q;
return 0;
```

``` {.D var="q=12" var="p=10" results="silent"}
writefln ("%s", p+q);
```

``` {.cpp var="q=\"word\"" includes="'(<iostream> <cstring>)" results="silent"}
std::cout << q << ' ' << std::strlen(q);
return 0;
```

``` {.D var="q=\"word\"" results="silent"}
writefln ("%s %s", q, q.length);
```

``` {.cpp defines="N 42" includes="\"<iostream>\"" results="silent"}
std::cout << N;
return 0;
```

# Array {#2df1ab83-3fa3-462a-a1f3-3aef6044a874}

``` {.cpp includes="\"<iostream>\"" results="vector" results="silent"}
for (int i=1; i<3; i++) {
  std::cout << i << '\n';
}
return 0;
```

``` {.D results="vector" results="silent"}
foreach (i; 1..3)
  writefln ("%s", i);
```

# Matrix {#cc65d6b3-8e8e-4f9c-94cd-f5a00cdeceb5}

|     |     |
|-----|-----|
| 1   | 2   |
| 3   | 4   |

``` {.cpp var="a='(\"abc\" \"def\")" includes="\"<iostream>\"" results="silent"}
std::cout << a[0] << a[1] << sizeof(a)/sizeof(*a) << '\n';
```

``` {.D var="a='(\"abc\" \"def\")" results="silent"}
writefln ("%s%s%s", a[0], a[1], a.length);
```

``` {.cpp var="a='[1 2]" includes="\"<iostream>\"" results="silent"}
std::cout << a[0] << a[1] << sizeof(a)/sizeof(*a) << '\n';
```

``` {.D var="a='[1 2]" results="silent"}
writefln ("%s%s%s", a[0], a[1], a.length);
```

``` {.cpp var="q=C-matrix" includes="\"<iostream>\"" results="silent"}
std::cout << q[0][0] << ' ' << q[1][0] << '\n'
          << q[0][1] << ' ' << q[1][1] << '\n'; // transpose
```

``` {.D var="q=C-matrix" results="silent"}
writefln ("%s %s", q[0][0], q[1][0]);
writefln ("%s %s", q[0][1], q[1][1]); // transpose
```

# Inhomogeneous table {#e112bc2e-419a-4890-99c2-7ac4779531cc}

| day       | quty |
|-----------|------|
| monday    | 34   |
| tuesday   | 41   |
| wednesday | 56   |
| thursday  | 17   |
| friday    | 12   |
| saturday  | 7    |
| sunday    | 4    |

``` {.cpp var="tinomogen=tinomogen" results="silent" includes="<string.h> <stdio.h>"}
int main()
{
  int i, j;
  for (i=0; i<tinomogen_rows; i++) {
    for (j=0; j<tinomogen_cols; j++)
      printf ("%s ", tinomogen[i][j]);
    printf ("\n");
  }
  printf ("Friday %s\n", tinomogen_h(4,"day"));
  return 0;
}
```

``` {.D var="tinomogen=tinomogen" results="silent"}
import std.stdio;
void main()
{
  for (int i=0; i<tinomogen_rows; i++) {
    for (int j=0; j<tinomogen_cols; j++)
      writef ("%s ", tinomogen[i][j]);
    writeln();
  }
  writefln ("Friday %s", tinomogen_h(4,"day"));
}
```

# Output {#9386490b-4063-4400-842c-4a634edbedf5}

``` {.cpp includes="<iostream>" results="output verbatim raw"}
std::cout << "\"line 1\"\n";
std::cout << "\"line 2\"\n";
std::cout << "\"line 3\"\n";
```

# Практическая работа №1

Устименко А.С., группа ИКБО-60-25

## Задание 1

Вывести отсортированный в алфавитном порядке список имен пользователей в файле passwd (вам понадобится grep).

**Решение:**

```sh
#!/bin/sh
cut -d: -f1 /etc/passwd | sort
```

## Задание 2


Вывести данные /etc/protocols в отформатированном и отсортированном порядке для 5 наибольших портов, как показано в примере ниже:

```
[root@localhost etc]# cat /etc/protocols ...
142 rohc
141 wesp
140 shim6
139 hip
138 manet
```

**Решение:**

```sh
#!/bin/sh
awk "{if (\$1 != \"#\") {print \$2, \$1}}" /etc/protocols
```

## Задание 3

Написать программу banner средствами bash для вывода текстов, как в следующем примере (размер баннера должен меняться!):

```
[root@localhost ~]# ./banner "Hello from RTU MIREA!"
+-----------------------+
| Hello from RTU MIREA! |
+-----------------------+
```

**Решение:**

```sh
#!/bin/sh

banner_tb() {
	echo -n "+"
	for i in `seq -1 $message_length`; do
		echo -n "-";
	done
	echo "+"
}

message="$1"
message_length=`echo -n "${message}" | wc -m`

banner_tb
echo "| $message |"
banner_tb
```

## Задание 4

Написать программу для вывода всех идентификаторов (по правилам C/C++ или Java) в файле (без повторений).

Пример для hello.c:

```
h hello include int main n printf return stdio void world
```

**Решение:**

```sh
#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please provide file"
	exit 1
fi

filename="$1"

grep -o "[A-Za-z_][A-Za-z0-9_]*" "$filename" | sort
```

## Задание 5

Написать программу для регистрации пользовательской команды (правильные права доступа и копирование в /usr/local/bin).

Например, пусть программа называется reg:

```
./reg banner
```

В результате для banner задаются правильные права доступа и сам banner копируется в /usr/local/bin.

**Решение:**

```sh
#!/bin/sh

if [ `id -u` -ne 0 ]; then

echo "You need to be root"
	exit 1
fi

if [ $# -lt 1 ]; then
	echo "Please supply the software to install in an argument"
	exit 1
fi

software="$1"

if [ ! -f $software ]; then
	echo "File doesn't exist"
fi

cp "$software" /usr/local/bin
```

## Задание 6

Написать программу для проверки наличия комментария в первой строке файлов с расширением c, js и py.

**Решение:**

```sh
#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please provide an argument";
	exit 1
fi

program=$1

if [ ! -f "$program" ]; then
	echo "File doesn't exist"
	exit 1
fi

first_line=`head -n1 "$program"`

case "$program" in
	*.py)
		case "$first_line" in
			\#*)
				echo "Commented"
				;;
			*)
				echo "Not commented"
				;;
		esac
		;;
	*.js|*.c)
		case "$first_line" in
			*/\**|//*)
				echo "Commented"
				;;
			*)
				echo "Not commented"
				;;
		esac
		;;
	*)
		echo "Don't know what to do"
		;;
esac
```

## Задание 7

Написать программу для нахождения файлов-дубликатов (имеющих 1 или более копий содержимого) по заданному пути (и подкаталогам).

**Решение:**

```sh
#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please provide directory"
	exit 1
fi

dir="$1"
files=`find "$dir" -type f`

for file_a in $files; do
	for file_b in $files; do
		if [ "$file_a" != "$file_b" ] && [ "`basename "$file_a"`" = "`basename "$file_b"`" ]; then
			echo "$file_a"
			break
		fi
	done
done
```

## Задание 8

Написать программу, которая находит все файлы в данном каталоге с расширением, указанным в качестве аргумента и архивирует все эти файлы в архив tar.

**Решение:**

```sh
#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please specify extension"
	exit 1
fi

extension="$1"
filename="$2"

if [ $# -lt 2 ]; then
	filename="archive.tar"
fi

tar -cf "$filename" *.$extension
```

## Задание 9

Написать программу, которая заменяет в файле последовательности из 4 пробелов на символ табуляции. Входной и выходной файлы задаются аргументами.

**Решение:**

```sh
#!/bin/sh

if [ $# -lt 2 ]; then
	echo "Please specify input and output file"
	exit 1
fi

input="$1"
output="$2"

sed "s/    /\t/g" "$input" > "$output"
```

## Задание 10

Написать программу, которая выводит названия всех пустых текстовых файлов в указанной директории. Директория передается в программу параметром.

**Решение:**

```sh
#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Directory not specified"
	exit 1
fi

dir="$1"

for file in $dir/*; do
	if [ ! -s "$file" ]; then
		basename $file
	fi
done
```


[HackMD連結](https://hackmd.io/@FW1212/HJ2yKvKo2)

![](https://hackmd.io/_uploads/rkxpwDKsh.png)

[講義連結](https://drive.google.com/drive/folders/1HvlyXF3bBDTMeIPtQfFBbmW80r-zpsst)

## Part.1 Perl

#### #1 Introduction
:::info

* Perl語言的用途與特點
> * 系統的管理，例如Linux系統終端
> * 網頁的撰寫
> * 便攜性
> * 程式可在少行數內達成，適合終端編寫

* 常用指令列表

![](https://hackmd.io/_uploads/ryHfivFi2.png)

![](https://hackmd.io/_uploads/SyTQjwFo2.png)

:::

#### #2 Data Types
:::info

* 命名不可包含 `@`、`$`、`%`
* 變數標籤前會加上 `$`，例如
> * `$number = 1e-5;`
> * `$string = “Hello World \n”;`

* 要宣告只要在前面加上 `my` 即可，例如
> * `my $num_value = 1e-10;`

* 陣列前會加上 `@` ，例如
> * `@arr_10 = (1..10);`，其中 `..` 為範圍符號
> * `@my_string_arr = (“ab”, “cde”, “efg”);`
> * `@my_scalar_arr = ($a, $b, $c, $d);`，變數陣列的寫法

* 容器的寫法如下，例如Hash開頭會加上`%`

![](https://hackmd.io/_uploads/rk69AvFih.png)

:::

#### #3 Control Structures and Operators 
:::info

* 在Perl中支援了許多判斷的函式
> * `if`、`else`、`unless` 等判斷語句
> * `switch`、`case` 等選擇語句
> * `while`、`until`、`for`、`foreach` 等迴圈語句

* 在Perl中支援了許多種類的運算子
> * 算術運算子

![](https://hackmd.io/_uploads/HyOTldtj3.png)

> * 字串運算子

![](https://hackmd.io/_uploads/r1nClOtin.png)

> * 比較運算子

![](https://hackmd.io/_uploads/HJgVbOKi3.png)

> * 邏輯運算子

![](https://hackmd.io/_uploads/r1cUWdKsn.png)

:::

#### #4 Functions 
:::info

* 多為雜項的函式，若有需要直接參考 [#4 講義連結](https://docs.google.com/presentation/d/1GASKc9phm_CnMTVLzrFqY9L8iqE4-8Oq/edit#slide=id)

:::

#### #5 Input and Output 
:::info

* 使用 `<STDIN>` 來獲取使用者的input，例如
> * `$my_name = <STDIN>;`

* 使用 `open`、`close` 並加上模式代碼來讀取、覆寫、關閉檔案，例如
> * `open (DATA, “<my_file.txt");`
> * `close (DATA);`

![](https://hackmd.io/_uploads/BJWl4dFo2.png)

* 使用 `print` 來輸出各式各樣的output
* 使用 `tell` 來得知變數的儲存位置
* 使用 `seek` 來得知變數的指標
* 使用 `rename` 來重新命名檔案，例如
> * `rename (“~/test/file1.txt”, “~/test/file2.txt”);`

:::

#### #6 Subroutines
:::info

* 子程序即程式語言中的function，可以用來節省重複性的程式撰寫
* 在呼叫子程序時前會加上 `&` ，例如

![](https://hackmd.io/_uploads/ByDASdFj2.png)

:::

#### #7 Regular Expressions 
:::info

* 可以透過 `~` 來對變數進行各式各樣的過濾，例如

![](https://hackmd.io/_uploads/Hk2EDOti3.png)

* 根據本身的變數型態、想過濾的元素不同，Perl程式的寫法也會隨之改變，詳情可以直接參照 [#7 講義連結](https://docs.google.com/presentation/d/1VtvAzcGKlrlDzH2g9mXxtToLGu6D2Xlz/edit#slide=id)

:::

#### #8 Modules 
:::info

* 可以使用 `package` 存放變數、子程序等等，功能即類似程式語言中的inlcude

:::

___

## Part.2 TCL

#### #9 Introduction
:::info

* TCL是Tool Command Language的縮寫
* TCL的用途與特點
> * 不需編譯器
> * 擴增性加且開源
> * 是種很快速的語言，配合GUI可以很快執行

* TCL的執行有兩步驟
> * 撰寫指令與變數的替換
> * 根據結果呈現出來的字串進行評估

:::

#### #10 Data Types
:::info

* 用 `set` 指令來賦值，例如
> * `% set value 10;`
> * `% set string “Hello World”;`

* TCL也有提供list與array的寫法，詳情可以參照講義 [#10 講義連結](https://docs.google.com/presentation/d/13z1FEj1D34bMvtHWpXZyRuvAfBG5jlIN/edit#slide=id)

:::

#### #11 Control Structures and Operators
:::info

* 在TCL中支援了許多判斷的函式
> * `if`、`else` 等判斷語句
> * `switch` 等選擇語句
> * `while`、`for`、`foreach` 等迴圈語句

* 在TCL中支援了許多種類的運算子
> * 算術運算子

![](https://hackmd.io/_uploads/BJcZPmB22.png)

> * 比較運算子

![](https://hackmd.io/_uploads/r1hfDXS22.png)

> * 邏輯運算子

![](https://hackmd.io/_uploads/HktXDmrhh.png)

:::

#### #12 Input and Output
:::info

* 使用 `gets` 來獲取使用者的input，例如
> * `set my_name [gets stdin];`

* 大部分功能與PERL語言相似
* 在TCL中，可以啟動額外的program並將其結果繼續使用下去，例如

![](https://hackmd.io/_uploads/SyKRuXrhn.png)

:::

#### #13 Regular Expressions
:::info

* 可以用 `regexp` 來比較兩者，並於結果顯示是否相同，例如

![](https://hackmd.io/_uploads/SJeutXHnn.png)

* 可以用 `regsub` 來替換元素，例如

![](https://hackmd.io/_uploads/HJrqKmBnh.png)

:::

#### #14 Procedures 
:::info

* 程序即程式語言中的function，可以用來節省重複性的程式撰寫，例如

![](https://hackmd.io/_uploads/S1k857Bn2.png)

:::

#### #15 Packages
:::info

* 可以使用 `package` 存放變數、程序等等，功能即類似程式語言中的inlcude

:::

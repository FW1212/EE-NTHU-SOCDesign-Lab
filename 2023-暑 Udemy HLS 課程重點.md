
[HackMD連結](https://hackmd.io/@FW1212/rJi9HWrqn)

## Part.1 Combinational Circuits
[課程連結](https://www.udemy.com/course/hls-combinational-circuits/)

![](https://hackmd.io/_uploads/SkPVQKPo2.png)

#### #4、5 Basic Iuput/Output
:::info

* Basys3 board可以處理Switch, LED, SSD, Button
* 設計與實作的流程為
> HLS製作IP -> Vivado block design -> 匯入Basys3 board實作

* HLS的設計流程為
> C/C++ coding -> C Simulation -> Add Interfaces(pragma) 
> -> C Synthesis -> IP Generation

* 在Coding中令input/output為unsigned char，即將input/output視為8-bit的訊號
> 搭配前綴法以明確各個bit，例如: 0b11110000, 0xff
 
![](https://hackmd.io/_uploads/SkJm4x_92.png)

* 設定Interfaces的方法有兩種，可以純手打或是使用右方視窗的set directive功能
* 一些Interfaces的打法的範例
> * 因o端不採用任何協議，直接選擇NONE
> `#pragma HLS INTERFACE ap_none port=o`
> * 整個function也需指定Interface為NONE
> `#pragma HLS INTERFACE ap_ctrl_none port=return`

:::

#### #6 Combinational Circuit
:::info

* 組合電路有以下分類: 訊號控制、算數邏輯、乘除法器、coder
* 要注意delay造成的影響，最花時間的路徑稱為criticle delay
* 可以由HLS report來看組合電路的耗時
> 寫在Synthsis report的Timimg項中，可以得知IP的耗時

* 可在HLS加入fuction的概念，在function block中不用指定interfaces，但要記得加入下面的指令來inlining
> `#pragma HLS INLINE off`
> * 在較為簡易的function中系統會自動inlining
> * 只有top function需要指定interfaces

:::

#### #7 C/C++ Testbench
:::info

* Simulation V.S. Synthesis
> * Simulation是testbench做測試的階段
> * Synthesis是匯出IP前的合成階段

* Testbench的流程
> 產生inputs -> 將inputs分別給入design、golden model 
> -> 比較兩者outputs是否相同

* Testbench中必有int main()開頭，其代表的意思是testbench中必須有top function，且此函數必須要回傳值來作為判斷的依據
> 可在設計時加入 `std::cout` 輔助判讀結果或錯誤出現在何處

:::

#### #8 Data Type
:::info

* HLS支援C/C++原生的data type
> * 可注意常用的bool、unsigned char、int
> * float、double不常在硬體中使用，若要使用要參照浮點數的IEEE_754規則

![](https://hackmd.io/_uploads/SyR3Ci9q3.png)

* 若要使用特殊bit數的data type，可透過以下的宣告方式
> `#include <ap_int.h>`
> * 若要指定intput為5-bit的signed number就使用 `ap_int<5> input;` 
> * 若要指定output為11-bit的unsigned number就使用 `ap_uint<11> output;` 

* 賦值的指令如下
> `ap_[u]int<w> a = ap_[u]int<w>(string, radix);`
> * u控制是否unsigned、w為bit數、string為表示法、radix為進制
> * 若要指定a為3-bit的signed number 5就使用
> `ap_int<3> a = ap_int<3>("0b101");` 
> 或 `ap_int<3> a = ap_int<3>("101", 2);`
> 或 `ap_int<3> a = ap_int<3>("5", 10);`
> 或 `ap_int<3> a = 0b101;`

* 在assign值時，會因為兩邊的bit數不同而有wider assignment和narrower assignment兩種情形，加上signed/unsigned的問題，會出現下列情況
> * Sign-extension: 因wider assignment下保留原來正負而在前面補充0 or 1
> * Zero-extension: 因wider assignment且unsigned下而在前面補充0
> * And truncation: 因narrower assignment下失去原先前面多的bit值

* 可搭配指令來幫助數值的分派
> * 若要取a特定的bit，可使用 `= a[i]`
> * 若要取a特定的bit range，可使用 `= a(m, n)` 或 `= a.range(m, n)`
> * 若要串接兩訊號b和c，可使用 `= (b, c)` 或 `= b.concat(c)`
> * 若要取a的長度，可使用 `= a.lenght()`
> * `|` (or), `&` (and), `^` (xor), `~` (inverse), `>>` `<<` (shift)等邏輯運算子

:::

#### #9 Conditional Statements
:::info

* If-else或Switch-case透過MUX的設計在硬體語言中實現
* Decoder/Encoder的設計為binary signal與one-hot signal的轉換

:::

#### #10 Seven Segment
:::info

* 透過一組8-bit的訊號來控制顯示器的8根橫桿
* 另外需要一組4-bit 的訊號來控制4個SSD誰要發亮
> 4-bit binary數字 -> BCD表示 -> 轉成SSD訊號 -> 控制發亮

![](https://hackmd.io/_uploads/BJIfhbB9n.png)

* 將binary數字轉成BCD表示的方法
> double dabble(可以使用較少gates) 
> case暴力處理(較直觀)

:::

#### #11 Combinational Loops
:::info

* 透過迴圈去替代重複撰打Combiantional的部分
> 記得在迴圈內加入下面指令來形成combinational loop堆疊
> `#pragma HLS UNROLL`

* parity bit透過規定1的數量來防止訊號傳遞錯誤
> 分為even和odd兩種

:::

#### #12 Integer Arithmetic
:::info

* 設計時預設的clk period與設計的dalay time之間的大小關係會影響系統處理相同結果所使用的方法
> * 若dalay time < clk period: 系統會使用combinational circuit的方式處理
> * 若dalay time > clk period: 系統會使用pipeline這種sequential circuit的方式處理，會大大增加總耗時與Flip Flop用量

* 可透過增加directive去防止系統自動採用較為複雜、耗時的方式處理運算
* Basys3 board中有能提供簡易運算的DSP48核心等等

:::

___

## Part.2 Sequential Circuits
[課程連結](https://www.udemy.com/course/high-level-synthesis-for-fpga-part-2-sequential-circuits/)

![](https://hackmd.io/_uploads/BkJciKwj3.png)

#### #3 D Flip-Flop(DFF)
:::info

* Flip Flop可以做出時序電路
* 對於Clock而言，一定要考慮到Setup time與Hold time，以保證資料傳遞正確

![](https://hackmd.io/_uploads/HJpdF68sn.png)

* FSM的機制可以使模組狀態可控，並細節分工
* Reset可以控制FSM的起點
> 分為Synchronous和Asynchronous兩種

![](https://hackmd.io/_uploads/Byi6SsIj2.png)

:::

#### #4 Single Cycle Design Flow
:::info

* 通訊協議會涉及到訊號如何傳遞
> 最基本的即為Serial與Parallel

* 兩種訊號的彼此轉換即為這個章節最大的重點

:::

#### #6 State Machine
:::info

* FSM需要包含State、Condition、Condition State來指定狀態的變化
* 使用`typedef enum`的好習慣可以使FSM的狀態更有辨別度
* 配合`switch`可以更明瞭的控制各狀態的切換
> 切記else與default一定要考慮進去

:::

#### #7 Utilities
:::info

* 由於彈簧的關係，按鈕類的機關會有震盪的情形產生，此時就需要debouncer來消除此震盪所產生的影響
> Debouncer的設計有很多種，例如邏輯設計中的要持續好幾個clock才判斷，或是在此課程中所提到的延遲法

* Pulse generater可以將debouncer所產生的穩定訊號轉為單個pulse的脈衝訊號作為FSM的切換訊號
> 此種做法會要求pulse generater和FSM使用相同的clk，以確保切換的時機正確

* Counter為一種最簡單形式的FSM，可應用於各種複雜的專案當中
> 例如除頻器的應用、電子鐘錶、計算機等

:::

#### #9 Integrated Logic Analyzer(ILA)
:::info

* ILA IP是用來替代造價昂貴的訊號監控儀器，可以接在block design的最後，來透過電腦監控各項數值的變化

:::

#### #10 Function Pipelining
:::info

* Pipeline是一種時序電路的架構方式，使用佈局的方式使資源能被更有效的應用，簡短時間消耗
> 下兩張圖比較了有無pipeline架構耗時的多寡

![](https://hackmd.io/_uploads/rJgwAwDjh.png)

![](https://hackmd.io/_uploads/ByHP0Pwo3.png)

* 對於操作時間好幾個clk的組合電路，在實作時常常在接收pulse訊號時會漏掉，因此採用pipeline架構來解決這樣的問題
> 舉例來說，若原先的組合電路需耗費兩個clk的時間，在接受按鈕處理後的pulse訊號，就會變得只有50%的機率能夠成功接收

* 要採用pipeline架構，要在HLS設計中加入下列的指令
> `#pragma HLS PIPELINE II=1`
> * 要注意在simulation後的報告是沒辦法呈現出pipeline的影響的

* 評判pipeline線路的效能有三大重點
> * Initiation interval
> * Latency
> * Throughput

:::

#### #11 Seven Segments
:::info

* 在Basys3 board中有四個SSD的位置，但控制數字的訊號只有一組，為了使四個位置能顯示出不同的數字，就要用到視覺暫留的原理，透過FSM的設計快速的切換亮的位置與數字訊號
> 在這邊的設計一樣建議使用pipeline架構，可以使SSD的資料讀取不會出錯

:::

#### #12 PMOD
:::info

* PMOD為外接模組，有各式各樣的功能可以接上Basys3 board上
* PMOD的聯接需要考慮到通訊協議的架設，有支援的通訊協議如下
> * GPIO: General-purpose input/output
> * I2C: Inter-integrated circuit
> * UART: Universal asynchronous receiver-transmitter
> * I2S: Inter-IC sound
> * H-bridge: Used in robots

:::

#### #13 Interface Synthesis
:::info

* SCII雖然快且不浪費任何clk，但因為不知道SCII什麼時候給訊息會導致通訊上的混亂，故需要採用其他的interface
* Block level的interface可以對整個block的狀態進行回報，像`ap_ctrl_hs`內包含許多port來標示訊號的起終點等等，用法如下
> `#pragma HLS INTERFACE ap_ctrl_hs port=return`
> * `ap_start`: 資料傳遞開始
> * `ap_done`: 資料傳遞完成
> * `ap_idle`: Block閒置中
> * `ap_ready`: Block可以準備接受資料

* Port level的interface則是對各個port的狀態進行回報，常見的interface如下
> * `#pragma HLS INTERFACE ap_vld port=o`: 可以回報port的值是否可用
> * `#pragma HLS INTERFACE ap_ack port=o`: 可以回報input port的值開始的時機或output port的值結束的時機
> * `#pragma HLS INTERFACE ap_hs port=o`: 將`ap_vld`和`ap_ack`一起採用

:::

#### #14 Project 1: Digital Dice
:::info

* 在Verilog中做出隨機數值的方法有兩種
> * Counter based: 即事先做好順序，看使用者觸發的時機
> * LFSR: 利用shift register搭配XOR gate的效果，做出隨機

:::

#### #15 Project 2: UART
:::info

* UART協議可以用來作為電腦與Basys3 board之間的通訊協議，有以下特點
> * UART負責在兩數位系統之間提供asynchronous serial的訊號傳遞
> * 1 start bit -> data bits -> 1 parity bit -> 1 or 2 stop bits

:::

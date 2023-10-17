[HackMD連結](https://hackmd.io/@FW1212/ryHPH6Uin)

[課程影片連結](https://inst.eecs.berkeley.edu/~eecs151/fa22/)
[課程講義連結](https://drive.google.com/drive/folders/1MW8sFs1gKWi86wfhuXOqe0HVXAEsVGQy)

#### #5 CL-I
:::info

* 組合電路可以用assign或always
> 注意在組合電路中的always一律用blocking assignment

* 時序電路用always
> 注意在時序電路中的always一律用nonblocking assignment

![](https://hackmd.io/_uploads/ByLSLTIo2.png)

:::

#### #6 CL-II、FSM
:::info

* K-map可以幫忙簡化布林表達式

![](https://hackmd.io/_uploads/SJxYPP68jn.png)

* FSM可以根據output與現在state的依賴關係來做細分
> 分為Moore和Mealy兩種

![](https://hackmd.io/_uploads/BkoedTUi3.png)

:::

#### #7 RISC-V Intro
:::info

* 要讀RISC-V前，先了解基本的原理 [RISC-V 介紹](https://weikaiwei.com/riscv/riscv-1/)
* RISC-V為一種柏克萊大學設計出的精簡指令集，透過CPU去應對各式各樣被定義好的instruction
* 在RISC-V中，需透過各元件相互幫忙來完成工作
> * PC(Program counter): 處理接收到address與instruction
> * IMEM(Instruction memory): 儲存instruction
> * DMEM(Data memory): 儲存data
> * Reg(Register): 有32個32-bit的暫存器，其中可指定rs1、rs2、rd使用的暫存器來達到rs1與rs2運算後放入rd的效果

![](https://hackmd.io/_uploads/H1gU5Hjnn.png)

* 在一個clk中，會需要完成以下5件工作，後續可透過pipeline架構來幫助減少用時

![](https://hackmd.io/_uploads/B1lqsBjnh.png)

:::

#### #8、9 RISC-V Datapath
:::info

* 在RISC-V中，instruction是由32-bit的字元串所表示，並有多種形式的format
* R-Format

![](https://hackmd.io/_uploads/HykO6Hjh3.png)

> * 將rs1和rs2運算後放入rd
> * `opcode` : 代表使用哪種format，在R-Format中固定為 `0110011`
> * `funct7` 、 `funct3` : 兩者不同的組合可以搭配出不同的指令，如下圖

![](https://hackmd.io/_uploads/B18cRHjn2.png)

* I-Format

![](https://hackmd.io/_uploads/S1iZg8j23.png)

> * 將值load進rd或將rs1和imm代表的常數(-2048 ~ 2047)運算後放入rd
> * `opcode` : 代表使用哪種format，在I-Format中固定為 `0010011` 、 `0000011`
> * `funct3` : 不同的組合可以搭配出不同的指令，如下圖

![](https://hackmd.io/_uploads/HyDugUoh2.png)

![](https://hackmd.io/_uploads/S1VDbIihh.png)

* S-Format

![](https://hackmd.io/_uploads/BkswfIon2.png)

> * 將imm代表的常數(-2048 ~ 2047)或rs2的值存入rs1，在S-Format中不用rd
> * `opcode` : 代表使用哪種format，在S-Format中固定為 `0100011`
> * `funct3` : 不同的組合可以搭配出不同的指令，如下圖

![](https://hackmd.io/_uploads/SJ4CGUinh.png)

* B-Format

![](https://hackmd.io/_uploads/rkQuQUo2h.png)

> * 為branche的結構，讀取rs1與rs2但不會進行write
> * `opcode` : 代表使用哪種format，在B-Format中固定為 `1100011`
> * `funct3` : 不同的組合可以搭配出不同的指令，如下圖

![](https://hackmd.io/_uploads/HyNCQLohh.png)

* 另外還有J-Format與U-Format，全部47條instruction構成RV32I的ISA架構，最後透過control logic各端的值來控制要進行哪個instruction
> * 只需其中37條即可完成C code中的所有程式要求

![](https://hackmd.io/_uploads/BkyyH8j23.png)

![](https://hackmd.io/_uploads/BkyLILo2n.png)

![](https://hackmd.io/_uploads/Hk8yIIo32.png)

:::

#### #10 RISC-V Pipeline
:::info

* 在前面有提到，RISC-V會要求在同一個clk中進行完5件工作，而透過加入FF，可以將5件工作分開成各自clk做一件事，即能形成pipeline的架構，進而增加工作效率，且不用顧慮需要將大量工作塞入同一個clk中的設計問題

![](https://hackmd.io/_uploads/rJzNuIj2h.png)

* 因為使用了pipeline，有時會產生暫存器還未更新數值就被後續指令使用，進而導致使用到舊的數值的錯誤，這類問題即稱為hazard，根據影響可分為三類
> * Structural hazard
> * Data hazard
> * Control hazard

* 要解決hazard的方法有很多，例如暴力地增加硬體資源來滿足需求等等

:::

#### #13 CMOS
:::info

* 此章前半在介紹NMOS、PMOS的運作原理，後半則是在介紹如何透過兩者不同的配置達到各種gates的效果
* Inverter gate

![](https://hackmd.io/_uploads/ByXfFFETn.png)

* NAND gate

![](https://hackmd.io/_uploads/BJF_tY4a2.png)

* NOR gate

![](https://hackmd.io/_uploads/SkYYKF4T3.png)

* NAND與NOR有使用MOS少的特點，加上此外的所有gates皆可由兩者組成，因此被大量使用在積體電路設計中

:::

#### #14 Inverter Delay
:::info

* 單個inverter的delay為: tp = ln2 * Req * (Cp + CL)
> * Req為CMOS的等效電阻
> * Cp為COMS的寄生電容
> * CL為output的外接電容

![](https://hackmd.io/_uploads/BJrHJ9ETh.png)

* 可以改寫為: tp = tINV * (1+f)
> * tINV為delay單位化的表示: tINV = ln2 * Req * Cin
> * f為Fanout: f = CL/Cin

* 後續為了方便，會使用D來表示單位化後(tp/tINV)的delay: D = 1+f
> * 常數1的部分可視做寄生電容所造成的parasitic delay
> * f的部分則為電容比所造成的effort delay

:::

#### #15 Inverter Chain
:::info

* 若有多個inverters串接，總delay = tp1 + tp2 + ... + tpN，Dtotal = (1+f1) + (1+f2) + ... + (1+fN)
> * 由於是串聯的結構，彼此的電容互相構成彼此的電容比，f1 = Cin,2/Cin,1, f2 = Cin,3/Cin,2, ..., fN = CL/Cin,N
> * 即Path Fanout為: F = 全部f相乘 = CL/Cin,1

![](https://hackmd.io/_uploads/B1EFe9N6n.png)

* 若想要delay最小，則就要使所有f都一樣 = F開N次方根，也就是要讓每個電容等比放大，此時即有最小延遲: D = Nf + N

![](https://hackmd.io/_uploads/BJ8BX54Tn.png)

:::

#### #16 Logical Effort
:::info

* 在想要設計出delay小的邏輯佈局時，LE可提供設計者去計算找出設計中耗時過多的部分
* Gate level的D可以用以下的公式來計算

![](https://hackmd.io/_uploads/HJptDq4pn.png)

* 常用gates的LE與P如下

|          | Inverter | NAND     | NOR      |
| -------- | -------- | -------- | -------- |
| LE       | 1        | 3/2      | 3/2      |
| P        | 1        | 4/2      | 4/2      |
 
:::

#### #17 Wire、Energy
:::info

* 導線也在delay中影響很大，在現代積體電路中，導線甚至要佔總delay的80%
* 如下圖，導線中也有電阻與電容，眾多導線連接下可以用pi-model來畫出RC tree

![](https://hackmd.io/_uploads/B1aEko4ah.png)

* 而要計算電路延遲中的RC參數就可以用RC tree的tree walking方法來計算

![](https://hackmd.io/_uploads/ByAGljVah.png)

* 因為要有VDD作為電壓源，當MOS不使用時也會有功耗的產生，在現今的積體電路中也成為了一項課題，在MOS不使用時關閉VDD就成為了常用的設計之一

:::

#### #18 Adder
:::info

* 先考慮最基礎的1-bit單元full adder
> 透過串接多個full adder即可達到多bit數的ripple carry adder

![](https://hackmd.io/_uploads/rk4A9TIi2.png)

* 因為criticle path太長，ripple carry adder的缺點為耗時太長
> * 可從簡化的角度入手，先只算carry最後再一起看sum
> * 可從演算法的角度入手，即tree adder

:::

#### #19、20 Multiplier
:::info

* 透過full adder擺成陣列的方式來產生乘法器

![](https://hackmd.io/_uploads/ByQu2pIih.png)


:::

#### #21 Flip Flop
:::info

* 對於Clock而言，一定要考慮到Setup time與Hold time，以保證資料傳遞正確

![](https://hackmd.io/_uploads/HJpdF68sn.png)

:::

#### #22、23 SRAM
:::info

* Memory的設計用到decoder配合陣列的電線串接，即可做到類似查表的效果，即有存儲資料的功能

![](https://hackmd.io/_uploads/BkGcTa8ih.png)

:::

# 基于EGO1实现7位多数表决器

- [基于EGO1进行7位多数表决器](#基于EGO1实现7位多数表决器)
  - [1-文件说明](#1-文件说明)
  - [2-端口说明](#2-端口说明)
  - [3-实现中的问题](#3-实现中的问题)

本项目的讲解视频已经上传到B站“【EGO1+Vivado2022 7位多数表决器】 https://www.bilibili.com/video/BV1EP41167z1/?share_source=copy_web&vd_source=8f154fc73119521bf4f40a5aed9c4d4b。

***
## 1. 文件说明

小技巧：下载整个Github文件夹：http://tool.mkblog.cn/downgit/#/home

**工程及源代码**

里面包含了我自己的源代码。

软件说明：
本人在开发时使用到的硬件：
> - FPGA开发工具：Vivado 2022.2。
> - 开发板：依元素EGO1(xc7a35tcsg324-1)。


**2. 端口说明**

段码a~h的连接方案有两种，分别为：B4、A4、A3、B1、A1、B3、B2、D5（0组）；D4、E4、D3、F4、F3、E2、D2、H2（1组）；
本项目是通过G6端口选择了第1组的LED段码即D4、E4、D3、F4、F3、E2、D2、H2（1组）
约束文件里的代码如下：
'''
set_property PACKAGE_PIN G6 [get_ports an]
set_property IOSTANDARD LVCMOS33 [get_ports an]

set_property PACKAGE_PIN D4 [get_ports {segment_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[0]}]
set_property PACKAGE_PIN E3 [get_ports {segment_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[1]}]
set_property PACKAGE_PIN D3 [get_ports {segment_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[2]}]
set_property PACKAGE_PIN F4 [get_ports {segment_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[3]}]
set_property PACKAGE_PIN F3 [get_ports {segment_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[4]}]
set_property PACKAGE_PIN E2 [get_ports {segment_out[5]}]
set_property PACKAGE_PIN D2 [get_ports {segment_out[6]}]
set_property PACKAGE_PIN H2 [get_ports {segment_out[7]}]
'''//
**3. 实现中的问题**

实现中按照网络和课本资料核对，发现了可以通过板上的标识找到对应LED灯，和开关的标识，从而可以在代码里实现。
后续通过代码指导了输出的控制方式，也查找到数码显像管的控制端，但直接写约束文件无法实现，通过VIVADO的模拟后直接在控制端口界面通过手动配置同样的端口就行，不知这个是我的哪块流程出问题了，如果有指导的同行或前辈，还望给与指点！

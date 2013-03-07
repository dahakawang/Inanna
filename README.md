# Inanna

Inanna是一个.txt到.mobi的文本转换器，主要用于将小说转换到kindle上的格式以供阅读。

Inanna不仅仅是一个文本格式转换器，它还会尝试自动解析文本结构，从而使得转换后的mobi文件能够带有目录。 

### 使用方法
1. git clone git://github.com/dahakawang/Inanna.git 下载代码
2. 使用 ruby inanna inputfile.txt 处理输入文件
3. 在输入文件同名目录下产生对应mobi文件

### 版本特性
- 转换txt到mobi格式
- 自动分析章节结构并产生目录
- 自动整理段落板式，设置段首空格

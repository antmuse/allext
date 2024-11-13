----------------------------------------------------------------------------------------------------
@make it
----------------------------------------------------------------------------------------------------
./configure --enable-prof --prefix=/home/antmuse/all/code/depend/jemalloc
make
make install


./configure --enable-prof
make
make install DESTDIR=/home/antmuse/all/code/depend/jemalloc



----------------------------------------------------------------------------------------------------
@use it
----------------------------------------------------------------------------------------------------
# @brief 采样见脚本jprof.sh
# 如果不想改变shell环境，就不要export, 将LD_PRELOAD MALLOC_CONF 和启动命令放在同一行，只影响当前程序。
# MALLOC_CONF="prof:true,prof_prefix:/home/antmuse/all/temp/mem/jeprof.out,lg_prof_interval:24,lg_prof_sample:20" LD_PRELOAD=/home/antmuse/all/code/depend/jemalloc/lib/libjemalloc.so.2 $1
export LD_PRELOAD=/home/antmuse/all/code/depend/jemalloc/lib/libjemalloc.so.2

#lg_prof_interval:30：其含义是内存每增加1GB(2^30,根据需要修改),就输出一份内存profile。
#lg_prof_sample:20：采样频率(1s 20次)
#prof_prefix:/home/antmuse/all/temp/jeprof.out：最后会在/home/antmuse/all/temp/路径下生成一系列的jeprof.out*文件
export MALLOC_CONF="prof:true,prof_prefix:/home/antmuse/all/temp/jeprof.out,lg_prof_interval:30,lg_prof_sample:20" 


# 查看heap文件, jeprof内输入命令: top20, quit, ...
/home/antmuse/all/code/depend/jemalloc/bin/jeprof ~/all/code/out.bin jeprof.out.123985.0.i0.heap

# 比较两份文件
/home/antmuse/all/code/depend/jemalloc/bin/jeprof ~/all/code/out.bin --base=jeprof.out.123985.0.i0.heap jeprof.out.123985.9999.i9999.heap

# 生成堆栈调用图, pdf格式,  默认是Mb, --show_bytes是按字节显示内存
/home/antmuse/all/code/depend/jemalloc/bin/jeprof --show_bytes --pdf ~/all/code/out.bin --base=jeprof.out.123985.30.i30.heap jeprof.out.123985.192.i192.heap > /home/my/out.pdf

# 生成堆栈调用图, dot语言
/home/antmuse/all/code/depend/jemalloc/bin/jeprof --dot  ~/all/code/out.bin --base=jeprof.out.123985.0.i0.heap jeprof.out.123985.9999.i9999.heap > input.dot

# 利用上一步生成的dot文件生成堆栈调用图
dot -Tpng input.dot > callbt.png
dot -Tpng input.dot -o callbt.png

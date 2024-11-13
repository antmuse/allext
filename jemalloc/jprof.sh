#!/usr/bin/env bash

GitPush(){
    Branch=`git branch | awk '$1=="*"{print $2}'`
    if [[ "N${Branch}" == "N("* ]];then
        git branch
        echo "--------------------ERROR: invalid branch = ${Branch}"
    else
        echo "git push origin HEAD:refs/for/${Branch}"
        git push origin HEAD:refs/for/${Branch}
    fi
}

StartHttp(){
    echo "http://os:8989"
    # python -m SimpleHTTPServer 8989
    python3 -m http.server 8989
}

ClearDocker(){
    docker rm $(docker ps -a -q)
    docker ps -a
}

FormatCPP(){
    cpplint --counting=detailed --filter=-build/c++11,-build/header_guard,-build/include_order,-build/include_what_you_use,-whitespace/line_length,-legal/copyright,-build/include_subdir,-whitespace/indent,-whitespace/comments,-runtime/references --recursive ${2}
}

main(){
    local osid=${1}
    echo "参数=$osid"
    case "$osid" in
        "fmt")
            echo "fmt cpp"
            FormatCPP 
            ;;
        "http")
            echo "run http sev..."
            StartHttp
            ;;
        "push")
            echo "git push origin HEAD:refs/for/..."
            GitPush
            ;;
        "cloud")
            echo "login server, pass = xxx"
            ssh root@192.168.137.170
            ;;
        "dd")
            echo "download from server"
            scp root@192.168.137.170:/opt/data/${2} .
            ;;
        "up")
            echo "upload to server"
            scp ${2} root@192.168.137.170:/opt/data/
            ;;
        "kill")
            echo "kill all ${2}"
            ps -ef | grep ${2} | grep -v grep
            ps -ef | grep ${2} | grep -v grep | awk '{print $2}' | xargs kill -9
            ps -ef | grep ${2} | grep -v grep
            ;;
        "mem")
            echo "check mem leak with jemalloc, outdir=/home/antmuse/all/temp/mem"
            echo "check mem, ${2}, ${3}"
            #lg_prof_interval:30：其含义是内存每增加1GB(2^30,根据需要修改),就输出一份内存profile。
            #lg_prof_sample:20：采样频率(1s 20次)
            #prof_prefix:/home/antmuse/all/temp/mem/jeprof.out：最后会在/home/antmuse/all/temp/mem路径下生成一系列的jeprof.out*文件
            MALLOC_CONF="prof:true,prof_prefix:/home/antmuse/all/temp/mem/jeprof.out,lg_prof_interval:26,lg_prof_sample:20" LD_PRELOAD=/home/antmuse/all/code/depend/jemalloc/lib/libjemalloc.so.2 ${2} ${3}
            ;;
        "ansys")
            echo "check mem leak with jemalloc"
            /home/antmuse/all/code/depend/jemalloc/bin/jeprof ${2} ${3}
            ;;
        *)
            echo "usage:"
            echo "  kill [app_name]"
            echo "  mem [app_name] [app_param...]"
            echo "  ansys [app_name] [jeprof.out file]"
            ;;
    esac
}

# ln -sf /usr/lib/x86_64-linux-gnu/libuuid.so mylib/libuuid.so.1
main $@

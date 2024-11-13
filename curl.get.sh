echo "Usage: 'cmd.sh type site'"
echo "Chrome http :  cmd.sh 1 \"www.baidu.com\""
echo "Wechat http :  cmd.sh 2 \"www.baidu.com\""
echo "Chrome https:  cmd.sh 3 \"www.baidu.com\""

HttpGet(){
    local ftype=${1}
    local site=${2}
    echo "参数=[$ftype] = $site"

    case "$ftype" in
        1) echo "----------模拟谷歌http请求----------"
            curl --location --request GET "http://$site" \
                --header "Host: $site" \
                --header "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36" \
                --header "Connection: keep-alive" \
                --header "Authorization: password" \
                --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
                --header "Content-Type: text/plain" \
                --header "Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4" \
                --data-raw "this is test data, anything."

            ;;
        2) echo "----------模拟微信http请求----------"
            curl --location --request GET "http://$site" \
                --header "Host: $site" \
                --header "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 QBCore/4.0.1295.400 QQBrowser/9.0.2524.400 Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2875.116 Safari/537.36 NetType/WIFI MicroMessenger/7.0.5 WindowsWechat" \
                --header "Connection: keep-alive" \
                --header "Authorization: password" \
                --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
                --header "Content-Type: text/plain" \
                --header "Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4" \
                --data-raw "this is test data, anything."

            ;;
        3) echo "----------模拟谷歌https请求----------"
            curl --location --request GET "https://$site" \
                -k \
                --cacert "~/TLS/ca.crt" \
                --key "~/TLS/ca.key" \
                --key-type PEM \
                --header "Host: $site" \
                --header "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36" \
                --header "Connection: keep-alive" \
                --header "Authorization: password" \
                --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
                --header "Content-Type: text/plain" \
                --header "Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.5;q=0.4" \
                --data-raw "this is test data, anything."

            ;;
        *) echo "不支持参数 = [$ftype] = $site"
            curl --location --request GET "http://$site" \
                --header "Host: $site" \
                --header "User-Agent:" \
                --header "Connection: close" \
                --header "Authorization: password" \
                --header "Accept: */*" \
                --header "Content-Type: text/plain" \
                --data-raw "this is test data, anything."

            ;;
    esac
}

HttpGet ${1} ${2}

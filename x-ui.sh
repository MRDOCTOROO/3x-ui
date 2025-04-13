#! /bin/bash
while true; do
    echo "请选择一个选项："
    select option in "显示设置" "启动服务" "停止服务" "查看状态" "打开开机自启动" "关闭开机自启动" "卸载" "重置设置" "退出"
    do
        case $REPLY in
            1) /usr/local/x-ui/x-ui setting -show;rc-service x-ui status; break ;;
            2) rc-service x-ui start;rc-service x-ui status; break ;;
            3) rc-service x-ui stop;rc-service x-ui status; break ;;
            4) rc-service x-ui status; break ;;
            5) rc-update add x-ui; break ;;
            6) rc-update del x-ui; break ;;
            7) rc-service x-ui stop; rc-update del x-ui; rm -rf /usr/local/x-ui /usr/bin/x-ui /etc/init.d/x-ui; break ;;
            8) /usr/local/x-ui/x-ui setting -username $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20) -password $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20);
               /usr/local/x-ui/x-ui setting -webBasePath $(tr -dc A-Za-z0-9 </dev/urandom | head -c 0);
               /usr/local/x-ui/x-ui setting -port $(( RANDOM % 64512 + 1024 ));
               rc-service x-ui restart;
               /usr/local/x-ui/x-ui setting -show;
               break ;;
            9) echo "已退出。"; exit 0 ;;
            *) echo "无效的选项，请重新选择。" ;;
        esac
    done
done

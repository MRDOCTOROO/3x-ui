#! /bin/bash
while true; do
    echo "请选择一个选项："
    select option in "显示设置" "启动服务" "停止服务" "查看状态" "打开开机自启动" "关闭开机自启动" "退出"
    do
        case $REPLY in
            1) /usr/local/x-ui/x-ui setting -show; break ;;
            2) rc-service x-ui start; break ;;
            3) rc-service x-ui stop; break ;;
            4) rc-service x-ui status; break ;;
            5) rc-update add x-ui; break ;;
            6) rc-update del x-ui; break ;;
            7) echo "已退出。"; exit 0 ;;
            *) echo "无效的选项，请重新选择。" ;;
        esac
    done
done

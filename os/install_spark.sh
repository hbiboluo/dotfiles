write_spark_env(){
    if [[ `grep "export SPARK_HOME" $1` = '' ]]; then
        echo "写入环境变量到文件：$1"
        echo "export SPARK_HOME=/opt/spark-2.2.1-bin-hadoop2.7" >> "$1"
        echo "export PATH=\$SPARK_HOME/bin:\$PATH" >> "$1"
    else
        echo "环境变量已存在：$1「跳过」"
    fi
}

if [ ! -d /opt/spark-2.2.1-bin-hadoop2.7 ]; then
    axel -a http://mirror.bit.edu.cn/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz -o /opt/spark-2.2.1-bin-hadoop2.7.tgz
    tar -xvf /opt/spark-2.2.1-bin-hadoop2.7.tgz -C /opt
fi
if [ "$(uname)" = 'Darwin' ]; then
    write_spark_env ~/.zshrc_local
elif [ -f ~/.zshrc_local ]; then
    write_spark_env ~/.zshrc_local
else
    write_spark_env ~/.bashrc
fi
echo "安装Spark完成: /opt/spark-2.2.1-bin-hadoop2.7"

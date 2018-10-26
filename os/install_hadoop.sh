write_hadoop_env(){
  if [[ `grep "export HADOOP_HOME" $1` = '' ]]; then
    echo "写入环境变量到文件：$1"
    echo "export HADOOP_HOME=/opt/hadoop-2.7.5" >> "$1"
    echo "export PATH=\$HADOOP_HOME/bin:\$PATH" >> "$1"
  else
    echo "环境变量已存在：$1 「跳过」"
  fi
}

if [ ! -d /opt/hadoop-2.7.5 ]; then
  if [ ! -f /opt/hadoop-2.7.5.tar.gz ]; then
    axel -a -n 5 -o /opt/hadoop-2.7.5.tar.gz http://mirrors.hust.edu.cn/apache/hadoop/common/hadoop-2.7.5/hadoop-2.7.5.tar.gz
  fi
  tar -xvf /opt/hadoop-2.7.5.tar.gz -C /opt/
fi
if [ `uname` = 'Darwin' ]; then
  write_hadoop_env ~/.zshrc_local
elif [ -f ~/.zshrc_local ]; then
  write_hadoop_env ~/.zshrc_local
else
  write_hadoop_env ~/.bashrc
fi
read -p "是否覆盖单机配置：*-site.xml (y/n)" REPLACE
if [[ $REPLACE = 'y' ]]; then
  echo "覆盖配置..."
  cp -vf ./config/hadoop/core-site.xml /opt/hadoop-2.7.5/etc/hadoop/
  cp -vf ./config/hadoop/hdfs-site.xml /opt/hadoop-2.7.5/etc/hadoop/
  cp -vf ./config/hadoop/mapred-site.xml /opt/hadoop-2.7.5/etc/hadoop/
  cp -vf ./config/hadoop/yarn-site.xml /opt/hadoop-2.7.5/etc/hadoop/
fi
echo "安装Hadoop完成：/opt/hadoop-2.7.5"

until [ $(getprop init.svc.bootanim) = "stopped" ] ; do
    sleep 5
done

service_path=`realpath $0`
module_dir=`dirname ${service_path}`
scripts_dir="${module_dir}/scripts"
busybox_path="/data/adb/magisk/busybox"
php_data_dir="/data/adb/php7"

php_scripts_dir="${php_data_dir}/scripts"
php_files_dir="${php_data_dir}/files"

php_tmp_path="${php_files_dir}/tmp"

if [ -f ${php_pid_file} ] ; then
    rm -rf ${php_pid_file}
fi

#nohup ${busybox_path} crond -c ${php_tmp_path} > /dev/null 2>&1 &

${php_scripts_dir}/php_run -s
inotifyd ${php_scripts_dir}/php_inotifyd ${module_dir} >> /dev/null &
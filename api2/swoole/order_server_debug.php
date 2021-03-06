<?php

/**
 * Helper function
 */

/**
 *
 *  超时动作：sendHttpRequest('http://api2.xihaxueche.com:8001/api2/public/v1/order/timeout', ['order_id' => $data]);
 *
 */
function sendHttpRequest($url, $params)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    //curl_setopt($ch, CURLOPT_SSLVERSION, 3); /* original */
    curl_setopt($ch, CURLOPT_SSLVERSION, 1); /* modified for local test, no need for server */
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array ('Content-type:application/x-www-form-urlencoded;charset=UTF-8'));
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);
    curl_close($ch);

    return $result;
}

$server = new swoole_server("0.0.0.0", 5512, SWOOLE_BASE, SWOOLE_SOCK_TCP);

$server->set([
    'worker_num'            => 5,
    'task_worker_num'       => 32,
    'daemonize'             => true,
    'package_length_type'   => 'N',
    'log_file'              => 'swoole.debug.log',
]);

$server->on('Start', function($server) {
    echo '---------------------- split line ----------------------'."\n";
    echo date('Y-m-d H:i:s')." server: master_pid#{$server->master_pid} has started\n";
});

$server->on('Shutdown', function($server) {
    echo date('Y-m-d H:i:s')." server: master_pid#{$server->master_pid} has been shutdown\n";
});

$server->on('WorkerStart', function($server, $worker_id) {
    if ( $worker_id >= $server->setting['worker_num'] ) {
        // 任务进程
        echo date('Y-m-d H:i:s')." server: task_worker_pid#{$server->worker_pid} worker_id#{$worker_id} started\n";
    } else {
        // 普通进程
        if ( $worker_id == 0 ) {
            echo date('Y-m-d H:i:s')." server: [observer]worker_pid#{$server->worker_pid} worker_id#{$worker_id} started\n";
            // #0 worker 进程作为监控
            $server->tick( 1000, function() use ( $server, $worker_id ) {
                $redis = new \Redis();
                $redis->connect('127.0.0.1', 6379);
                $redis->auth('dalinux');
                $queue_length = $redis->get('appoint_order_all_debug_queue_length');
                $list_length = $redis->llen('appoint_order_all_debug');
                if ( $list_length != $queue_length ) {
                    if ( $list_length <= 0 ) {
                        $list_length = 0;
                    }
                    echo date('Y-m-d H:i:s').' 当前排队长度：'.$list_length."\n";
                    $redis->set('appoint_order_all_debug_queue_length', $list_length);
                }
            });
        } else {
            echo date('Y-m-d H:i:s')." server: [consumer]worker_pid#{$server->worker_pid} worker_id#{$worker_id} started\n";
            $server->tick( 200, function() use ( $server, $worker_id ) {
                $redis = new \Redis();
                $redis->connect('127.0.0.1', 6379);
                $redis->auth('dalinux');
                $list_length = $redis->llen('appoint_order_all_debug');
                while ( $list_length > 0 ) {
                    $pdata = $redis->lpop('appoint_order_all_debug');
                    if ( $pdata ) {
                        $order_info = json_decode( $pdata );
                        if ( ($order_info->addtime + 30) <= time() ) {
                            // 订单超时
                            $data = $order_info->order_id;
                            // 投递到任务进程
                            //echo date('Y-m-d H:i:s').' worker_id#'.$worker_id.' 准备投递任务： data#'.$data."\n";
                            $server->task($data);
                            //echo date('Y-m-d H:i:s').' 当前排队长度：'.$list_length."\n";
                        } else {
                            // 还没有超时，插入到队列前头
                            $redis->lpush('appoint_order_all_debug', $pdata);
                            // 跳出循环 while
                            break;
                        }
                    }
                    $list_length = $redis->llen('appoint_order_all_debug');
                }
            });
        }
    }
});

$server->on('WorkerError', function($server, $worker_id) {
    echo date('Y-m-d H:i:s')." server: worker_pid#{$server->worker_pid} worker_id#{$worker_id} error happeded\n";
});

$server->on('WorkerStop', function($server, $worker_id) {
    if ( $worker_id >= $server->setting['worker_num'] ) {
        echo date('Y-m-d H:i:s')." server: task_worker_pid#{$server->worker_pid} worker_id#{$worker_id} stopped\n";
    } else {
        echo date('Y-m-d H:i:s')." server: worker_pid#{$server->worker_pid} worker_id#{$worker_id} stopped\n";
    }
});

$server->on('Task', function($server, $task_id, $src_worker_id, $data) {
    //echo date('Y-m-d H:i:s')." 投递任务成功 data#{$data} \n";
    sendHttpRequest('http://api2.xihaxueche.com:8001/api2/public/v1/order/timeout', ['order_id' => $data]);
    $server->finish( $data );
});

$server->on('Finish', function($server, $task_id, $data) {
    //echo date('Y-m-d H:i:s')." 任务结束 data#{$data} \n";
});

$server->on('Connect', function($server, $fd, $from_id) {
    echo date('Y-m-d H:i:s')." 新的客户端连接，来自 fd#{$fd} from_id#{$from_id} \n";
});

$server->on('Receive', function($server, $fd, $from_id, $data) {
});


$server->on('Close', function($server, $fd, $from_id) {
    echo date('Y-m-d H:i:s')." 客户端断开连接，来自 fd#{$fd} from_id#{$from_id} \n";
});

$server->start();

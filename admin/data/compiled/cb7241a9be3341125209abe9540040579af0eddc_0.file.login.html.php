<?php /* Smarty version 3.1.27, created on 2015-10-27 14:56:52
         compiled from "E:\web\admin\templates\admin\login.html" */ ?>
<?php
/*%%SmartyHeaderCode:18235562f20345df1e2_08263340%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cb7241a9be3341125209abe9540040579af0eddc' => 
    array (
      0 => 'E:\\web\\admin\\templates\\admin\\login.html',
      1 => 1445906760,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18235562f20345df1e2_08263340',
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_562f2034631272_53075588',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_562f2034631272_53075588')) {
function content_562f2034631272_53075588 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '18235562f20345df1e2_08263340';
echo $_smarty_tpl->getSubTemplate ("library/header.lbi", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);
?>


<div class="container" style="width:100%; background-image: url('http://area.sinaapp.com/bingImg');">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move" style="margin-top:200px;">
            <form action="index.php?action=admin&op=logincheck" method="post">
                <div class="panel" style="background:#fff !important; margin:0px auto; width:350px; border:none;">
                <div class="media media-y" style="padding-top:25px;">
                    <a href="javascript:;" class="text-primary" style="font-size:25px;">嘻哈后台管理系统</a>
                    <!-- <br> <span style="color:#fff; font-weight:bold;">beta v1.0</span> -->
                </div>
                    <div class="panel-body" style="padding:30px;">
                        <div class="form-group">
                            <div class="field field-icon-right input_placeholder">
                                <input type="text" style="border:none; background:#555; color:#fff;" class="input" name="username" placeholder="登录账号" data-validate="required:请填写账号" />
                                <span class="icon icon-user" style="color:#fff;"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right input_placeholder">
                                <input type="password" style="border:none; background:#555; color:#fff;" class="input" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                                <span class="icon icon-key" style="color:#fff;"></span>
                            </div>
                        </div>
           <!--              <div class="form-group">
                            <div class="field">
                                <input type="text" class="input" name="passcode" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                                <img src="images/passcode.jpg" width="80" height="32" class="passcode" />
                            </div>
                        </div> -->
                    </div>
                    <div class="panel-foot text-center" style="background:none; border:none; padding:0px 30px 30px 30px;">
                        <button class="button button-block bg-main text-big" style="height:45px;">立即登录后台</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php echo '<script'; ?>
>
    // 获取当前屏幕的高度
    $(function() {
        var height = $(window).height();
        $('.container').css('height', height); 
    })
<?php echo '</script'; ?>
>     
<?php echo $_smarty_tpl->getSubTemplate ("library/footer.lbi", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);

}
}
?>
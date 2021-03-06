<div id="app" v-cloak>
    <div class="iframe-content" style="margin-top: 30px;">
        <el-col :span="16">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm" :label-position="labelPosition">

                <el-form-item label="角色名称" prop="s_rolename" required>
                    <el-input v-model="ruleForm.s_rolename" placeholder="请输入角色名称 如编辑"></el-input>
                </el-form-item>

                <el-form-item label="角色描述" prop="s_description" required>
                    <el-input v-model="ruleForm.s_description" placeholder="请输入角色描述 如编辑添加教练"></el-input>
                </el-form-item>
                <el-form-item label="菜单权限" prop="moduleid" required>
                    <el-collapse v-model="activeNames" @change="handleChange">

                        <el-collapse-item v-for="(item, index) in menuList" :title="item.m_cname" :value="item.moduleid" :name="index">
                            <el-row v-for="(data, i) in item.children" style="margin: 15px 0px;">
                                <el-col :span="4" style="text-align:right;">{{ data.m_cname }}</el-col>
                                
                                <el-col :span="14" style="text-align:right;">
                                    <el-checkbox-group v-model="data.checkedMenu" @change="handleCheckedMenuChange($event, index, i)">
                                        <el-checkbox v-for="val in data.menu_list" v-if="val.m_type=='2'" :model="checked" :label="val.moduleid" :key="val.moduleid">{{ val.m_cname }}</el-checkbox>
                                    </el-checkbox-group>
                                </el-col>

                                <el-col :span="6" style="text-align:center;">
                                    <el-checkbox style="margin-left: 20px;" :indeterminate="data.isIndeterminate" v-model="data.checkAll" @change="handleCheckAllChange($event, index, i)">全选</el-checkbox>
                                </el-col>
                            </el-row>
                        </el-collapse-item>

                    </el-collapse>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')">编辑保存</el-button>
                    <el-button @click="resetForm('ruleForm')">重 置</el-button>
                </el-form-item>
            </el-form>
        </el-col>
    </div>

</div>

<script>
    "use strict";
    var role_id = "<?php echo $l_role_id; ?>";
    var vm = new Vue({
        el: "#app",
        data: {
            checked: true,
            labelPosition: 'right',
            activeNames: [0, 1],
            menuList: [],
            ruleForm: {
                l_role_id: "<?php echo $l_role_id; ?>",
                s_rolename: "<?php echo $s_role_name; ?>",
                s_description: "<?php echo $s_description; ?>",
            },
            rules: {
                s_rolename: [
                    { required: true, message: '请输入角色名称', trigger: 'blur' }
                ],
                s_description: [
                    { required: true, message: '请输入角色描述', trigger: 'blur' }
                ],
            },
            base_url: "<?php echo base_url('admin/editroleajax'); ?>",
            list_url: "<?php echo base_url('admin/mListAjax'); ?>",
            loading: false,

        },
        created: function() {
            this.menuListAjax();
        },
        methods: {
            handleChange: function(val) {
            },
            handleCheckAllChange: function(event, index, i) {
                let menu_list = this.menuList[index].children[i].menu_list;
                let moduleid = this.menuList[index].children[i].moduleid;
                // let menulevel1_moduleid = this.menuList[index].moduleid;
                // let menulevel2_moduleid = this.menuList[index].children[i].moduleid;
                let menu_value_list = [];
                if(menu_list.length > 0) {
                    for(var key in menu_list) {
                        menu_value_list.push(menu_list[key].moduleid);
                    }
                }
                // if(event.target.checked) {
                //     menu_value_list.push(menulevel1_moduleid);
                //     menu_value_list.push(menulevel2_moduleid);
                // }
                this.menuList[index].children[i].checkedMenu = event.target.checked ? menu_value_list : [];
                this.menuList[index].children[i].isIndeterminate = false;
                this.menuFormList = [];
                this.menuList.forEach(function(val, key) {
                    val.children.forEach(function(v, k) {
                        if(val.children[k].checkedMenu.length > 0) {
                            vm.menuFormList.push(val.children[k].checkedMenu);
                        }
                    })
                }, this);
                if(this.menuFormList.length > 0) {
                    this.menuChecked = true;
                } else {
                    this.menuChecked = false;
                }
                this.ruleForm.moduleid = vm.menuFormList;
            },
            handleCheckedMenuChange: function(event, index, i) {
                let checkedCount = event.length;
                this.menuList[index].children[i].checkAll = checkedCount == this.menuList[index].children[i].menu_list.length;
                this.menuList[index].children[i].isIndeterminate = checkedCount > 0 && checkedCount < this.menuList[index].children[i].menu_list.length;

                this.menuFormList = [];
                this.menuList.forEach(function(val, key) {
                    val.children.forEach(function(v, k) {
                        if(val.children[k].checkedMenu.length > 0) {
                            vm.menuFormList.push(val.children[k].checkedMenu);
                        }
                    })
                }, this);
                if(this.menuFormList.length > 0) {
                    this.menuChecked = true;
                } else {
                    this.menuChecked = false;
                }
                this.ruleForm.moduleid = vm.menuFormList;
            },
            menuListAjax: function () {
                $.ajax({
                    type: "post",
                    url: this.list_url,
                    data : {'id': role_id},
                    dataType: "json",
                    async: true,
                    success: function (res) {
                        if (res.code == 200) {
                            vm.menuList = res.data.list;
                        }
                    },
                    error: function (e) {
                        vm.messageNotice('error', '加载出错！');
                    } 
                });
            },
            messageNotice: function(type, msg) {
				this.$message({
					type: type,
					message: msg
				});
			},
            submitForm: function(formName) {
                this.$refs[formName].validate(function(valid) {
                    if (valid) {
                        vm.editAjax(vm.ruleForm);
                    } else {
                        return false;
                    }
                });
            },
            resetForm: function(formName) {
                this.$refs[formName].resetFields();
            },
            editAjax: function(formName) {
                $.ajax({
                    type: 'post',
                    url: this.base_url,
                    data: this.ruleForm,
                    dataType: 'json',
                    success:function(data) {
                        vm.dialogFormVisible = false;
                        if(data.code == 200) {
                            parent.layer.closeAll();
                            parent.vm.messageNotice('success', data.msg);
                            parent.vm.listAjax();
                        } else {
                            vm.messageNotice('warning', data.msg);
                        }
                    },
                    error: function() {
                        vm.messageNotice('warning', '网络错误，请检查网络');
                        return false;
                    }
                });

            },
           

        }
    });

</script>

<template>
<div>
  <el-dialog title="修改联系我们" width="40%" :destroy-on-close="true" :visible.sync="updateVisible" :before-close="handleClose">
    <el-form :model="form" :rules="rules" ref="ruleForm">
      <el-row :gutter="10">
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">联系标题:</span>
            <div style="width:100%">
                <el-form-item prop="title" style="margin-bottom:0">
                    <el-input v-model="form.title" size="mini" placeholder="请输入联系标题" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">联系电话:</span>
            <div style="width:100%">
                <el-form-item prop="phone" style="margin-bottom:0">
                    <el-input v-model="form.phone" size="mini" placeholder="请输入联系电话" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">电子邮箱:</span>
            <div style="width:100%">
                <el-form-item prop="email" style="margin-bottom:0">
                    <el-input v-model="form.email" size="mini" placeholder="请输入电子邮箱" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">地址:</span>
            <div style="width:100%">
                <el-form-item prop="address" style="margin-bottom:0">
                    <el-input v-model="form.address" size="mini" placeholder="请输入地址" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">工作时间:</span>
            <div style="width:100%">
                <el-form-item prop="workTime" style="margin-bottom:0">
                    <el-input v-model="form.workTime" size="mini" placeholder="请输入工作时间" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">排序:</span>
            <div style="width:100%">
                <el-form-item prop="sortOrder" style="margin-bottom:0">
                    <el-input type="number" v-model="form.sortOrder" size="mini" placeholder="请输入排序" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">联系内容:</span>
            <div style="width:100%">
                <el-form-item prop="content" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.content" size="mini" placeholder="请输入联系内容" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">图片:</span>
            <div style="width:100%">
                <el-form-item prop="images" style="margin-bottom:0">
                    <el-upload
                        :file-list="fileList"
                        ref="upload"
                        :action="uploadImageUrl()"
                        accept="image/*"
                        :multiple="false"
                        :limit="3"
                        :before-upload="beforeAvatorUpload"
                        list-type="picture-card"
                        :on-preview="handlePictureCardPreview"
                        :on-exceed="handleExceed"
                        :on-success="handleAvatorSuccess"
                        :on-remove="handleRemove">
                        <i class="el-icon-plus"></i>
                    </el-upload>
                    <el-dialog title="预览" :visible.sync="dialogVisible">
                        <img width="100%" :src="dialogImageUrl" alt="">
                    </el-dialog>
                </el-form-item>
            </div>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button size="mini" type="primary" @click="submit">确 定</el-button>
      <el-button size="mini" @click="handleClose">取 消</el-button>
    </div>
  </el-dialog>
</div>
</template>

<script>
  import {mixin} from "../../../minix";
  import {getSysContactById,editSysContact} from '../../../api/api'
  export default {
    mixins: [mixin],
    data() {
      return{
        formLabelWidth: '80px',
        form: {
          id: "",
          title: "",
          phone: "",
          email: "",
          address: "",
          workTime: "",
          sortOrder: 0,
          content: "",
          images: ""
        },
        fileList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        rules: {
          title: [
            { required: true, message: '请输入联系标题', trigger: 'blur' },
            { min: 2, max: 50, message: '联系标题长度应在2-50个字符', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '请输入联系电话', trigger: 'blur' },
            { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
          ],
          email: [
            { required: true, message: '请输入电子邮箱', trigger: 'blur' },
            { type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }
          ],
          address: [
            { required: true, message: '请输入地址', trigger: 'blur' },
            { min: 5, max: 200, message: '地址长度应在5-200个字符', trigger: 'blur' }
          ],
          workTime: [
            { required: true, message: '请输入工作时间', trigger: 'blur' },
          ],
          content: [
            { required: true, message: '请输入联系内容', trigger: 'blur' },
            { min: 10, max: 500, message: '联系内容长度应在10-500个字符', trigger: 'blur' }
          ],
        },
      }
    },
    props: ['updateVisible','updateId'],
    watch: {
      updateId: {
        handler(newVal, oldVal) {
          if(newVal) {
            this.query()
          }
        },
        deep: true,
        immediate: true
      }
    },
    methods: {
      query() {
        if(this.updateId) {
          getSysContactById({id:this.updateId}).then(res => {
            if(res.code == 1000) {
              this.form = res.data
              if(res.data.images) {
                var images = res.data.images.split(",")
                this.fileList = []
                for (let i = 0;i < images.length;i++) {
                  var item = images[i]
                  this.fileList.push({url:this.$store.state.configure.HOST + item})
                }
              }
            }
          })
        }
      },
      handleAvatorSuccess(res) {
        let _this = this;
        if(res.code == 1000){
            _this.$message({
              type: 'success',
              message: '上传成功!'
            });
            this.fileList.push({url:this.$store.state.configure.HOST + res.message})
        }else{
          _this.$notify.error({
            title: '错误',
            message: res.message
          });
        }
      },
      handleRemove(file, fileList) {
        this.fileList = fileList
      },
      handlePictureCardPreview(file) {
        this.dialogImageUrl = file.url;
        this.dialogVisible = true;
      },
      handleExceed(files, fileList) {
        this.$notify.warning({
          title: '警告',
          message: '最多只能上传3张图片'
        });
      },
      beforeAvatorUpload(file) {
        const isJPGorPNG = file.type === 'image/jpeg' || file.type === 'image/png';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPGorPNG) {
          this.$message.error('上传图片只能是 JPG/PNG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传图片大小不能超过 2MB!');
        }
        return isJPGorPNG && isLt2M;
      },
      submit() {
        // 处理图片数据
        var images = ""
        for (let i = 0;i < this.fileList.length;i++) {
          var item = this.fileList[i]
          if(i == 0) {
            images = item.url.replace(this.$store.state.configure.HOST,'')
          } else {
            images = images + "," + item.url.replace(this.$store.state.configure.HOST,'')
          }
        }
        this.form.images = images
        
        this.$refs.ruleForm.validate((valid) => {
          if (valid) {
            editSysContact(this.form).then(res => {
              if(res.code == 1000) {
                this.$notify({
                  title: '成功',
                  message: '修改成功',
                  type: 'success'
                });
                this.handleClose()
              } else {
                this.$notify.error({
                  title: '错误',
                  message: res.message
                });
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      handleClose() {
        this.$refs.ruleForm.resetFields();
        this.fileList = []
        this.$emit('updateFalse')
      }
    }
  }
</script> 
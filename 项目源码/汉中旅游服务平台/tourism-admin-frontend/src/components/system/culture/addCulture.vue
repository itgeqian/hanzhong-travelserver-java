<template>
<div>
  <el-dialog title="新增汉文化活动" width="40%" :destroy-on-close="true" :visible.sync="addVisible" :before-close="handleClose">
    <el-form :model="form" :rules="rules" ref="ruleForm">
      <el-row :gutter="10">
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">活动名称:</span>
            <div style="width:100%">
                <el-form-item prop="name" style="margin-bottom:0">
                    <el-input v-model="form.name" size="mini" placeholder="请输入活动名称" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">活动费用:</span>
            <div style="width:100%">
                <el-form-item prop="price" style="margin-bottom:0">
                    <el-input type="number" v-model="form.price" size="mini" placeholder="请输入活动费用" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">活动类型:</span>
            <div style="width:100%">
                <el-form-item prop="cultureType" style="margin-bottom:0">
                    <el-select v-model="form.cultureType" size="mini" placeholder="请选择活动类型" style="width:100%">
                        <el-option label="传统节日" value="传统节日"></el-option>
                        <el-option label="民俗表演" value="民俗表演"></el-option>
                        <el-option label="文化展览" value="文化展览"></el-option>
                        <el-option label="汉服体验" value="汉服体验"></el-option>
                        <el-option label="书法体验" value="书法体验"></el-option>
                        <el-option label="茶艺体验" value="茶艺体验"></el-option>
                        <el-option label="国学讲座" value="国学讲座"></el-option>
                        <el-option label="古典舞蹈" value="古典舞蹈"></el-option>
                        <el-option label="其他" value="其他"></el-option>
                    </el-select>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">活动地点:</span>
            <div style="width:100%">
                <el-form-item prop="location" style="margin-bottom:0">
                    <el-input v-model="form.location" size="mini" placeholder="请输入活动地点" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">活动时间:</span>
            <div style="width:100%">
                <el-form-item prop="activityTime" style="margin-bottom:0">
                    <el-date-picker
                        v-model="form.activityTimeRange"
                        type="datetimerange"
                        range-separator="至"
                        start-placeholder="开始时间"
                        end-placeholder="结束时间"
                        format="yyyy-MM-dd HH:mm"
                        value-format="yyyy-MM-dd HH:mm"
                        @change="handleActivityTimeChange"
                        size="mini"
                        style="width:100%">
                    </el-date-picker>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">人数限制:</span>
            <div style="width:100%">
                <el-form-item prop="maxParticipants" style="margin-bottom:0">
                    <el-input type="number" v-model="form.maxParticipants" size="mini" placeholder="请输入人数限制" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">联系电话:</span>
            <div style="width:100%">
                <el-form-item prop="contactPhone" style="margin-bottom:0">
                    <el-input v-model="form.contactPhone" size="mini" placeholder="请输入联系电话" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">简介:</span>
            <div style="width:100%">
                <el-form-item prop="introduce" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.introduce" size="mini" placeholder="请输入简介" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">详细介绍:</span>
            <div style="width:100%">
                <el-form-item prop="content" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.content" size="mini" placeholder="请输入详细介绍" autocomplete="off"></el-input>
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
                        :limit="5"
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
  import {saveSysCulture} from '../../../api/api'
  export default {
    mixins: [mixin],
    data() {
      return{
        formLabelWidth: '80px',
        form: {
          name: "",
          price: "",
          cultureType: "",
          location: "",
          activityTime: "",
          activityTimeRange: [],
          maxParticipants: "",
          contactPhone: "",
          introduce: "",
          content: "",
          images: ""
        },
        fileList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        rules: {
          name: [
            { required: true, message: '请输入活动名称', trigger: 'blur' },
            { min: 2, max: 50, message: '活动名称长度应在2-50个字符', trigger: 'blur' }
          ],
          price: [
            { required: true, message: '请输入活动费用', trigger: 'blur' },
            { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: '请输入正确的费用格式', trigger: 'blur' }
          ],
          cultureType: [
            { required: true, message: '请选择活动类型', trigger: 'change' },
          ],
          location: [
            { required: true, message: '请输入活动地点', trigger: 'blur' },
            { min: 2, max: 100, message: '活动地点长度应在2-100个字符', trigger: 'blur' }
          ],
          activityTime: [
            { required: true, message: '请输入活动时间', trigger: 'blur' },
          ],
          maxParticipants: [
            { required: true, message: '请输入人数限制', trigger: 'blur' },
            { pattern: /^[1-9]\d*$/, message: '人数限制必须是正整数', trigger: 'blur' }
          ],
          contactPhone: [
            { required: true, message: '请输入联系电话', trigger: 'blur' },
            { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
          ],
          introduce: [
            { required: true, message: '请输入简介', trigger: 'blur' },
            { min: 10, max: 200, message: '简介长度应在10-200个字符', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '请输入详细介绍', trigger: 'blur' },
            { min: 20, max: 1000, message: '详细介绍长度应在20-1000个字符', trigger: 'blur' }
          ],
        },
      }
    },
    props: ['addVisible'],
    methods: {
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
          message: '最多只能上传5张图片'
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
      handleActivityTimeChange(val) {
        if (val && val.length === 2) {
          this.form.activityTime = val[0] + ' 至 ' + val[1];
        } else {
          this.form.activityTime = '';
        }
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
            saveSysCulture(this.form).then(res => {
              if(res.code == 1000) {
                this.$notify({
                  title: '成功',
                  message: '新增成功',
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
        this.$emit('addFalse')
      }
    }
  }
</script> 
<template>
<div>
  <el-dialog title="新增美食推荐" width="40%" :destroy-on-close="true" :visible.sync="addVisible" :before-close="handleClose">
    <el-form :model="form" :rules="rules" ref="ruleForm">
      <el-row :gutter="10">
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                美食名称:
                </span>
            <div style="width:100%">
                <el-form-item prop="name" style="margin-bottom:0">
                    <el-input v-model="form.name" size="mini" placeholder="请输入美食名称" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                价格:
                </span>
            <div style="width:100%">
                <el-form-item prop="price" style="margin-bottom:0">
                    <el-input type="number" v-model="form.price" size="mini" placeholder="请输入价格" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                美食类型:
                </span>
            <div style="width:100%">
                <el-form-item prop="foodType" style="margin-bottom:0">
                    <el-select v-model="form.foodType" size="mini" placeholder="请选择美食类型" style="width:100%">
                        <el-option label="川菜" value="川菜"></el-option>
                        <el-option label="湘菜" value="湘菜"></el-option>
                        <el-option label="粤菜" value="粤菜"></el-option>
                        <el-option label="鲁菜" value="鲁菜"></el-option>
                        <el-option label="苏菜" value="苏菜"></el-option>
                        <el-option label="浙菜" value="浙菜"></el-option>
                        <el-option label="闽菜" value="闽菜"></el-option>
                        <el-option label="徽菜" value="徽菜"></el-option>
                        <el-option label="小吃" value="小吃"></el-option>
                        <el-option label="甜品" value="甜品"></el-option>
                        <el-option label="其他" value="其他"></el-option>
                    </el-select>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                推荐餐厅:
                </span>
            <div style="width:100%">
                <el-form-item prop="restaurant" style="margin-bottom:0">
                    <el-input v-model="form.restaurant" size="mini" placeholder="请输入推荐餐厅" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                营业时间:
                </span>
            <div style="width:100%">
                <el-form-item prop="businessHours" style="margin-bottom:0">
                    <el-time-picker
                        is-range
                        v-model="form.businessHoursRange"
                        range-separator="至"
                        start-placeholder="开始时间"
                        end-placeholder="结束时间"
                        placeholder="选择营业时间"
                        format="HH:mm"
                        value-format="HH:mm"
                        @change="handleBusinessHoursChange"
                        size="mini"
                        style="width:100%">
                    </el-time-picker>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                推荐指数:
                </span>
            <div style="width:100%">
                <el-form-item prop="recommendLevel" style="margin-bottom:0">
                    <el-rate v-model="form.recommendLevel" show-text></el-rate>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                简介:
                </span>
            <div style="width:100%">
                <el-form-item prop="introduce" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.introduce" size="mini" placeholder="请输入简介" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                详细介绍:
                </span>
            <div style="width:100%">
                <el-form-item prop="content" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.content" size="mini" placeholder="请输入详细介绍" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                图片:
                </span>
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
  import {saveSysFood} from '../../../api/api'
  export default {
    mixins: [mixin],
    data() {
      return{
        formLabelWidth: '80px',
        form: {
          name: "",
          price: "",
          foodType: "",
          restaurant: "",
          businessHours: "",
          businessHoursRange: [],
          recommendLevel: 5,
          introduce: "",
          content: "",
          images: ""
        },
        fileList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        rules: {
          name: [
            { required: true, message: '请输入美食名称', trigger: 'blur' },
            { min: 2, max: 50, message: '美食名称长度应在2-50个字符', trigger: 'blur' }
          ],
          price: [
            { required: true, message: '请输入价格', trigger: 'blur' },
            { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: '请输入正确的价格格式', trigger: 'blur' }
          ],
          foodType: [
            { required: true, message: '请选择美食类型', trigger: 'change' },
          ],
          restaurant: [
            { required: true, message: '请输入推荐餐厅', trigger: 'blur' },
            { min: 2, max: 100, message: '餐厅名称长度应在2-100个字符', trigger: 'blur' }
          ],
          businessHours: [
            { required: true, message: '请输入营业时间', trigger: 'blur' },
          ],
          recommendLevel: [
            { required: true, message: '请选择推荐指数', trigger: 'change' },
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
      handleBusinessHoursChange(val) {
        if (val && val.length === 2) {
          this.form.businessHours = val[0] + '-' + val[1];
        } else {
          this.form.businessHours = '';
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
            saveSysFood(this.form).then(res => {
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
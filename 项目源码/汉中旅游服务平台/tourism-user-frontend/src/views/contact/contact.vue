<template>
  <div class="contact">
    <headers></headers>
    <div class="contact1">
      <div class="contact-header">
        <h2>联系我们</h2>
        <p>欢迎与我们联系，我们随时为您服务</p>
      </div>
      <div class="contact3">
        <div class="contact-card" v-for="(item,index) in tableData" :key="index">
          <div class="contact-image" v-if="item.images && item.images.trim() !== ''">
            <img :src="$store.state.HOST + item.images.split(',')[0]">
          </div>
          <div class="contact-content">
            <div class="contact-title">{{item.title}}</div>
            <div class="contact-info">
              <div class="contact-item">
                <i class="el-icon-phone"></i>
                <span>电话：{{item.phone}}</span>
              </div>
              <div class="contact-item" v-if="item.email">
                <i class="el-icon-message"></i>
                <span>邮箱：{{item.email}}</span>
              </div>
              <div class="contact-item" v-if="item.address">
                <i class="el-icon-location"></i>
                <span>地址：{{item.address}}</span>
              </div>
              <div class="contact-item" v-if="item.workTime">
                <i class="el-icon-time"></i>
                <span>工作时间：{{item.workTime}}</span>
              </div>
            </div>
            <div class="contact-description" v-if="item.content">
              {{item.content}}
            </div>
          </div>
        </div>
      </div>
      
      <div class="contact-form-section">
        <h3>在线留言</h3>
        <div class="contact-form">
          <el-form :model="messageForm" :rules="messageRules" ref="messageForm">
            <el-row :gutter="20">
              <el-col :span="12">
                <el-form-item prop="name">
                  <el-input v-model="messageForm.name" placeholder="您的姓名"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item prop="phone">
                  <el-input v-model="messageForm.phone" placeholder="联系电话"></el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-form-item prop="email">
                  <el-input v-model="messageForm.email" placeholder="电子邮箱（选填）"></el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-form-item prop="subject">
                  <el-input v-model="messageForm.subject" placeholder="留言主题"></el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-form-item prop="message">
                  <el-input type="textarea" :rows="5" v-model="messageForm.message" placeholder="请输入您的留言内容"></el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-button type="primary" @click="submitMessage" style="width:100%">提交留言</el-button>
              </el-col>
            </el-row>
          </el-form>
        </div>
      </div>
    </div>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysContactPage, saveSysMessage} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        search: {
          state: 1,
          pageSize: 20,
          pageNumber: 1,
        },
        tableData: [],
        messageForm: {
          name: '',
          phone: '',
          email: '',
          subject: '',
          message: ''
        },
        messageRules: {
          name: [
            { required: true, message: '请输入您的姓名', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '请输入联系电话', trigger: 'blur' },
            { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
          ],
          email: [
            { type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }
          ],
          subject: [
            { required: true, message: '请输入留言主题', trigger: 'blur' }
          ],
          message: [
            { required: true, message: '请输入留言内容', trigger: 'blur' },
            { min: 10, message: '留言内容不能少于10个字符', trigger: 'blur' }
          ]
        }
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      getSysContactPage() {
        getSysContactPage(this.search).then(res => {
          if (res.code == 1000) {
            this.tableData = res.data.records.sort((a, b) => a.sortOrder - b.sortOrder)
          }
        })
      },
      submitMessage() {
        this.$refs.messageForm.validate((valid) => {
          if (valid) {
            // 调用后端API保存留言
            saveSysMessage(this.messageForm).then(res => {
              if (res.code == 1000) {
                this.$message({
                  message: '留言提交成功！我们会尽快与您联系',
                  type: 'success'
                });
                this.$refs.messageForm.resetFields();
              } else {
                this.$message.error(res.message || '留言提交失败，请稍后重试');
              }
            }).catch(err => {
              console.error('留言提交失败:', err);
              this.$message.error('网络异常，请稍后重试');
            });
          }
        });
      }
    },
    created() {
     
    },
    mounted() {
      this.getSysContactPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/contact.css');
</style> 
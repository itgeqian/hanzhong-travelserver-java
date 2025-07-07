<template>
  <div class="cultureInfo">
    <headers></headers>
    <div class="cultureInfo1">
        <div class="cultureInfo2">
            <div class="cultureInfo3">
                <el-carousel height="500px" v-if="info.images">
                    <el-carousel-item v-for="(item,index) in info.images.split(',')" :key="index">
                        <img style="width:100%;height:100%" :src="$store.state.HOST + item">
                    </el-carousel-item>
                </el-carousel>
                <div v-else style="width:100%;height:500px;display:flex;align-items:center;justify-content:center;background:#f5f5f5;">
                    <span style="color:#999;">暂无图片</span>
                </div>
            </div>
            <div class="cultureInfo4">
                <div class="cultureInfo5">{{info.name}}</div>
                <div class="cultureInfo5">活动费用：￥{{info.price}}</div>
                <div style="margin-left:20px;margin-top:10px">活动类型：{{info.cultureType}}</div>
                <div style="margin-left:20px;margin-top:10px">活动地点：{{info.location}}</div>
                <div style="margin-left:20px;margin-top:10px">活动时间：{{info.activityTime}}</div>
                <div style="margin-left:20px;margin-top:10px">人数限制：{{info.maxParticipants}}人</div>
                <div style="margin-left:20px;margin-top:10px">联系电话：{{info.contactPhone}}</div>
                <div class="cultureInfo6">{{info.introduce}}</div>
                <div class="cultureInfo7" style="margin-left:15px">
                    <el-button size="small" type="primary" plain @click="participateActivity">参与活动</el-button>
                    <!-- 收藏功能暂未实现，后期再开发 -->
                    <!-- <el-button size="small" type="success" plain @click="addToFavor" style="margin-left:10px">收藏活动</el-button> -->
                </div>
            </div>
        </div>
    </div>
    <div class="cultureInfo1">
        <div class="cultureInfo8" >
            <div style="margin-left:20px;margin-right:20px;margin-top:20px;margin-bottom:20px">
                详细介绍：{{info.content}}
            </div>
        </div>
    </div>
    <div class="cultureInfo1">
        <div class="cultureInfo8">
            <el-input style="margin-top:20px" v-model="content" type="textarea" rows="7" placeholder="请输入评论内容"></el-input>
           <el-rate v-model="score"></el-rate>
            <el-button style="margin-top:20px" type="primary" size="small" plain @click="saveSysComments">评论</el-button>
            <div class="forum1" style="width:100%">
                <div class="forum2" style="padding:0" v-for="(item,index) in tableData" :key="index">
                    <img style="border-radius:50%;width:40px;height:40px;margin-left:20px" :src="$store.state.HOST + item.avatar">
                    <div style="margin-left:10px">
                        {{item.createBy}}
                    </div>
                    <div style="margin-left:20px">
                        {{item.content}}
                    </div>
                </div>
            </div>
            <el-pagination
                background
                :page-size="search.pageSize"
                layout="prev, pager, next"
                @current-change="handleCurrentChange"
                :total="total">
            </el-pagination>
        </div>
    </div>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysCultureById,getSysCommentsPage,saveSysComments} from '../../api/api'
  // import {saveSysFavor} from '../../api/api' // 收藏功能暂未实现
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        id: "",
        search: {
          cultureId: "",
          pageSize: 10,
          pageNumber: 1,
        },
        info: {},
        total:0,
        tableData: [],
        content: "",
        score: null,
        userId: null,
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      saveSysComments() {
          if (!this.content) {
            this.$message({
                message: '请输入评论内容',
                type: 'warning'
            });
            return
          }
          var param = {
              content: this.content,
              score:this.score,
              cultureId: this.id,
              userId:this.userId
          }
          saveSysComments(param).then(res => {
              if (res.code == 1000) {
                this.$message({
                    message: '评论成功',
                    type: 'success'
                });
                this.content = ""
                this.getSysCommentsPage()
              }
          })
      },
      getSysCommentsPage() {
          this.search.cultureId = this.id
          getSysCommentsPage(this.search).then(res => {
            if (res.code == 1000) {
                this.tableData = res.data.records
                this.total = res.data.total
            }
          })
      },
      participateActivity() {
          if (!this.userId) {
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
            return
          }
          this.$confirm('确认参与该汉文化活动吗？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.$message({
                message: '参与成功！请联系活动方确认具体安排',
                type: 'success'
            });
          });
      },
      /* 收藏功能暂未实现，后期再开发
      addToFavor() {
          if (!this.userId) {
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
            return
          }
          var param = {
              type: 'culture',
              targetId: this.id,
              userId: this.userId
          }
          saveSysFavor(param).then(res => {
              if (res.code == 1000) {
                this.$message({
                    message: '收藏成功',
                    type: 'success'
                });
              } else {
                this.$message({
                    message: res.message,
                    type: 'warning'
                });
              }
          })
      },
      */
      getSysCultureById() {
          getSysCultureById({id:this.id}).then(res => {
            if (res.code == 1000) {
                this.info = res.data
            }
          })
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysCommentsPage()
      }, 
    },
    created() {
      this.id = this.$route.query.id
      // 从localStorage获取用户信息
      const userInfo = window.localStorage.getItem("user_info")
      if(userInfo) {
        try {
          const userData = JSON.parse(userInfo)
          this.userId = userData.id
          console.log('用户ID:', this.userId)
        } catch (e) {
          console.log('解析用户信息失败:', e)
          this.userId = null
        }
      } else {
        console.log('未找到用户信息')
        this.userId = null
      }
    },
    mounted() {
      this.getSysCultureById()
      this.getSysCommentsPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/culture.css');
</style> 